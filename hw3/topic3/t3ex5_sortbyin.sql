-- ######################
-- ### solution
-- ######################

-- ORDER BY expression
SELECT
    *
FROM
    catalogs
WHERE
    id IN (5, 1, 2) ORDER BY id != 5, id != 1, id != 2;

-- FIELD function
SELECT
    *
FROM
    catalogs
WHERE
    id IN (5, 1, 2) ORDER BY FIELD(id, 5, 1, 2);