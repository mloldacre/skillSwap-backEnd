const xss = require('xss');

const ServiceService = {
  getAllServices(knex) {
    return knex.select('*').from('brtr_service');
  },

  getServicesForScribe(knex, scribeId) {
    return knex.select('*').from('brtr_service')
      .where('scribe_id', scribeId);
  },

  insertService(knex, newService) {
    return knex
      .insert(newService)
      .into('brtr_service')
      .returning('*')
      .then(rows => {
        return rows[0];
      });
  },

  getById(knex, id) {
    return knex
      .from('brtr_service')
      .select('*')
      .where('id', id)
      .first();
  },

  deleteService(knex, id) {
    return knex('brtr_service')
      .where({ id })
      .delete();
  },

  updateService(knex, id, newServiceFields) {
    return knex('brtr_service')
      .where({ id })
      .update(newServiceFields);
  },


  serializeServices(services) {
    return services.map(this.serializeService);
  },

  serializeService(service) {
    return {
      id: service.id,
      service_offered: xss(service.service_offered),
      service_seeking: xss(service.service_seeking),
      date_created: service.date_created,
      user_id: service.user_id
    };
  }

};

module.exports = ServiceService;