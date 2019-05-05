-- setup
CREATE TABLE mult (
    value INT NOT NULL
);

INSERT INTO mult VALUES
    (1), (2), (3), (4), (5);

-- ######################
-- ### solution
-- ######################

-- math
SELECT ROUND(EXP(SUM(LN(value)))) AS mul FROM mult;

-- ######################
-- ### result
-- ######################
/*
    +------+
    | mul  |
    +------+
    |  120 |
    +------+
    1 row in set (0.00 sec)
*/