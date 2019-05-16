-- setup
CREATE TABLE accounts (
  id SERIAL PRIMARY KEY,
  name VARCHAR(50),
  password VARCHAR(255)
);

-- filldb
INSERT INTO
  `accounts` (`id`, `name`, `password`)
VALUES
  ('1', 'sunt', '0ae3676da716a3c642b98797060275cf58eac515'),
  ('2', 'perferendis', '495537bd9dbc88c5891e4911e80fcc44270985ca'),
  ('3', 'iusto', 'dbe5461885a25d7024eb3f6812c7260015b48b27'),
  ('4', 'voluptatem', 'a8e64ffda6223c14fe022f9ddcd4342ed84dc4be'),
  ('5', 'ratione', '466e50a90686ccd33249fd46a8929d6405ee0719'),
  ('6', 'officia', '388bbf7a3594caccea3e3bb5d3183bab2ba2a5f9'),
  ('7', 'vel', '7dd7e66c6f2890f6a9be4d27f49027f00a1ab3d6'),
  ('8', 'delectus', '2c8e9db67c7a526de9a682b4a244856072af9bc4'),
  ('9', 'molestias', 'aa2bf1f92710de41f544c7e85076ae8814f97c5a'),
  ('10', 'voluptatem', 'a42ed40d2f5551dcc0b289868819a13e3b868ba6');

-- ######################
-- ### solution
-- ######################

-- create view
CREATE VIEW
  username
AS
  SELECT
    id, name
  FROM
    accounts;

-- create user
GRANT SELECT ON sample.username
TO user_read@'%' IDENTIFIED BY '123';

-- ######################
-- ### result
-- ######################
/*
  mysql> show tables;
  +------------------+
  | Tables_in_sample |
  +------------------+
  | username         |
  +------------------+
  1 row in set (0.00 sec)

mysql> SELECT * FROM accounts;
ERROR 1142 (42000): SELECT command denied to user 'user_read'@'localhost' for table 'accounts'

mysql> SELECT * FROM username;
+----+-------------+
| id | name        |
+----+-------------+
|  1 | sunt        |
|  2 | perferendis |
|  3 | iusto       |
|  4 | voluptatem  |
|  5 | ratione     |
|  6 | officia     |
|  7 | vel         |
|  8 | delectus    |
|  9 | molestias   |
| 10 | voluptatem  |
+----+-------------+
10 rows in set (0.00 sec)
*/