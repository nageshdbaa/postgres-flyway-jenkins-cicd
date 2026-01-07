CREATE TABLE IF NOT EXISTS audit_log (
    audit_id     SERIAL PRIMARY KEY,
    action       TEXT NOT NULL,
    action_by    TEXT NOT NULL,
    action_time  TIMESTAMP DEFAULT now()
);
