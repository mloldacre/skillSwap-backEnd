const xss = require('xss');

const SKillSkill = {
  getAllSkills(knex) {
    return knex.select('*').from('brtr_skill');
  },

  getSkillsForUser(knex, userId) {
    return knex.select('*').from('brtr_skill')
      .where('user_id', userId);
  },

  insertSkill(knex, newSkill) {
    return knex
      .insert(newSkill)
      .into('brtr_skill')
      .returning('*')
      .then(rows => {
        return rows[0];
      });
  },

  getById(knex, id) {
    return knex
      .from('brtr_skill')
      .select('*')
      .where('id', id)
      .first();
  },

  deleteSkill(knex, id) {
    return knex('brtr_skill')
      .where({ id })
      .delete();
  },

  updateSkill(knex, id, newSkillFields) {
    return knex('brtr_skill')
      .where({ id })
      .update(newSkillFields);
  },


  serializeSkills(skills) {
    return skills.map(this.serializeSkill);
  },

  serializeSkill(skill) {
    return {
      id: skill.id,
      skill_offered: xss(skill.skill_offered),
      skill_seeking: xss(skill.skill_seeking),
      skill_desc: xss(skill.skill_desc),
      date_created: skill.date_created,
      user_id: skill.user_id
    };
  }

};

module.exports = SKillSkill;