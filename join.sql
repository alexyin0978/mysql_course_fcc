-- JOIN
INSERT INTO branch VALUES(4, 'McDonalds', NULL, NULL);

-- Inner Join
-- Find all branches with a manager and their manager’s name:
SELECT employee.first_name, employee.last_name, branch.branch_name
FROM employee
JOIN branch
ON employee.emp_id = branch.mgr_id;

-- Left Join
-- Find all branches with a manager and the name of their managers along with other employees:
SELECT employee.first_name, employee.last_name, branch.branch_name
FROM employee
LEFT JOIN branch
ON employee.emp_id = branch.mgr_id;

-- Right Join
-- Find all branches and the name of their managers:
SELECT employee.first_name, employee.last_name, branch.branch_name
FROM employee
RIGHT JOIN branch
ON employee.emp_id = branch.mgr_id;