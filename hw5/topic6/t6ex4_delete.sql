-- setup
CREATE TABLE days (
  id SERIAL PRIMARY KEY,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO days
  (created_at)
VALUES
    ('2019-04-01'), ('2019-04-04'),
    ('2019-04-11'), ('2019-04-21'),
    ('2019-05-01'), ('2019-05-02'),
    ('2019-05-03'), ('2019-05-04');

-- ######################
-- ### solution
-- ######################
DELETE FROM
   days
WHERE
    id IN (
        SELECT * FROM (
            SELECT
                id
            FROM
                days
            ORDER BY
                created_at DESC
            LIMIT 18446744073709551615 OFFSET 5
        ) AS tmp
    );

-- count rows

SET @row = (SELECT COUNT(*) FROM days);

CREATE TEMPORARY TABLE result (id BIGINT UNSIGNED);

PREPARE stm FROM
    'INSERT INTO
        result
    SELECT
        id
    FROM
        days
    ORDER BY
        created_at DESC
    LIMIT ? OFFSET 5';
EXECUTE stm USING @row;

DELETE FROM
    days
WHERE
    id IN (
        SELECT * FROM result
    );

-- ######################
-- ### solution 2
-- ######################
START TRANSACTION;

PREPARE daydel FROM
'DELETE FROM days ORDER BY created_at LIMIT ?';

SET @total = (SELECT COUNT(*) - 5 FROM days);

EXECUTE daydel USING @total;

COMMIT;

-- self join
DELETE
    posts
FROM
    posts
JOIN
    (
        SELECT
            created_at
        FROM
            posts
        ORDER BY
            created_at DESC
    ) AS delpst
ON
    posts.created_at <= delpst.created_at;