SELECT * FROM bankingsystem.loans;

SELECT MAX(amount) AS max_loan_amount FROM loans;

SELECT AVG(amount) AS average_loan_amount FROM loans;

SELECT customer_id FROM loans
GROUP BY customer_id
HAVING COUNT(*) > 1;

SELECT * FROM loans
WHERE amount > (SELECT AVG(amount) FROM loans);

SELECT customer_id, SUM(amount) AS total_loan_amount
FROM loans
GROUP BY customer_id
HAVING total_loan_amount > 50000;

SELECT DISTINCT loan_type FROM loans;

SELECT * FROM loans
WHERE interest_rate > 4;

SELECT *
FROM loans
WHERE end_date > '2025-01-01';

SELECT *
FROM loans
WHERE amount < 20000 AND interest_rate > 4;

SELECT SUM(amount) AS total_loan_amount FROM loans;

SELECT customer_id, SUM(amount) AS total_loan_amount, COUNT(*) AS loan_count
FROM loans
GROUP BY customer_id;











