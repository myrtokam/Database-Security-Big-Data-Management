USE healthcare_assignment;


CREATE OR REPLACE SQL SECURITY DEFINER VIEW analyst_view AS
SELECT anon_patient_id, age_group, gender, zipcode_prefix, ethnicity
FROM anonymized_asthenis;


CREATE OR REPLACE SQL SECURITY DEFINER VIEW researcher_view AS
SELECT aa.anon_patient_id, aa.age_group, aa.gender, aa.zipcode_prefix,
       e.test_type, e.reference_range, e.abnormal_flag
FROM anonymized_asthenis aa
JOIN anonymized_patient_map_internal m
    ON aa.anon_patient_id = m.anon_patient_id
JOIN synantiseis s
    ON m.source_patient_id = s.patient_id
JOIN ergastiriaka_apotelesmata e
    ON s.encounter_id = e.encounter_id;


CREATE OR REPLACE SQL SECURITY DEFINER VIEW clinician_view AS
SELECT a.patient_id, a.age_group, a.gender, a.zipcode_prefix, a.created_date,
       s.encounter_id, s.encounter_date
FROM asthenis a
JOIN synantiseis s
    ON a.patient_id = s.patient_id;