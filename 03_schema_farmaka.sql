
USE healthcare_assignment;

CREATE TABLE farmaka (
  med_id INT PRIMARY KEY AUTO_INCREMENT,
  encounter_id INT NOT NULL,
  drug_code VARCHAR(10) NOT NULL,
  indication VARCHAR(200) NOT NULL,
  dosage DECIMAL(7,2) NOT NULL,
  duration_days INT NOT NULL,
  CONSTRAINT fk_farmaka_encounter
  FOREIGN KEY (encounter_id)
  REFERENCES synantiseis(encounter_id),
  CONSTRAINT chk_dosage
  CHECK (dosage > 0),
  CONSTRAINT chk_duration_days
  CHECK (duration_days > 0),
  CHECK (CHAR_LENGTH(drug_code) > 0)
);

CREATE INDEX idx_farmaka_encounter
ON farmaka(encounter_id);
INSERT INTO farmaka(encounter_id, drug_code, indication, dosage, duration_days)
SELECT
  encounter_id,
  CASE MOD(encounter_id,8)
    WHEN 0 THEN 'A10BA02' WHEN 1 THEN 'C09AA05' WHEN 2 THEN 'R03AC02' WHEN 3 THEN 'C10AA05'
    WHEN 4 THEN 'B01AC06' WHEN 5 THEN 'N06AB10' WHEN 6 THEN 'M01AE01' ELSE 'J01CA04' END,
  CASE MOD(encounter_id,8)
    WHEN 0 THEN 'Diabetic treatment' WHEN 1 THEN 'Hypertension treatment' WHEN 2 THEN 'Asthma control'
    WHEN 3 THEN 'Cholesterol management' WHEN 4 THEN 'Antiplatelet therapy' WHEN 5 THEN 'Depression treatment'
    WHEN 6 THEN 'Pain and inflammation treatment' ELSE 'Antibiotic treatment' END,
  5.00 + MOD(encounter_id,15) * 2.50,
  7 + MOD(encounter_id,28)
FROM synantiseis;

SELECT COUNT(*) AS farmaka_count FROM farmaka;
