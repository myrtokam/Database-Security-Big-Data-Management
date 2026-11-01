
USE healthcare_assignment;
SELECT * FROM analyst_view LIMIT 5;

SELECT * FROM clinician_view LIMIT 5;

USE healthcare_assignment;
SELECT * FROM clinician_view LIMIT 5;


TEST 1 – analyst_test → analyst_view

Expected behaviour: SUCCESS

Actual output / evidence:
[Paste actual MySQL output]

TEST 2 – analyst_test → clinician_view

Expected behaviour: ACCESS DENIED

Actual error / evidence:
[Paste exact MySQL error]

TEST 3 – clinician_test → clinician_view

Expected behaviour: SUCCESS

Actual output / evidence:
[Paste actual MySQL output]

