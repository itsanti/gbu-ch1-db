-- ######################
-- ### solution
-- ######################

-- 1
SELECT
    AVG(TIMESTAMPDIFF(YEAR, birthday_at, NOW())) AS avg_age
FROM users;

-- 2

SELECT
    AVG(DATEDIFF(CURDATE(), birthday_at) / 365) AS avg_age
FROM users;

-- 3

SELECT
    AVG(YEAR(NOW()) - YEAR(birthday_at)) AS avg_age
FROM users;

-- ######################
-- ### result
-- ######################
/*
    1. avg_age = 28.8333
    2. avg_age = 29.39315068
    3. avg_age = 29.5000
*/