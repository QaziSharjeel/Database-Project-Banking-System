SELECT * FROM bankingsystem.customers;

SELECT COUNT(*) AS customers_with_emails
FROM customers
WHERE email IS NOT NULL;

SELECT c.first_name, c.last_name, a.account_number, a.balance
FROM customers c
JOIN accounts a ON c.id = a.customer_id;

SELECT *
FROM customers
WHERE first_name LIKE 'J%';

SELECT *
FROM customers
WHERE last_name LIKE '%son';

SELECT COUNT(*) AS customer_count FROM customers;

SELECT c.id, c.first_name, c.last_name
FROM customers c
JOIN accounts a1 ON c.id = a1.customer_id AND a1.account_type = 'Checking'
JOIN accounts a2 ON c.id = a2.customer_id AND a2.account_type = 'Savings';

SELECT c.id, c.first_name, c.last_name
FROM customers c
LEFT JOIN accounts a ON c.id = a.customer_id
LEFT JOIN transactions t ON a.id = t.account_id AND t.transaction_date LIKE '2024%'
WHERE t.id IS NULL;

