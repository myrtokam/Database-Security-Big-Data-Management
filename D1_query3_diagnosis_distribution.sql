
USE healthcare_assignment;

SELECT 'ORIGINAL' AS dataset,
       primary_diagnosis,
       COUNT(*) AS diagnosis_count
FROM synantiseis
GROUP BY primary_diagnosis

UNION ALL

SELECT 'ANONYMIZED' AS dataset,
       s.primary_diagnosis,
       COUNT(*) AS diagnosis_count
FROM anonymized_asthenis aa
JOIN anonymized_patient_map_internal m
    ON m.anon_patient_id = aa.anon_patient_id
JOIN synantiseis s
    ON s.patient_id = m.source_patient_id
GROUP BY s.primary_diagnosis

ORDER BY primary_diagnosis, dataset;
