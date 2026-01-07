INSERT INTO user_role (role_name)
VALUES
  ('ADMIN'),
  ('APP_USER'),
  ('READ_ONLY')
ON CONFLICT (role_name) DO NOTHING;
