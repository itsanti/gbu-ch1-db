-- set fields to NULL
UPDATE users SET created_at = NULL, updated_at = NULL;

-- ######################
-- ### solution
-- ######################

-- fill data current DATETIME
-- all records with same DATETIME value
UPDATE users SET created_at = NOW(), updated_at = NOW();