-- ######################
-- ### solution
-- ######################
START TRANSACTION; 

INSERT INTO
    sample.users
SELECT
    *
FROM
    shop.users
WHERE
    id = 1;

DELETE FROM
  shop.users
WHERE
    id = 1
LIMIT 1;

COMMIT;

-- ######################
-- ### result
-- ######################
/*
 file: topic6/hw5.1.png
*/