UPDATE test_flyway
SET created_by = 'jenkins'
WHERE created_by IS NULL;