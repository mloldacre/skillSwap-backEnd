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
    '1@email.com',
    11111
  ),
  (
    'Tim',
    'Two',
    'TTwo',
    '$2a$11$yEBMQ89kNQlIDxDJRBqdSujvO2/OUJOdwV//Z9HksGypYYbAPLPFC',
    '2@email.com',
    11112
  ),
  (
    'Jane',
'Three',
'JThree',
'$2a$11$Lxo5ZN1sTH/.nzIIGORlbePDO9IbVpPtw3Jg7s4Hwz7mMLCRC6Pfa',
'ThreeJ@email.com',
    11113
  ),
  (
    'Mark',
'Four',
'MFour',
'$2a$11$9oQV8dzoIEAW9NekVmYyA.Nx75W4VjE1U4SVH3pvAUlwLtIFmYfl6',
'FourM@email.com',
    11114
  ),
  (
    'Louis',
'Five',
'LFive',
'$2a$11$tv3IkrZpKynYK3.gUq.ZaOVf8vFf5TgLPT0NDBu9GRXDjBFgXrIqe',
'FiveL@email.com',
    11115
  ),
  (
   'Jim',
'Six',
'JSix',
'$2a$11$xWE4v5LU9kMH6X7Lj5PSTeNK9qJi3YNEmoLftsh9SkzGkz0QbSDoG',
'SixJ@email.com',
    21111
  ),
  (
    'Kevin',
'Seven',
'KSeven',
'$2a$11$VuJyliriOFQUKDHiOGwwz..To9Rc3DQFd4t6mkvB3ZRDgRtqPcabO',
'SevenK@email.com',
    21112
  ),
  (
    'Sue',
'Eight',
'SEight',
'$2a$11$2.frdQ8FRLyPBlGUNaDJp.XkHCczcVOy2itJU/HUIRt2P.89oVAUa',
'EightS@email.com',
    21113
  ),
  (
'Pat',
'Nine',
'PNine',
'$2a$11$B/YZe0MaMDhcZB.Cmj6MkOuvS0weDYSUyjXxwl.jpHPz5tfEY.TOS',
'NineP@email.com',
    21114
  ),
  (
'Gina',
'Ten',
'GTen',
'$2a$11$fp8hPUfllPE6urXgkYctSe37LgaOXOpNUxNbB8HdxzvFelBAvFPjm',
'TenG@email.com',
    21115
  );

INSERT INTO
  brtr_skill (
    user_id,
    skill_offered,
    skill_seeking,
    skill_desc,
    skill_zip,
    date_created
  )
VALUES
  (
    1,
    'Technology/Computers',
    'HairStyling/Barber',
    'Will fix computer for haircut',
    11111,
    NOW() - '1 days' :: INTERVAL
  ),
  (
    2,
    'Arts/Entertainment/Hobby',
    'Culinary',
    'Will teach photograpy for brunch',
    11112,
    NOW() - '2 days' :: INTERVAL
  ),
  (
    3,
    'HairStyling/Barber',
    'Technology/Computers',
    'Will cut hair for PC setup',
    11113,
    NOW() - '3 days' :: INTERVAL
  ),
  (
    4,
    'Culinary',
    'Arts/Entertainment/Hobby',
    'Will cook for photoshop lessons',
    11114,
    NOW() - '2 days' :: INTERVAL
  ),
  (
    5,
    'Construction/Handyman',
    'Education/Tutoring',
    'Will mow lawn for math tutor',
    11115,
    NOW() - '3 days' :: INTERVAL
  ),
  (
    6,
    'Fitness/Training',
    'Automotive/Mechanical',
    'I will train you for a tire rotation',
    21111,
    NOW() - '1 days' :: INTERVAL
  ),
  (
    7,
    'Education/Tutoring',
    'Technology/Computers',
    'I will train you in the art of philosophy just to fix my computer!!',
    21112,
    NOW() - '2 days' :: INTERVAL
  ),
  (
    8,
    'Automotive/Mechanical',
    'Fitness/Training',
    'Looking to work on car for strength training',
    21113,
    NOW() - '3 days' :: INTERVAL
  ),
  (
    9,
    'Culinary',
    'Construction/Handyman',
    'I will bake a strawberry shortcake for whoever can fix my door',
    21114,
    NOW() - '4 days' :: INTERVAL
  ),
  (
    10,
    'Construction/Handyman',
    'Culinary',
    'Looking to fix anything for a tasty treat!!!!',
    21115,
    NOW() - '1 days' :: INTERVAL
  ),
  (
    1,
    'Education/Tutoring',
    'Automotive/Mechanical',
    'Willing to tutor in history for an oil change',
    11111,
    NOW() - '3 days' :: INTERVAL
  ),
  (
    2,
    'Construction/Handyman',
    'Culinary',
    'Seeking to teach guitar for a nice dinner',
    11112,
    NOW() - '2 days' :: INTERVAL
  ),
  (
    3,
    'HairStyling/Barber',
    'Education/Tutoring',
    'I need a language arts tutor, willing to cut or style hair',
    11113,
    NOW() - '4 days' :: INTERVAL
  ),
  (
    4,
    'Automotive/Mechanical',
    'Education/Tutoring',
    'I can perform medium level car fixes if someone can teach me the history of WWII in a week!!!!',
    11114,
    NOW() - '2 days' :: INTERVAL
  ),
  (
    5,
    'Culinary',
    'Construction/Handyman',
    'Will cook five course meal if I can get some instrument lessons for my kid',
    11115,
    NOW() - '1 days' :: INTERVAL
  ),
  (
    6,
    'Technology/Computers',
    'Fitness/Training',
    'Seeking to help with computers for personal fitness coach',
    21111,
    NOW() - '3 days' :: INTERVAL
  ),
  (
    7,
    'Arts/Entertainment/Hobby',
    'Culinary',
    'If you want to learn archery, bake me a pie!!',
    21112,
    NOW() - '3 days' :: INTERVAL
  ),
  (
    8,
    'Fitness/Training',
    'Technology/Computers',
    'Looking to train your body if you can fix my laptop',
    21113,
    NOW() - '4 days' :: INTERVAL
  ),
  (
    9,
    'Culinary',
    'Arts/Entertainment/Hobby',
    'I can make a desert for anyone that can teach me bowhunting',
    21114,
    NOW() - '5 days' :: INTERVAL
  ),
  (
    10,
    'Education/Tutoring',
    'Arts/Entertainment/Hobby',
    'I just want to take sew, I will teach you anything!!!',
    21115,
    NOW() - '5 days' :: INTERVAL
  ),
  (
    1,
    'HairStyling/Barber',
    'Culinary',
    'I can make add highlights and extensions if you can make a part platter of tacos!!',
    11111,
    NOW() - '10 days' :: INTERVAL
  ),
  (
    2,
    'Culinary',
    'HairStyling/Barber',
    'Willing to cook Latin cuisine for some hairstyling, hit me up!',
    11112,
    NOW() - '6 days' :: INTERVAL
  ),
  (
    3,
    'Automotive/Mechanical',
    'Construction/Handyman',
    'Anybody! I will fix whatever is wrong with your car if you can just fix my darn pipes!!',
    11113,
    NOW() - '7 days' :: INTERVAL
  ),
  (
    4,
    'Fitness/Training',
    'Education/Tutoring',
    'Looking to teach personal fitness routine if you can teach my chemistry',
    11114,
    NOW() - '3 days' :: INTERVAL
  ),
  (
    5,
    'Construction/Handyman',
    'Automotive/Mechanical',
    'If you need a plumber, I am willing to fix whatever, just fix my darn car!!!!!',
    11115,
    NOW() - '8 days' :: INTERVAL
  ),
  (
    6,
    'Special/Other',
    'Technology/Computers',
    'I need someone to drive me to the store on weekends, I will teach you how to code',
    21111,
    NOW() - '2 days' :: INTERVAL
  ),
  (
    7,
    'Construction/Handyman',
    'Arts/Entertainment/Hobby',
    'Need to learn how to Picasso, will clean gutters!',
    21112,
    NOW() - '5 days' :: INTERVAL
  ),
  (
    8,
    'Technology/Computers',
    'Special/Other',
    'Need to learn fullstack ASAP! I can do anything you ask (within reason)',
    21113,
    NOW() - '6 days' :: INTERVAL
  ),
  (
    9,
    'Special/Other',
    'Special/Other',
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Prodest, inquit, mihi eo esse animo. Cyrenaici quidem non recusant; Septem autem illi non suo, sed populorum suffragio omnium nominati sunt. Duo Reges: constructio interrete.',
    21114,
    NOW() - '20 days' :: INTERVAL
  ),
  (
    10,
    'Arts/Entertainment/Hobby',
    'Construction/Handyman',
    'You want to paint, clean my yard or somehting!',
    21115,
    NOW() - '1 days' :: INTERVAL
  );

COMMIT;