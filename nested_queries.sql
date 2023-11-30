-- Nested Queries

-- Find names of all employees who have sold over 30000 to a single client
SELECT employee.first_name, employee.last_name FROM employee
WHERE employee.emp_id IN (
	SELECT works_with.emp_id FROM works_with
	WHERE works_with.total_sales > 30000
);

-- NOTED: this doesn't work
-- if one person sales to multiple clients for more than 30000
-- the person's name will be shown repeatedly
SELECT employee.first_name, employee.last_name, works_with.client_id, works_with.total_sales
FROM employee
JOIN works_with
ON employee.emp_id = works_with.emp_id
WHERE works_with.total_sales > 30000;

-- Find names of all employees who have sold over 30000 to a single client and their min sales over 30000:
SELECT employee.first_name, employee.last_name, MIN(works_with.total_sales)
FROM employee
JOIN works_with
ON employee.emp_id = works_with.emp_id
WHERE employee.emp_id IN (
	SELECT works_with.emp_id FROM works_with
	WHERE works_with.total_sales > 30000
) AND works_with.total_sales > 30000
GROUP BY employee.emp_id
ORDER BY employee.emp_id DESC;

-- Find all employees who are handled by the branch that Michael Scott manages, assume you know Michael’s ID:
SELECT employee.first_name, employee.last_name 
FROM employee
WHERE employee.branch_id IN (
	SELECT branch.branch_id FROM branch
	WHERE branch.mgr_id = 102
) AND employee.emp_id <> 102;

-- Find all clients who are handled by the branch that Michael Scott manages, assume you know Michael’s ID:
SELECT client.client_name FROM client
WHERE client.branch_id = (
	SELECT branch.branch_id FROM branch
	WHERE branch.mgr_id = 102
    LIMIT 1
);



