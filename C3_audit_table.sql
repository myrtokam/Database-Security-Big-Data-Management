USE healthcare_assignment;
DROP TABLE IF EXISTS audit_log;

CREATE TABLE audit_log (
  log_id INT PRIMARY KEY AUTO_INCREMENT,
  user_name VARCHAR(100) NOT NULL,
  action_type VARCHAR(20) NOT NULL,
  table_name VARCHAR(100) NOT NULL,
  affected_records INT NOT NULL DEFAULT 1,
  action_timestamp TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  status VARCHAR(30) NOT NULL DEFAULT 'SUCCESS'
);


GRANT SELECT, INSERT, UPDATE ON healthcare_assignment.audit_log TO security_admin;
