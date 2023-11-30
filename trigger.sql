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

DELIMITER $$
CREATE
	TRIGGER trigger_with_new_data BEFORE INSERT
    ON employee
    FOR EACH ROW BEGIN
		INSERT INTO trigger_test VALUES('hihi');
	END$$
DELIMITER ;


-- insert new employee
INSERT INTO employee
VALUES(109, 'Oscar', 'Martinez', '1968-02-19', 'M', 69000, 106, 3);
INSERT INTO employee
VALUES(109, 'Kevin', 'Malone', '1978-02-19', 'M', 69000, 106, 3);
