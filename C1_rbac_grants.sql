USE healthcare_assignment;


CREATE ROLE IF NOT EXISTS data_analyst;
CREATE ROLE IF NOT EXISTS researcher;
CREATE ROLE IF NOT EXISTS clinician;
CREATE ROLE IF NOT EXISTS security_admin;

GRANT SELECT ON healthcare_assignment.analyst_view TO data_analyst;
GRANT data_analyst TO 'analyst_test'@'localhost';
SET DEFAULT ROLE data_analyst TO 'analyst_test'@'localhost';

GRANT SELECT ON healthcare_assignment.researcher_view
TO researcher;

GRANT researcher TO 'researcher_test'@'localhost';

SET DEFAULT ROLE researcher
TO 'researcher_test'@'localhost';


GRANT SELECT ON healthcare_assignment.clinician_view
TO clinician;

GRANT clinician TO 'clinician_test'@'localhost';

SET DEFAULT ROLE clinician
TO 'clinician_test'@'localhost';