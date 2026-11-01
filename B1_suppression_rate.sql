USE healthcare_assignment;


SELECT 'INITIAL' AS release_stage,
       (SELECT COUNT(*) FROM asthenis) AS original_count,
       (SELECT COUNT(*) FROM anonymized_asthenis_initial) AS anonymized_count,
       ROUND(((SELECT COUNT(*) FROM asthenis) - (SELECT COUNT(*) FROM anonymized_asthenis_initial)) /
             (SELECT COUNT(*) FROM asthenis) * 100, 2) AS suppression_rate_percent
UNION ALL
SELECT 'FINAL' AS release_stage,
       (SELECT COUNT(*) FROM asthenis),
       (SELECT COUNT(*) FROM anonymized_asthenis),
       ROUND(((SELECT COUNT(*) FROM asthenis) - (SELECT COUNT(*) FROM anonymized_asthenis)) /
             (SELECT COUNT(*) FROM asthenis) * 100, 2);
