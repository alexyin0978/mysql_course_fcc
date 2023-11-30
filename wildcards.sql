-- wildcards

-- Find any client who are an LLC
SELECT * FROM client 
WHERE client_name LIKE '%LLC%';

-- Find any branch suppliers who are in the label business
SELECT * FROM branch_supplier
WHERE supplier_name LIKE '%Label%';

-- Find any employee born in Feb.
SELECT * FROM employee
WHERE birth_date LIKE '____-02-%';