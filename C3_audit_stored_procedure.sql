USE healthcare_assignment;

DROP PROCEDURE IF EXISTS sp_select_researcher_view;

DELIMITER $$

CREATE PROCEDURE sp_select_researcher_view(IN p_limit INT)
BEGIN


    INSERT INTO audit_log(
        user_name,
        action_type,
        table_name,
        affected_records,
        status
    )
    VALUES (
        USER(),
        'SELECT',
        'researcher_view',
        p_limit,
        'LOGGED_BY_PROCEDURE'
    );

   
    SELECT *
    FROM researcher_view
    LIMIT p_limit;

END$$

DELIMITER ;