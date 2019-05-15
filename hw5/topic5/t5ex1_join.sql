-- setup
INSERT INTO orders
  (user_id)
VALUES
  (1), (3), (5), (3);

-- ######################
-- ### solution
-- ######################

-- subquery
SELECT
    id, name
FROM
    users
WHERE
    id IN (
        SELECT DISTINCT user_id FROM orders
    );

-- join
SELECT DISTINCT
    users.id, users.name
FROM
    users JOIN orders on users.id = orders.user_id;

-- ######################
-- ### result
-- ######################
/*
    +----+--------------------+
    | id | name               |
    +----+--------------------+
    |  1 | Геннадий           |
    |  3 | Александр          |
    |  5 | Иван               |
    +----+--------------------+
*/