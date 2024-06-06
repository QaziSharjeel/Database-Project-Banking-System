SELECT * FROM bankingsystem.loan_payments;

SELECT SUM(amount) AS total_interest_paid
FROM loan_payments;

SELECT lp.*, l.loan_type, c.first_name, c.last_name
FROM loan_payments lp
JOIN loans l ON lp.loan_id = l.id
JOIN customers c ON l.customer_id = c.id;

