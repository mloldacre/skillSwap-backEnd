const path = require('path');
const express = require('express');
const ServiceService = require('./service-service');
const { requireAuth } = require('../middleware/jwt-auth');

const serviceRouter = express.Router();
const jsonBodyParser = express.json();


serviceRouter
  .route('/')
  .get((req, res, next) => {
    ServiceService.getAllServices(req.app.get('db'))
      .then(Services => {
        res.json(ServiceService.serializeServices(Services));
      })
      .catch(next);
  })
  .post(jsonBodyParser, (req, res, next) => {
    const { Service_type, Service_content, scribe_id, user_id } = req.body;
    const newService = { Service_type, Service_content, scribe_id, user_id };

    for (const [key, value] of Object.entries(newService))
      // eslint-disable-next-line eqeqeq
      if (value == null)
        return res.status(400).json({
          error: { message: `Missing '${key}' in request body` }
        });

    ServiceService.insertService(req.app.get('db'), newService)
      .then(Service => {
        res.status(201)
          .location(path.posix.join(req.originalUrl, `/${Service.id}`))
          .json(ServiceService.serializeService(Service));
      })
      .catch(next);
  });

serviceRouter
  .route('/for_scribe/:scribe_id')
  .all(requireAuth)
  .all((req, res, next) => {
    ServiceService.getServicesForScribe(
      req.app.get('db'),
      req.params.scribe_id)
      .then(Services => {
        if (!Services) {
          return res.status(404).json({
            error: { message: 'Services don\'t exist' }
          });
        }
        res.Services = Services;
        next();
      })
      .catch(next);
  })
  .get((req, res) => {
    res.json(res.Services.map(Service => ServiceService.serializeService(Service)));
  });

serviceRouter
  .route('/:Service_id')
  .all(requireAuth)
  .all((req, res, next) => {
    ServiceService.getById(
      req.app.get('db'),
      req.params.Service_id
    )
      .then(Service => {
        if (!Service) {
          return res.status(404).json({
            error: { message: 'Service doesn\'t exist' }
          });
        }
        res.Service = Service;
        next();
      })
      .catch(next);
  })
  .get((req, res) => {
    res.json(ServiceService.serializeService(res.Service));
  })
  .delete((req, res, next) => {
    ServiceService.deleteService(
      req.app.get('db'),
      req.params.Service_id
    )
      .then(() => {
        res.status(204).end();
      })
      .catch(next);
  })
  .patch(jsonBodyParser, (req, res, next) => {
    const { Service_content } = req.body;
    const ServiceToUpdate = { Service_content };

    const numberOfValues = Object.values(ServiceToUpdate).filter(Boolean).length;
    if (numberOfValues === 0) {
      return res.status(400).json({
        error: {
          message: 'Request body must contain \'content\''
        }
      });
    }

    ServiceToUpdate.time_created = new Date();

    ServiceService.updateService(
      req.app.get('db'),
      req.params.Service_id,
      ServiceToUpdate
    )
      .then(numRowsAffected => {
        res.status(204).end();
      })
      .catch(next);
  });

module.exports = serviceRouter;