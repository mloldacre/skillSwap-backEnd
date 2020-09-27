const path = require('path');
const express = require('express');
const ServiceService = require('./skill-service');
const { requireAuth } = require('../middleware/jwt-auth');

const serviceRouter = express.Router();
const jsonBodyParser = express.json();


serviceRouter
  .route('/')
  .get((req, res, next) => {
    ServiceService.getAllServices(req.app.get('db'))
      .then(services => {
        res.json(ServiceService.serializeServices(services));
      })
      .catch(next);
  })
  .post(jsonBodyParser, (req, res, next) => {
    const { service_offered, service_seeking, user_id } = req.body;
    const newService = { service_offered, service_seeking, user_id };

    for (const [key, value] of Object.entries(newService))
      // eslint-disable-next-line eqeqeq
      if (value == null)
        return res.status(400).json({
          error: { message: `Missing '${key}' in request body` }
        });

    ServiceService.insertService(req.app.get('db'), newService)
      .then(service => {
        res.status(201)
          .location(path.posix.join(req.originalUrl, `/${service.id}`))
          .json(ServiceService.serializeService(service));
      })
      .catch(next);
  });

serviceRouter
  .route('/:id')
  //.all(requireAuth)
  .all((req, res, next) => {
    ServiceService.getById(
      req.app.get('db'),
      req.params.id
    )
      .then(service => {
        if (!service) {
          return res.status(404).json({
            error: { message: 'Service doesn\'t exist' }
          });
        }
        res.service = service;
        next();
      })
      .catch(next);
  })
  .get((req, res) => {
    res.json(ServiceService.serializeService(res.service));
  })
  .delete((req, res, next) => {
    ServiceService.deleteService(
      req.app.get('db'),
      req.params.id
    )
      .then(() => {
        res.status(204).end();
      })
      .catch(next);
  })
  .patch(jsonBodyParser, (req, res, next) => {
    const { service_offered, service_seeking } = req.body;
    const serviceToUpdate = { service_offered, service_seeking };

    const numberOfValues = Object.values(serviceToUpdate).filter(Boolean).length;
    if (numberOfValues === 0) {
      return res.status(400).json({
        error: {
          message: 'Request body must contain \'content\''
        }
      });
    }

    ServiceService.updateService(
      req.app.get('db'),
      req.params.id,
      serviceToUpdate
    )
      .then(numRowsAffected => {
        res.status(204).end();
      })
      .catch(next);
  });

module.exports = serviceRouter;