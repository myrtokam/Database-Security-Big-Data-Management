USE healthcare_assignment;

SELECT 'INITIAL' AS release_stage, age_group, gender, zipcode_prefix,
       COUNT(*) AS group_size,
       CASE WHEN COUNT(*) >= 3 THEN 'OK' ELSE 'VIOLATION' END AS k_status
FROM anonymized_asthenis_initial
GROUP BY age_group, gender, zipcode_prefix
ORDER BY group_size ASC;


SELECT 'FINAL' AS release_stage, age_group, gender, zipcode_prefix,
       COUNT(*) AS group_size,
       CASE WHEN COUNT(*) >= 3 THEN 'OK' ELSE 'VIOLATION' END AS k_status
FROM anonymized_asthenis
GROUP BY age_group, gender, zipcode_prefix
ORDER BY group_size ASC;


SELECT MIN(group_size) AS minimum_final_group_size
FROM (
  SELECT age_group, gender, zipcode_prefix, COUNT(*) AS group_size
  FROM anonymized_asthenis
  GROUP BY age_group, gender, zipcode_prefix
) q;
