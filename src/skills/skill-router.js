const path = require('path');
const express = require('express');
const SkillService = require('./skill-service');
const { requireAuth } = require('../middleware/jwt-auth');

const skillRouter = express.Router();
const jsonBodyParser = express.json();


skillRouter
  .route('/')
  .get((req, res, next) => {
    SkillService.getAllSkills(req.app.get('db'))
      .then(skills => {
        res.json(SkillService.serializeSkills(skills));
      })
      .catch(next);
  })
  .post(jsonBodyParser, (req, res, next) => {
    const { skill_offered, skill_seeking, skill_desc ,user_id } = req.body;
    const newSkill = { skill_offered, skill_seeking, skill_desc ,user_id };

    for (const [key, value] of Object.entries(newSkill))
      // eslint-disable-next-line eqeqeq
      if (value == null)
        return res.status(400).json({
          error: { message: `Missing '${key}' in request body` }
        });

    SkillService.insertSkill(req.app.get('db'), newSkill)
      .then(skill => {
        res.status(201)
          .location(path.posix.join(req.originalUrl, `/${skill.id}`))
          .json(SkillService.serializeSkill(skill));
      })
      .catch(next);
  });

skillRouter
  .route('/:id')
  //.all(requireAuth)
  .all((req, res, next) => {
    SkillService.getById(
      req.app.get('db'),
      req.params.id
    )
      .then(skill => {
        if (!skill) {
          return res.status(404).json({
            error: { message: 'Skill doesn\'t exist' }
          });
        }
        res.skill = skill;
        next();
      })
      .catch(next);
  })
  .get((req, res) => {
    res.json(SkillService.serializeSkill(res.skill));
  })
  .delete((req, res, next) => {
    SkillService.deleteSkill(
      req.app.get('db'),
      req.params.id
    )
      .then(() => {
        res.status(204).end();
      })
      .catch(next);
  })
  .patch(jsonBodyParser, (req, res, next) => {
    const { skill_offered, skill_seeking, skill_desc } = req.body;
    const skillToUpdate = { skill_offered, skill_seeking, skill_desc };

    const numberOfValues = Object.values(skillToUpdate).filter(Boolean).length;
    if (numberOfValues === 0) {
      return res.status(400).json({
        error: {
          message: 'Request body must contain \'content\''
        }
      });
    }

    SkillService.updateSkill(
      req.app.get('db'),
      req.params.id,
      skillToUpdate
    )
      .then(numRowsAffected => {
        res.status(204).end();
      })
      .catch(next);
  });

module.exports = skillRouter;