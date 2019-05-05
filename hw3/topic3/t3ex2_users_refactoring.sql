-- setup data
DROP TABLE IF EXISTS users_bad;
CREATE TABLE users_bad (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT 'Имя покупателя',
  birthday_at DATE COMMENT 'Дата рождения',
  created_at VARCHAR(16),
  updated_at VARCHAR(16)
) COMMENT = 'Неправильные покупатели';

INSERT INTO users_bad (name, created_at, updated_at) VALUES
  ('Геннадий', '20.10.2017 08:10', '20.10.2017 08:10'),
  ('Наталья', '21.10.2017 18:10', '21.10.2017 18:10'),
  ('Александр', '02.11.2017 20:20', '02.11.2017 20:20'),
  ('Сергей', '13.03.2018 07:23', '13.03.2018 07:23'),
  ('Иван', '12.12.2018 13:23', '12.12.2018 13:23'),
  ('Мария', '13.03.2019 17:40', '13.03.2019 17:40');

-- ######################
-- ### solution
-- ######################

-- create good users
DROP TABLE IF EXISTS users;
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT 'Имя покупателя',
  birthday_at DATE COMMENT 'Дата рождения',
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) COMMENT = 'Правильные покупатели';

-- copy data from users_bad. use STR_TO_DATE() to cast date
INSERT INTO
  users
SELECT
    NULL,
    name,
    birthday_at,
    STR_TO_DATE(created_at, "%d.%m.%Y %H:%i") AS created_at,
    STR_TO_DATE(updated_at, "%d.%m.%Y %H:%i") AS updated_at
FROM users_bad;

-- delete users_bad
DROP TABLE users_bad;