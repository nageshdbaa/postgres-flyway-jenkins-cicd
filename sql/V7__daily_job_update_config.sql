-- Scheduled DML change: update config value
INSERT INTO app_config (key, value)
VALUES ('daily_job_status', 'ENABLED')
ON CONFLICT (key)
DO UPDATE
SET value = 'ENABLED';
