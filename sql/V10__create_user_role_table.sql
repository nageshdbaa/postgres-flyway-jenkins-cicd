CREATE TABLE IF NOT EXISTS user_role (
    role_id   SERIAL PRIMARY KEY,
    role_name TEXT UNIQUE NOT NULL,
    active    BOOLEAN DEFAULT true
);