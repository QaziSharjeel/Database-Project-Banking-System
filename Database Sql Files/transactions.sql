SELECT * FROM bankingsystem.transactions;

SELECT COUNT(*) AS transaction_count FROM transactions
WHERE DATE(transaction_date) = '2023-01-10';

SELECT t.*, a.account_number, c.first_name, c.last_name
FROM transactions t
JOIN accounts a ON t.account_id = a.id
JOIN customers c ON a.customer_id = c.id;

SELECT DISTINCT transaction_type FROM transactions;

SELECT * FROM transactions
WHERE amount > 300;

SELECT SUM(amount) AS total_transaction_amount FROM transactions;






