INSERT INTO test_flyway(note)
VALUES ('Inserted via Jenkins CI/CD')
ON CONFLICT DO NOTHING;