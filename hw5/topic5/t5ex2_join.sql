-- ######################
-- ### solution
-- ######################

-- subquery
SELECT
    id,
    name,
    description,
    price,
    (
        SELECT name FROM catalogs WHERE id = catalog_id
    ) AS catalog_name,
    created_at,
    updated_at
FROM
    products;

-- join
SELECT
    p.id,
    p.name,
    p.description,
    p.price,
    c.name AS catalog_name,
    p.created_at,
    p.updated_at
FROM
    products AS p
LEFT JOIN
    catalogs AS c
ON p.catalog_id = c.id;

-- ######################
-- ### result
-- ######################
/*
*************************** 1. row ***************************
          id: 1
        name: Intel Core i3-8100
 description: Процессор для настольных персональных компьютеров, основанных на платформе Intel.
       price: 7890.00
catalog_name: Процессоры
  created_at: 2019-05-16 00:21:56
  updated_at: 2019-05-16 00:21:56
*************************** 2. row ***************************
          id: 2
        name: Intel Core i5-7400
 description: Процессор для настольных персональных компьютеров, основанных на платформе Intel.
       price: 12700.00
catalog_name: Процессоры
  created_at: 2019-05-16 00:21:56
  updated_at: 2019-05-16 00:21:56
*/