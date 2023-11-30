-- Functions

-- Find the number of employees (employee list length)
SELECT COUNT(emp_id) FROM employee;

-- Find the number of female employees born after 1970, and show their avg salary
SELECT COUNT(emp_id), AVG(salary) FROM employee
WHERE sex = 'F' AND birth_date > '1970-12-31';

-- Find the average of all employee’s salaries
SELECT AVG(salary) FROM employee;

-- Find the sum of all employees salaries
SELECT SUM(salary) FROM employee;

-- Find out how many males and females there are
SELECT COUNT(sex), sex FROM employee
GROUP BY sex;

-- Find the total sales of each salesman 
SELECT total_sales, emp_id FROM works_with;

-- Find out total spend of each client
SELECT client_id, total_sales AS total_spend FROM works_with;