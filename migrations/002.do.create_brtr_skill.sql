CREATE TABLE brtr_skill (
  id SERIAL PRIMARY KEY,
  skill_offered TEXT NOT NULL,
  skill_seeking TEXT NOT NULL,
  skill_desc TEXT NOT NULL,
  date_created DATE DEFAULT NOW() NOT NULL,
  skill_zip INTEGER NOT NULL,
  user_id INTEGER REFERENCES brtr_users(id) ON DELETE CASCADE NOT NULL
);