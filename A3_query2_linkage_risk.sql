
USE healthcare_assignment;


SELECT
  age_group,
  gender,
  zipcode_prefix,
  ethnicity,

 
  COUNT(*) AS group_size,

  CASE
   
    WHEN COUNT(*) < 3 THEN 'CRITICAL'
    WHEN COUNT(*) BETWEEN 3 AND 4 THEN 'HIGH'
    ELSE 'REVIEW'
  END AS linkage_risk

FROM asthenis

GROUP BY
  age_group,
  gender,
  zipcode_prefix,
  ethnicity

HAVING COUNT(*) < 5

ORDER BY
  group_size ASC,
  age_group ASC,
  gender ASC,
  zipcode_prefix ASC,
  ethnicity ASC;
