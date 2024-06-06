SELECT * FROM bankingsystem.employees;

SELECT branch_id, COUNT(*) AS employee_count FROM employees GROUP BY branch_id;

SELECT e.*, b.name AS branch_name, b.city, b.state
FROM employees e
JOIN branches b ON e.branch_id = b.id;

SELECT branch_id FROM employees
GROUP BY branch_id
ORDER BY COUNT(*) DESC
LIMIT 1;

SELECT branch_id, COUNT(*) AS employee_count
FROM employees
GROUP BY branch_id
HAVING employee_count > 2;

SELECT * FROM employees
WHERE YEAR(hire_date) < 2024;

SELECT * FROM employees
WHERE hire_date LIKE '2023%';

SELECT *
FROM employees
WHERE hire_date BETWEEN '2021-01-01' AND '2021-12-31';

SELECT e.id, e.first_name, e.last_name
FROM employees e
JOIN branches b ON e.branch_id = b.id
GROUP BY e.id, e.first_name, e.last_name
HAVING COUNT(DISTINCT e.branch_id) > 1;








