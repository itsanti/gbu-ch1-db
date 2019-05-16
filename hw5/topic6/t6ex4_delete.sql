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