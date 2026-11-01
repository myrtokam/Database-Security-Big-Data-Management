CREATE DATABASE IF NOT EXISTS healthcare_assignment CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE healthcare_assignment;

DROP TABLE IF EXISTS audit_log;
DROP TABLE IF EXISTS ergastiriaka_apotelesmata;
DROP TABLE IF EXISTS farmaka;
DROP TABLE IF EXISTS synantiseis;
DROP TABLE IF EXISTS asthenis;

CREATE TABLE asthenis (
  patient_id INT PRIMARY KEY AUTO_INCREMENT,
  age_group VARCHAR(10) NOT NULL,
  gender CHAR(1) NOT NULL,
  zipcode_prefix VARCHAR(3) NOT NULL,
  ethnicity VARCHAR(50) NULL,
  created_date DATE NOT NULL,
 CONSTRAINT chk_age_group
CHECK (age_group IN ('18-30', '31-50', '51-70', '71+')),
CONSTRAINT chk_gender
CHECK (gender IN ('M', 'F', 'O')),
  CONSTRAINT chk_ethnicity CHECK (ethnicity IS NULL OR ethnicity IN ('Caucasian','African American','Hispanic','Asian'))
);

CREATE INDEX idx_asthenis_age_group
ON asthenis(age_group);
INSERT INTO asthenis(age_group, gender, zipcode_prefix, ethnicity, created_date)
SELECT
  CASE MOD(n,4) WHEN 0 THEN '18-30' WHEN 1 THEN '31-50' WHEN 2 THEN '51-70' ELSE '71+' END,
  CASE MOD(n,3) WHEN 0 THEN 'M' WHEN 1 THEN 'F' ELSE 'O' END,
  CASE WHEN n <= 88
       THEN CASE WHEN MOD(n,2)=0 THEN '100' ELSE '101' END
       ELSE CASE MOD(n,3) WHEN 0 THEN '154' WHEN 1 THEN '546' ELSE '570' END
  END,
  CASE MOD(n,4) WHEN 0 THEN 'Caucasian' WHEN 1 THEN 'African American' WHEN 2 THEN 'Hispanic' ELSE 'Asian' END,
  DATE_ADD('2025-01-01', INTERVAL MOD(n,90) DAY)
FROM (
  SELECT ones.d + tens.d*10 + 1 AS n
  FROM (SELECT 0 d UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) ones
  CROSS JOIN (SELECT 0 d UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) tens
) seq
ORDER BY n;

SELECT COUNT(*) AS asthenis_count FROM asthenis;
