USE healthcare_assignment;

SELECT
  primary_diagnosis,
   COUNT(DISTINCT patient_id) AS patient_count,

  CASE
 
    WHEN COUNT(DISTINCT patient_id) < 3 THEN 'CRITICAL'
    WHEN COUNT(DISTINCT patient_id) BETWEEN 3 AND 4 THEN 'HIGH'
    WHEN COUNT(DISTINCT patient_id) BETWEEN 5 AND 9 THEN 'MEDIUM'
    ELSE 'LOW'
  END AS risk_level

FROM synantiseis

GROUP BY primary_diagnosis
ORDER BY patient_count ASC, primary_diagnosis ASC;