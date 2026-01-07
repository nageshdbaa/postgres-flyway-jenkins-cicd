INSERT INTO app_config(key,value)
VALUES ('max_login_attempts','5')
ON CONFLICT (key)
DO UPDATE SET value = EXCLUDED.value;
