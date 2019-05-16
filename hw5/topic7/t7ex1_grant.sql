-- ######################
-- ### solution
-- ######################

GRANT SELECT ON shop.*
TO shop_read@'%' IDENTIFIED BY '123';

GRANT ALL ON shop.*
TO shop@'%' IDENTIFIED BY '123';

-- ######################
-- ### result
-- ######################

SELECT Host, User FROM mysql.user WHERE user LIKE 'shop%';

/*
    +------+-----------+
    | Host | User      |
    +------+-----------+
    | %    | shop      |
    | %    | shop_read |
    +------+-----------+
*/

SELECT
    GRANTEE,
    TABLE_SCHEMA,
    GROUP_CONCAT(PRIVILEGE_TYPE) AS grants
FROM
    information_schema.schema_privileges
WHERE
    GRANTEE LIKE '%shop%'
GROUP BY GRANTEE, TABLE_SCHEMA\G

/*
    *************************** 1. row ***************************
        grantee: 'shop'@'%'
    TABLE_SCHEMA: shop
        grants: UPDATE,CREATE,REFERENCES,ALTER,LOCK TABLES,CREATE VIEW,CREATE ROUTINE,EVENT,INSERT,DELETE,DROP,INDEX,CREATE TEMPORARY TABLES,EXECUTE,SHOW VIEW,ALTER ROUTINE,SELECT,TRIGGER
    *************************** 2. row ***************************
        grantee: 'shop_read'@'%'
    TABLE_SCHEMA: shop
        grants: SELECT
    2 rows in set (0.00 sec)
*/

-- try access for shop_read user
mysql -u shop_read -p

USE shop

DROP TABLE users;

/*
    ERROR 1142 (42000): DROP command denied to user 'shop_read'@'localhost' for table 'users'
*/