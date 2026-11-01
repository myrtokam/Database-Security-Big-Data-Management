USE healthcare_assignment;
SET @encryption_key = 'Medical_Data_2025_DEMO';

USE healthcare_assignment;

SET @encryption_key = 'Medical_Data_2025_DEMO';

SELECT
    encounter_id,

    HEX(primary_diagnosis_encrypted) AS diagnosis_encrypted_hex,

    CAST(
        AES_DECRYPT(primary_diagnosis_encrypted, @encryption_key)
        AS CHAR
    ) AS diagnosis_plain,

    HEX(encounter_cost_encrypted) AS cost_encrypted_hex,

    CAST(
        AES_DECRYPT(encounter_cost_encrypted, @encryption_key)
        AS DECIMAL(10,2)
    ) AS cost_plain

FROM synantiseis
ORDER BY encounter_id
LIMIT 5;
FROM synantiseis
ORDER BY encounter_id LIMIT 5;
