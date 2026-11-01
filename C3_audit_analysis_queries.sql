USE healthcare_assignment;

SELECT
    user_name,
    action_type,
    table_name,
    action_timestamp
FROM audit_log
ORDER BY action_timestamp DESC
LIMIT 20;