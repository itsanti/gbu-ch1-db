-- ######################
-- ### solution
-- ######################
DROP TABLE IF EXISTS logs;
CREATE TABLE logs (
  id BIGINT UNSIGNED NOT NULL,
  tbl_name ENUM('users', 'catalogs', 'products') NOT NULL,
  name VARCHAR(255),
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP
) ENGINE=Archive;

DELIMITER //

DROP TRIGGER IF EXISTS log_users_insert//
DROP TRIGGER IF EXISTS log_catalogs_insert//
DROP TRIGGER IF EXISTS log_products_insert//

CREATE TRIGGER log_users_insert
AFTER INSERT ON users FOR EACH ROW
BEGIN
    INSERT INTO logs (id, tbl_name, name)
    VALUES (NEW.id, 'users', NEW.name);
END//

CREATE TRIGGER log_catalogs_insert
AFTER INSERT ON catalogs FOR EACH ROW
BEGIN
    INSERT INTO logs (id, tbl_name, name)
    VALUES (NEW.id, 'catalogs', NEW.name);
END//

CREATE TRIGGER log_products_insert
AFTER INSERT ON products FOR EACH ROW
BEGIN
    INSERT INTO logs (id, tbl_name, name)
    VALUES (NEW.id, 'products', NEW.name);
END//

DELIMITER ;

-- ######################
-- ### result
-- ######################
/*
mysql> insert into catalogs (name)
values ('кардридеры'), ('кулеры');
Query OK, 2 rows affected (0.00 sec)
Records: 2  Duplicates: 0  Warnings: 0

mysql> select * from logs;
+----+----------+----------------------+---------------------+
| id | tbl_name | name                 | created_at          |
+----+----------+----------------------+---------------------+
| 10 | catalogs | кардридеры           | 2019-05-23 00:26:10 |
| 11 | catalogs | кулеры               | 2019-05-23 00:26:10 |
+----+----------+----------------------+---------------------+
2 rows in set (0.00 sec)

mysql> insert into products (name, price, catalog_id)
values ('amd ryzen', 4500, 1);
Query OK, 1 row affected (0.01 sec)

mysql> select * from logs;
+----+----------+----------------------+---------------------+
| id | tbl_name | name                 | created_at          |
+----+----------+----------------------+---------------------+
| 10 | catalogs | кардридеры           | 2019-05-23 00:26:10 |
| 11 | catalogs | кулеры               | 2019-05-23 00:26:10 |
| 13 | products | amd ryzen            | 2019-05-23 00:30:56 |
+----+----------+----------------------+---------------------+
3 rows in set (0.00 sec)
*/