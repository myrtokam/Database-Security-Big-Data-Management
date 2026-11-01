USE healthcare_assignment;

CREATE OR REPLACE SQL SECURITY DEFINER VIEW encrypted_encounters_view AS
SELECT
    encounter_id,
    patient_id,
    encounter_date,

    CAST(
        AES_DECRYPT(
            primary_diagnosis_encrypted,
            'Medical_Data_2025_DEMO'
        ) AS CHAR
    ) AS primary_diagnosis_decrypted,

    CAST(
        AES_DECRYPT(
            encounter_cost_encrypted,
            'Medical_Data_2025_DEMO'
        ) AS DECIMAL(10,2)
    ) AS encounter_cost_decrypted,

    severity,
    insurance_type

FROM synantiseis;