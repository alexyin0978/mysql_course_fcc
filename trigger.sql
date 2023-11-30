-- Trigger

-- Create trigger table
CREATE TABLE trigger_test (
	message VARCHAR(100)
);
DESCRIBE trigger_test;

-- check if trigger gets executed
SELECT * FROM trigger_test;

-- Basic example
-- the below only works inside terminal, since Workbench doen't support chaning delimiter
/*
DELIMITER $$
CREATE
	TRIGGER first_trigger BEFORE INSERT
	ON employee
	FOR EACH ROW BEGIN
		INSERT INTO trigger_test VALUES('add a new employee');
	END$$
DELIMITER ;
*/


-- Another example: use New to access the data inserted
/*
DELIMITER $$
CREATE
	TRIGGER trigger_with_new_data BEFORE INSERT
    ON employee
    FOR EACH ROW BEGIN
		INSERT INTO trigger_test VALUES(NEW.first_name);
	END$$
DELIMITER ;
*/


-- Another example: CONCAT two strings
/*
DELIMITER $$
CREATE
	TRIGGER trigger_with_contacted_new_data BEFORE INSERT
    ON employee
    FOR EACH ROW BEGIN
		INSERT INTO trigger_test VALUES(CONCAT('inserted new employee ', NEW.first_name));
	END$$
DELIMITER ;
*/


-- Another example: conditions
/*
DELIMITER $$
CREATE
	TRIGGER trigger_with_condition BEFORE INSERT
    ON employee
    FOR EACH ROW BEGIN
    IF NEW.sex = 'M' THEN
		INSERT INTO trigger_test VALUES(CONCAT('insert male employee ', NEW.first_name));
	ELSEIF NEW.sex = 'F' THEN
		INSERT INTO trigger_test VALUES(CONCAT('insert female employee ', NEW.first_name));
	ELSE
		INSERT INTO trigger_test VALUES(CONCAT('insert employee ', NEW.first_name));
	END IF;
END$$
DELIMITER ;
*/


-- Another example: trigger when update
/*
DELIMITER $$
CREATE 
	TRIGGER trigger_when_update AFTER UPDATE
    ON employee
    FOR EACH ROW BEGIN
		INSERT INTO trigger_test VALUES(CONCAT('original name: ', OLD.first_name, ', ', 'new name: ', NEW.first_name));
	END$$
DELIMITER ;
*/


-- Another example: trigger on delete
/*
DELIMITER $$
CREATE
	TRIGGER trigger_when_delete BEFORE DELETE
    ON employee
    FOR EACH ROW BEGIN
		INSERT INTO trigger_test VALUES(CONCAT('delete user ', OLD.first_name));
	END$$
DELIMITER ;
*/


-- insert new employee
SELECT * FROM employee;

INSERT INTO employee
VALUES(109, 'Oscar', 'Martinez', '1968-02-19', 'M', 69000, 106, 3);
UPDATE employee
SET employee.first_name = 'OOOscar'
WHERE emp_id = 109;
DELETE FROM employee
WHERE emp_id = 109;

INSERT INTO employee
VALUES(110, 'Kevin', 'Malone', '1978-02-19', 'M', 69000, 106, 3);
DELETE FROM employee
WHERE emp_id = 110;

INSERT INTO employee
VALUES(111, 'Sally', 'Chen', '1990-03-29', 'F', 72000, 106, 3);
DELETE FROM employee
WHERE emp_id = 111;
