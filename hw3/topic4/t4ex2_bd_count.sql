-- ######################
-- ### solution
-- ######################

SELECT
    DAYOFWEEK(DATE_FORMAT(
        birthday_at, CONCAT(YEAR(CURDATE()), '-%m-%d')
    )) AS day_of_week,
    COUNT(*) AS count
FROM
    users
GROUP BY
    day_of_week;

-- ######################
-- ### result
-- ######################
/*
    +-------------+-------+
    | day_of_week | count |
    +-------------+-------+
    |           2 |     1 |
    |           3 |     1 |
    |           5 |     2 |
    |           7 |     2 |
    +-------------+-------+
    4 rows in set (0.00 sec)
*/