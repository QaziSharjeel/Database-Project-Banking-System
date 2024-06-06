SELECT * FROM bankingsystem.accounts;

SELECT SUM(balance) AS total_balance FROM accounts;

SELECT AVG(balance) AS avg_savings_balance FROM accounts WHERE account_type = 'Savings';

SELECT MIN(balance) AS min_checking_balance FROM accounts WHERE account_type = 'Checking';

SELECT customer_id, balance FROM accounts
ORDER BY balance DESC
LIMIT 1;

SELECT account_type, COUNT(*) AS account_count
FROM accounts
GROUP BY account_type
HAVING account_count > 2;

SELECT customer_id, COUNT(*) AS account_count
FROM accounts
GROUP BY customer_id
HAVING account_count > 1;

SELECT * FROM accounts
WHERE balance BETWEEN 500 AND 2000;


SELECT MAX(balance) AS max_balance FROM accounts;

SELECT AVG(balance) AS average_balance FROM accounts;