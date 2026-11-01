USE healthcare_assignment;

SET @encryption_key = 'Medical_Data_2025_DEMO';

ALTER TABLE synantiseis
ADD COLUMN primary_diagnosis_encrypted BLOB NULL,
ADD COLUMN encounter_cost_encrypted BLOB NULL;

UPDATE synantiseis
SET
    primary_diagnosis_encrypted =
        AES_ENCRYPT(primary_diagnosis, @encryption_key),

    encounter_cost_encrypted =
        AES_ENCRYPT(CAST(encounter_cost AS CHAR), @encryption_key);