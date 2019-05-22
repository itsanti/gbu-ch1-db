-- ######################
-- ### solution
-- ######################
DELIMITER //

DROP TRIGGER IF EXISTS cancel_products_insert//
DROP TRIGGER IF EXISTS cancel_products_update//

CREATE TRIGGER cancel_products_insert
BEFORE INSERT ON products FOR EACH ROW
BEGIN
  -- both fields is NULL check
  IF COALESCE(NEW.name, NEW.description) IS NULL THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'INSERT canceled: both name and description is NULL';
  END IF;
END//

-- copy INSERT TRIGGER
CREATE TRIGGER cancel_products_update
BEFORE UPDATE ON products FOR EACH ROW
BEGIN
  IF COALESCE(NEW.name, NEW.description) IS NULL THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'UPDATE canceled: both name and description is NULL';
  END IF;
END//

DELIMITER ;

-- ######################
-- ### result
-- ######################
/*

mysql> update products set name=null, description=null where id=1;
ERROR 1644 (45000): UPDATE canceled: both name and description is NULL

mysql> update products set name='intel', description=null where id=11;
Query OK, 1 row affected (0.02 sec)
Rows matched: 1  Changed: 1  Warnings: 0

*/