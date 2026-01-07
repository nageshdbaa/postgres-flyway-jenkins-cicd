ALTER TABLE test_flyway
ADD COLUMN IF NOT EXISTS created_by TEXT DEFAULT 'system';
