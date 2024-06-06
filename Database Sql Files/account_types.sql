SELECT * FROM bankingsystem.account_types;

SELECT AVG(balance) AS avg_savings_balance FROM accounts WHERE account_type = 'Savings';

SELECT MIN(balance) AS min_checking_balance FROM accounts WHERE account_type = 'Checking';

SELECT at.type_name, a.account_number, a.balance
FROM account_types at
JOIN accounts a ON at.type_name = a.account_type;

SELECT account_type, COUNT(*) AS account_count
FROM accounts
GROUP BY account_type
HAVING account_count > 2;


