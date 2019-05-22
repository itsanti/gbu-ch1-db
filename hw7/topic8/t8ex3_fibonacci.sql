-- ######################
-- ### solution
-- ######################
DELIMITER //
DROP FUNCTION IF EXISTS FIBONACCI//

CREATE FUNCTION FIBONACCI(n INT UNSIGNED)
RETURNS INT UNSIGNED DETERMINISTIC
BEGIN
    DECLARE root5 DOUBLE DEFAULT SQRT(5);
	RETURN (POW((1 + root5) / 2, n) - POW((1 - root5) / 2, n)) / root5;
END//

DELIMITER ;

-- ######################
-- ### result
-- ######################
/*
    mysql> select fibonacci(1);
    +--------------+
    | fibonacci(1) |
    +--------------+
    |            1 |
    +--------------+
    1 row in set (0.00 sec)

    mysql> select fibonacci(10);
    +---------------+
    | fibonacci(10) |
    +---------------+
    |            55 |
    +---------------+
    1 row in set (0.00 sec)
*/