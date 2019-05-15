-- setup
CREATE TABLE flights (
    id SERIAL PRIMARY KEY,
    `from` VARCHAR(20),
    `to` VARCHAR(20)
);

INSERT INTO flights
  (`from`, `to`)
VALUES
  ('moscow', 'omsk'),
  ('novgorod', 'kazan'),
  ('irkutsk', 'moscow'),
  ('omsk', 'irkutsk'),
  ('moscow', 'kazan');


CREATE TABLE cities (
    label VARCHAR(20),
    name VARCHAR(20)
);

INSERT INTO cities
  (label, name)
VALUES
  ('moscow', 'Москва'),
  ('irkutsk', 'Иркутск'),
  ('novgorod', 'Новгород'),
  ('kazan', 'Казань'),
  ('omsk', 'Омск');  

-- ######################
-- ### solution
-- ######################

-- subquery
SELECT
    id,
    (
        SELECT name FROM cities WHERE label = `from`
    ) AS `from`,
    (
        SELECT name FROM cities WHERE label = `to`
    ) AS `to`
FROM
    flights;

-- join
SELECT
    f.id,
    cf.name,
    ct.name
FROM
    flights AS f
    JOIN cities AS cf ON f.`from` = cf.label
    JOIN cities AS ct ON f.`to` = ct.label
ORDER BY
    f.id;
    
-- ######################
-- ### result
-- ######################
/*
    +----+------------------+----------------+
    | id | from             | to             |
    +----+------------------+----------------+
    |  1 | Москва           | Омск           |
    |  2 | Новгород         | Казань         |
    |  3 | Иркутск          | Москва         |
    |  4 | Омск             | Иркутск        |
    |  5 | Москва           | Казань         |
    +----+------------------+----------------+
*/