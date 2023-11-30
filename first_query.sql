CREATE TABLE student (
	student_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(20) NOT NULL,
    major VARCHAR(20) DEFAULT 'undecided'
);
DESCRIBE student;

DROP TABLE student;

ALTER TABLE student ADD gpa DECIMAL(3, 2);
ALTER TABLE student DROP COLUMN gpa;

SELECT * FROM student;

INSERT INTO student(name, major) VALUES('Alex', 'History');
INSERT INTO student(name, major) VALUES('Kevin', 'Nature');
INSERT INTO student(name, major) VALUES('Allen', 'CS');
INSERT INTO student(name, major) VALUES('Henry', 'CS');
INSERT INTO student(name, major) VALUES('Alan', 'CS');
INSERT INTO student(name, major) VALUES('Jessie', NULL);
INSERT INTO student(name) VALUES('Jessie');

UPDATE student
SET major = 'undecided'
WHERE student_id = 1;

DELETE FROM student
WHERE student_id = 2;

SELECT student.major FROM student;

SELECT student.name, student.major FROM student
WHERE name in ('Alex', 'Kevin')
ORDER BY name ASC
LIMIT 1;



