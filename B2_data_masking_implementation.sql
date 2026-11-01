USE healthcare_assignment;


ALTER TABLE farmaka
ADD COLUMN indication_masked VARCHAR(100) NULL;

UPDATE farmaka
SET indication_masked = CASE
    WHEN LOWER(indication) LIKE '%diabetic%'
      OR LOWER(indication) LIKE '%cholesterol%'
        THEN 'Metabolic_Treatment'

    WHEN LOWER(indication) LIKE '%hypertension%'
      OR LOWER(indication) LIKE '%antiplatelet%'
        THEN 'Cardiovascular_Treatment'

    WHEN LOWER(indication) LIKE '%asthma%'
        THEN 'Respiratory_Treatment'

    WHEN LOWER(indication) LIKE '%depression%'
        THEN 'Mental_Health_Treatment'

    WHEN LOWER(indication) LIKE '%pain%'
        THEN 'Pain_Management'

    WHEN LOWER(indication) LIKE '%antibiotic%'
        THEN 'Infection_Treatment'

    ELSE 'Other_Treatment'
END;

SELECT
    med_id,
    indication AS before_masking,
    indication_masked AS after_masking
FROM farmaka
ORDER BY med_id
LIMIT 10;