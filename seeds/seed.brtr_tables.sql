BEGIN;

INSERT INTO
  brtr_users (
    first_name,
    last_name,
    user_name,
    PASSWORD,
    email,
    zip_code
  )
VALUES
  (
    'John',
    'One',
    'JOne',
    '$2a$11$q5xJtsRSj1RJ1R6tTQOFVezlP5k/p4oSmptkWwG9WntsLb95YHaeO',
    'OneJ@email.com',
    11111
  ),
  (
    'Tim',
    'Two',
    'TTwo',
    '$2a$11$yEBMQ89kNQlIDxDJRBqdSujvO2/OUJOdwV//Z9HksGypYYbAPLPFC',
    'TwoT@email.com',
    1112
  );

INSERT INTO
  brtr_skill (
    user_id,
    skill_offered,
    skill_seeking,
    skill_desc,
    date_created
  )
VALUES
  (
    1,
    'Lawn mowing',
    'Hair styling',
    'Will mow lawn for a hair cut',
    NOW() - '1 days' :: INTERVAL
  ),
  (
    2,
    'Hair styling',
    'Lawn mowing',
    'Will cut hair for having lawn mowed',
    NOW() - '2 days' :: INTERVAL
  );

COMMIT;