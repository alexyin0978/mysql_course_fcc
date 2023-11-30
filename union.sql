-- Union

SELECT first_name AS name FROM employee
WHERE sex = 'F'
UNION
SELECT branch_name FROM branch;