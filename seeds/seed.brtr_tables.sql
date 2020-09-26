BEGIN;

INSERT INTO
  brtr_users (
  first_name,
  last_name,
  user_name,
  password,
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
  
  
  INSERT INTO brtr_service
   (user_id, service_offered, service_seeking, date_created)
  VALUES
  (1, 'Lawn mowing', 'Hair styling', now() - '1 days'::INTERVAL),
  (2, 'Hair styling','Lawn mowing', now() - '2 days'::INTERVAL);
   
  COMMIT;