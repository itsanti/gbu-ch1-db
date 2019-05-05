-- set fields to NULL
INSERT INTO storehouses_products (value) VALUES
  (0), (2500), (0), (30), (500), (1);

-- ######################
-- ### solution
-- ######################

SELECT
    value
FROM
    storehouses_products
ORDER BY
    !value, -- or value = 0
    value;