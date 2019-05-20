-- setup
CREATE TABLE august (
  id SERIAL PRIMARY KEY,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO august
  (created_at)
VALUES
    ('2018-08-01'), ('2018-08-04'),
    ('2018-08-16'), ('2018-08-17');

-- ######################
-- ### solution
-- ######################
SELECT
    gen_dates.day,
    IF(august.created_at IS NOT NULL, 1, 0) AS has_day
FROM
(   -- generate days
    SELECT
        DATE(CONCAT('2018-08-', (t * 10 + u + 1))) AS day
    FROM
        (select 0 t union select 1 union select 2) AS a,
        (select 0 u union select 1 union select 2 union select 3 union select 4 union select 5 union select 6 union select 7 union select 8 union select 9) AS b
    UNION SELECT DATE('2018-08-31')
) AS gen_dates
LEFT JOIN august ON gen_dates.day = august.created_at
ORDER BY gen_dates.day;

-- ######################
-- ### solution 2
-- ######################
CREATE TEMPORARY TABLE last_days (
    day INT
);

INSERT INTO last_days VALUES
(0), (1), (2), (3), (4), (5), (6), (7), (8), (9),
(10), (11), (12), (13), (14), (15), (16), (17), (18), 1(9),
(20), (21), (22), (23), (24), (25), (26), (27), (28), (29), (30);

SELECT
    DATE(DATE('2018-08-31') - INTERVAL l.day DAY) AS day,
    NOT ISNULL(p.name) AS order_exist
FROM
    last_days AS l
LEFT JOIN
    august AS a
ON
    DATE(DATE('2018-08-31') - INTERVAL l.day DAY) = a.created_at
ORDER BY
    day;


-- ######################
-- ### result
-- ######################
/*
    +------------+---------+
    | day        | has_day |
    +------------+---------+
    | 2018-08-01 |       1 |
    | 2018-08-02 |       0 |
    | 2018-08-03 |       0 |
    | 2018-08-04 |       1 |
    | 2018-08-05 |       0 |
    | 2018-08-06 |       0 |
    ...
    | 2018-08-15 |       0 |
    | 2018-08-16 |       1 |
    | 2018-08-17 |       1 |
    | 2018-08-18 |       0 |
    ...
    | 2018-08-29 |       0 |
    | 2018-08-30 |       0 |
    | 2018-08-31 |       0 |
    +------------+---------+
*/