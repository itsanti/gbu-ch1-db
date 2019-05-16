-- ######################
-- ### solution
-- ######################

CREATE VIEW
    prod_cat_name
AS
SELECT
    p.name AS prod_name,
    c.name AS cat_name
FROM
    products AS p JOIN catalogs AS c ON p.catalog_id = c.id;

-- ######################
-- ### result
-- ######################

SELECT * FROM prod_cat_name;

/*
    +-------------------------+-----------------------------------+
    | prod_name               | cat_name                          |
    +-------------------------+-----------------------------------+
    | Intel Core i3-8100      | Процессоры                        |
    | Intel Core i5-7400      | Процессоры                        |
    | AMD FX-8320E            | Процессоры                        |
    | AMD FX-8320             | Процессоры                        |
    | ASUS ROG MAXIMUS X HERO | Материнские платы                 |
    | Gigabyte H310M S2H      | Материнские платы                 |
    | MSI B250M GAMING PRO    | Материнские платы                 |
    +-------------------------+-----------------------------------+
*/