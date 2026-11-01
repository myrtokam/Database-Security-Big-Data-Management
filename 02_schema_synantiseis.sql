
USE healthcare_assignment;

CREATE TABLE synantiseis (
  encounter_id INT PRIMARY KEY AUTO_INCREMENT,
  patient_id INT NOT NULL,
  encounter_date DATE NOT NULL,
  primary_diagnosis VARCHAR(10) NOT NULL,
  severity VARCHAR(20) NOT NULL,
  encounter_cost DECIMAL(10,2) NOT NULL,
  insurance_type VARCHAR(50) NULL,

  CONSTRAINT fk_synantiseis_patient
    FOREIGN KEY (patient_id)
    REFERENCES asthenis(patient_id),

 
  CONSTRAINT chk_severity
    CHECK (severity IN ('Mild', 'Moderate', 'Severe', 'Critical')),

  CHECK (encounter_cost >= 0)
);


CREATE INDEX idx_syn_patient
ON synantiseis(patient_id);

CREATE INDEX idx_syn_date
ON synantiseis(encounter_date);


INSERT INTO synantiseis(patient_id, encounter_date, primary_diagnosis, severity, encounter_cost, insurance_type)
SELECT
  patient_id,
  DATE_ADD('2025-03-01', INTERVAL MOD(patient_id,100) DAY),
  CASE MOD(patient_id,10)
    WHEN 0 THEN 'E11.9' WHEN 1 THEN 'I10' WHEN 2 THEN 'J45.9' WHEN 3 THEN 'N18.3' WHEN 4 THEN 'I25.10'
    WHEN 5 THEN 'F32.9' WHEN 6 THEN 'M17.9' WHEN 7 THEN 'E78.5' WHEN 8 THEN 'C50.9' ELSE 'G40.9' END,
  CASE MOD(patient_id,4) WHEN 0 THEN 'Mild' WHEN 1 THEN 'Moderate' WHEN 2 THEN 'Severe' ELSE 'Critical' END,
  120.00 + (MOD(patient_id,20) * 35.50),
  CASE MOD(patient_id,4) WHEN 0 THEN 'Medicare' WHEN 1 THEN 'Private' WHEN 2 THEN 'Public' ELSE 'Self-pay' END
FROM asthenis;

SELECT COUNT(*) AS synantiseis_count FROM synantiseis;
