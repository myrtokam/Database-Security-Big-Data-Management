
USE healthcare_assignment;

CREATE TABLE ergastiriaka_apotelesmata (
  result_id INT PRIMARY KEY AUTO_INCREMENT,
  encounter_id INT NOT NULL,
  test_type VARCHAR(50) NOT NULL,
  result_value DECIMAL(10,2) NOT NULL,
  reference_range VARCHAR(50) NOT NULL,
  abnormal_flag BOOLEAN NOT NULL
  CONSTRAINT fk_lab_encounter
  FOREIGN KEY (encounter_id)
  REFERENCES synantiseis(encounter_id)
);

CREATE INDEX idx_lab_encounter
ON ergastiriaka_apotelesmata(encounter_id);


INSERT INTO ergastiriaka_apotelesmata(encounter_id, test_type, result_value, reference_range, abnormal_flag)
SELECT encounter_id, 'systolic_bp', 100 + MOD(encounter_id,70), '90-120',
       CASE WHEN 100 + MOD(encounter_id,70) > 120 THEN TRUE ELSE FALSE END
FROM synantiseis WHERE encounter_id <= 50
UNION ALL
SELECT encounter_id, 'diastolic_bp', 60 + MOD(encounter_id,40), '60-80',
       CASE WHEN 60 + MOD(encounter_id,40) > 80 THEN TRUE ELSE FALSE END
FROM synantiseis WHERE encounter_id <= 50;

SELECT COUNT(*) AS ergastiriaka_count FROM ergastiriaka_apotelesmata;
