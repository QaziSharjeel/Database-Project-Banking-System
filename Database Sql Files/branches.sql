SELECT * FROM bankingsystem.branches;

SELECT DISTINCT city FROM branches;

SELECT b.name AS branch_name, SUM(a.balance) AS total_balance
FROM branches b
JOIN customers c ON b.city = c.city AND b.state = c.state
JOIN accounts a ON c.id = a.customer_id
GROUP BY b.name;

