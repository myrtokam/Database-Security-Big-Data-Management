
USE healthcare_assignment;


SELECT
    'ORIGINAL' AS dataset,
    COUNT(*) AS total_records,
    COUNT(DISTINCT s.primary_diagnosis) AS unique_diagnoses,
    ROUND(AVG(s.encounter_cost), 2) AS mean_encounter_cost,
    ROUND(STDDEV_SAMP(s.encounter_cost), 2) AS stddev_encounter_cost
FROM asthenis a
JOIN synantiseis s
    ON s.patient_id = a.patient_id

UNION ALL

SELECT
    'ANONYMIZED' AS dataset,
    COUNT(*) AS total_records,
    COUNT(DISTINCT s.primary_diagnosis) AS unique_diagnoses,
    ROUND(AVG(s.encounter_cost), 2) AS mean_encounter_cost,
    ROUND(STDDEV_SAMP(s.encounter_cost), 2) AS stddev_encounter_cost
FROM anonymized_asthenis aa
JOIN anonymized_patient_map_internal m
    ON m.anon_patient_id = aa.anon_patient_id
JOIN synantiseis s
    ON s.patient_id = m.source_patient_id;
