USE healthcare_assignment;

SELECT age_group, gender, zipcode_prefix, COUNT(*) AS source_group_size,
       CASE WHEN COUNT(*) >= 3 THEN 'OK' ELSE 'NEEDS_REMEDIATION' END AS status
FROM asthenis
GROUP BY age_group, gender, zipcode_prefix
ORDER BY source_group_size ASC, age_group, gender, zipcode_prefix;


DROP TABLE IF EXISTS anonymized_asthenis_initial;
DROP TABLE IF EXISTS anonymized_patient_map_initial;

CREATE TABLE anonymized_patient_map_initial (
  anon_patient_id INT PRIMARY KEY AUTO_INCREMENT,
  source_patient_id INT NOT NULL UNIQUE
);

CREATE TABLE anonymized_asthenis_initial (
  anon_patient_id INT PRIMARY KEY,
  age_group VARCHAR(10) NOT NULL,
  gender CHAR(1) NOT NULL,
  zipcode_prefix VARCHAR(3) NOT NULL,
  ethnicity VARCHAR(50) NULL
);

INSERT INTO anonymized_patient_map_initial(source_patient_id)
SELECT a.patient_id
FROM asthenis a
JOIN (
  SELECT age_group, gender, zipcode_prefix
  FROM asthenis
  GROUP BY age_group, gender, zipcode_prefix
  HAVING 
) safe_groups
  ON /
ORDER BY a.patient_id;

INSERT INTO anonymized_asthenis_initial(anon_patient_id, age_group, gender, zipcode_prefix, ethnicity)
SELECT m.anon_patient_id, a.age_group, a.gender, a.zipcode_prefix, a.ethnicity
FROM anonymized_patient_map_initial m
JOIN asthenis a ON a.patient_id = m.source_patient_id;

DROP TABLE IF EXISTS anonymized_asthenis;
DROP TABLE IF EXISTS anonymized_patient_map_internal;

CREATE TABLE anonymized_patient_map_internal (
  anon_patient_id INT PRIMARY KEY AUTO_INCREMENT,
  source_patient_id INT NOT NULL UNIQUE
);

CREATE TABLE anonymized_asthenis (
  anon_patient_id INT PRIMARY KEY,
  age_group VARCHAR(10) NOT NULL,
  gender CHAR(1) NOT NULL,
  zipcode_prefix VARCHAR(3) NOT NULL,
  ethnicity VARCHAR(50) NULL
);

INSERT INTO anonymized_patient_map_internal(source_patient_id)
SELECT patient_id FROM asthenis ORDER BY patient_id;

INSERT INTO anonymized_asthenis(anon_patient_id, age_group, gender, zipcode_prefix, ethnicity)
SELECT
  m.anon_patient_id,
    CASE
    WHEN a.zipcode_prefix IN ('100', '101') THEN a.gender
    ELSE '*'
  END AS gender,

  
  CASE
    WHEN a.zipcode_prefix IN ('100', '101') THEN '10*'
    ELSE 'OTH'
  END AS zipcode_prefix,

  
  CASE
    WHEN a.zipcode_prefix IN ('100', '101') THEN a.ethnicity
    ELSE 'Suppressed'
  END AS ethnicity

FROM anonymized_patient_map_internal m
JOIN asthenis a ON a.patient_id = m.source_patient_id;AS ethnicity
FROM anonymized_patient_map_internal m
JOIN asthenis a ON a.patient_id = m.source_patient_id;
