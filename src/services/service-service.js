const xss = require('xss');

const ServiceService = {
  getAllservices(knex) {
    return knex.select('*').from('brtr_services');
  },

  getservicesForScribe(knex, scribeId) {
    return knex.select('*').from('brtr_services')
      .where('scribe_id', scribeId);
  },

  insertService(knex, newService) {
    return knex
      .insert(newService)
      .into('brtr_services')
      .returning('*')
      .then(rows => {
        return rows[0];
      });
  },

  getById(knex, id) {
    return knex
      .from('brtr_services')
      .select('*')
      .where('id', id)
      .first();
  },

  deleteService(knex, id) {
    return knex('brtr_services')
      .where({ id })
      .delete();
  },

  updateService(knex, id, newServiceFields) {
    return knex('brtr_services')
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
      date_created: service.dated_created,
      user_id: service.user_id
    };
  }

};

module.exports = ServiceService;