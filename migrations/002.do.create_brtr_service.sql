CREATE TABLE brtr_service (
  id SERIAL PRIMARY KEY,
  service_offered TEXT NOT NULL,
  service_seeking TEXT NOT NULL,
  date_created DATE DEFAULT NOW() NOT NULL,
  user_id INTEGER REFERENCES brtr_users(id) ON DELETE CASCADE NOT NULL
)