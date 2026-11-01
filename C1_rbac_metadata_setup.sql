USE healthcare_assignment;

DROP TABLE IF EXISTS user_roles;
DROP TABLE IF EXISTS role_permissions;
DROP TABLE IF EXISTS roles;

CREATE TABLE roles (
  role_id INT PRIMARY KEY AUTO_INCREMENT,
  role_name VARCHAR(50) NOT NULL UNIQUE,
  role_description VARCHAR(255) NOT NULL
);
CREATE TABLE role_permissions (
  permission_id INT PRIMARY KEY AUTO_INCREMENT,
  role_name VARCHAR(50) NOT NULL,
  object_name VARCHAR(100) NOT NULL,
  privilege_name VARCHAR(50) NOT NULL,
  permission_reason VARCHAR(255),
  FOREIGN KEY (role_name) REFERENCES roles(role_name)
);
CREATE TABLE user_roles (
  user_name VARCHAR(100) NOT NULL,
  role_name VARCHAR(50) NOT NULL,
  assigned_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY(user_name, role_name),
  FOREIGN KEY (role_name) REFERENCES roles(role_name)
);
INSERT INTO roles (role_name, role_description)
VALUES
('data_analyst', 'Performs analysis using approved database views'),
('researcher', 'Accesses approved research data through restricted views'),
('clinician', 'Accesses clinical information required for patient care'),
('security_admin', 'Reviews security audit logs and monitors access');


INSERT INTO role_permissions
    (role_name, object_name, privilege_name, permission_reason)
VALUES
(
    'data_analyst',
    'analyst_view',
    'SELECT',
    'Read approved analytical data without accessing raw tables'
),
(
    'researcher',
    'researcher_view',
    'SELECT',
    'Read approved research data through a restricted view'
),
(
    'clinician',
    'clinician_view',
    'SELECT',
    'Read clinical information required for patient care'
),
(
    'security_admin',
    'audit_log',
    'SELECT',
    'Review audit records for security monitoring'
);

