-- ######################
-- ### solution
-- ######################

SELECT
    *
FROM
    users
WHERE
    MONTHNAME(birthday_at) IN ('may', 'august');

/* result
*************************** 1. row ***************************
         id: 3
       name: Александр
birthday_at: 1985-05-20
 created_at: 2019-05-06 00:10:00
 updated_at: 2019-05-06 00:10:00
*************************** 2. row ***************************
         id: 6
       name: Мария
birthday_at: 1992-08-29
 created_at: 2019-05-06 00:10:00
 updated_at: 2019-05-06 00:10:00
*/