USE healthcare_assignment;

DROP TRIGGER IF EXISTS trg_synantiseis_after_insert;
DROP TRIGGER IF EXISTS trg_synantiseis_after_update;
DROP TRIGGER IF EXISTS trg_synantiseis_after_delete;

DELIMITER $$


CREATE TRIGGER trg_synantiseis_after_insert
AFTER INSERT ON synantiseis
FOR EACH ROW
BEGIN
    INSERT INTO audit_log
        (user_name, action_type, table_name, affected_records, status)
    VALUES
        (USER(), 'INSERT', 'synantiseis', 1, 'SUCCESS');
END$$


CREATE TRIGGER trg_synantiseis_after_update
AFTER UPDATE ON synantiseis
FOR EACH ROW
BEGIN
    INSERT INTO audit_log
        (user_name, action_type, table_name, affected_records, status)
    VALUES
        (USER(), 'UPDATE', 'synantiseis', 1, 'SUCCESS');
END$$


CREATE TRIGGER trg_synantiseis_after_delete
AFTER DELETE ON synantiseis
FOR EACH ROW
BEGIN
    INSERT INTO audit_log
        (user_name, action_type, table_name, affected_records, status)
    VALUES
        (USER(), 'DELETE', 'synantiseis', 1, 'SUCCESS');
END$$

DELIMITER ;
