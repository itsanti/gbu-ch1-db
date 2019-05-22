-- ######################
-- ### solution
-- ######################
DELIMITER //
DROP FUNCTION IF EXISTS hello//

CREATE FUNCTION hello()
RETURNS VARCHAR(12) DETERMINISTIC
BEGIN
    DECLARE curHour INT;
    DECLARE msg VARCHAR(12);

    SET curHour = HOUR(NOW());

    CASE
        WHEN curHour >= 0 AND curHour < 6 THEN
            SET msg = 'Доброй ночи';
        WHEN curHour >= 6 AND curHour < 12 THEN
            SET msg = 'Доброе утро';
        WHEN curHour >= 12 AND curHour < 18 THEN
            SET msg = 'Добрый день';
        WHEN curHour >= 18 AND curHour < 24 THEN
            SET msg = 'Добрый вечер';
        ELSE
            SET msg = 'некорректное время';
    END CASE;

	RETURN msg;
END//

DELIMITER ;

-- ######################
-- ### result
-- ######################
/*
    mysql> \! date;
    Ср мая 22 21:28:50 MSK 2019

    mysql> select hello();
    +-------------------------+
    | hello()                 |
    +-------------------------+
    | Добрый вечер            |
    +-------------------------+
    1 row in set (0.00 sec)
*/