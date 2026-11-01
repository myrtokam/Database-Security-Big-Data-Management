
USE healthcare_assignment;



SELECT
    'ORIGINAL' AS dataset,
    a.age_group AS age_dimension,
    COUNT(*) AS patient_count,
    ROUND(AVG(s.encounter_cost), 2) AS mean_cost
FROM asthenis a
JOIN synantiseis s
    ON s.patient_id = a.patient_id
GROUP BY a.age_group

UNION ALL

SELECT
    'ANONYMIZED' AS dataset,
    aa.age_group AS age_dimension,
    COUNT(*) AS patient_count,
    ROUND(AVG(s.encounter_cost), 2) AS mean_cost
FROM anonymized_asthenis aa
JOIN anonymized_patient_map_internal m
    ON m.anon_patient_id = aa.anon_patient_id
JOIN synantiseis s
    ON s.patient_id = m.source_patient_id
GROUP BY aa.age_group;
