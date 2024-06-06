use BankingSystem;
CREATE TABLE customers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    phone VARCHAR(15),
    address VARCHAR(255),
    city VARCHAR(100),
    state VARCHAR(100),
    zip_code VARCHAR(10)
);

CREATE TABLE accounts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    account_number VARCHAR(20),
    account_type VARCHAR(50),
    balance DECIMAL(10, 2),
    created_at DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(id)
);

CREATE TABLE transactions (
    id INT AUTO_INCREMENT PRIMARY KEY,
    account_id INT,
    transaction_type VARCHAR(50),
    amount DECIMAL(10, 2),
    transaction_date DATE,
    FOREIGN KEY (account_id) REFERENCES accounts(id)
);

CREATE TABLE loans (
    id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    loan_type VARCHAR(50),
    amount DECIMAL(10, 2),
    interest_rate DECIMAL(5, 2),
    start_date DATE,
    end_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(id)
);

CREATE TABLE branches (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    address VARCHAR(255),
    city VARCHAR(100),
    state VARCHAR(100),
    zip_code VARCHAR(10)
);

CREATE TABLE employees (
    id INT AUTO_INCREMENT PRIMARY KEY,
    branch_id INT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    phone VARCHAR(15),
    hire_date DATE,
    FOREIGN KEY (branch_id) REFERENCES branches(id)
);

CREATE TABLE customer_contacts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    contact_type VARCHAR(50),
    contact_value VARCHAR(100),
    FOREIGN KEY (customer_id) REFERENCES customers(id)
);

CREATE TABLE account_types (
    id INT AUTO_INCREMENT PRIMARY KEY,
    type_name VARCHAR(50)
);

CREATE TABLE loan_payments (
    id INT AUTO_INCREMENT PRIMARY KEY,
    loan_id INT,
    payment_date DATE,
    amount DECIMAL(10, 2),
    FOREIGN KEY (loan_id) REFERENCES loans(id)
);

CREATE TABLE employee_roles (
    id INT AUTO_INCREMENT PRIMARY KEY,
    role_name VARCHAR(50),
    employee_id INT,
    FOREIGN KEY (employee_id) REFERENCES employees(id)
);

-- Customers
INSERT INTO customers (first_name, last_name, email, phone, address, city, state, zip_code) VALUES
('John', 'Doe', 'john.doe@example.com', '555-1234', '123 Main St', 'Springfield', 'IL', '62701'),
('Jane', 'Smith', 'jane.smith@example.com', '555-5678', '456 Elm St', 'Springfield', 'IL', '62701'),
('Emily', 'Johnson', 'emily.johnson@example.com', '555-8765', '789 Oak St', 'Shelbyville', 'IL', '62565'),
('Michael', 'Brown', 'michael.brown@example.com', '555-4321', '101 Pine St', 'Capital City', 'IL', '62704'),
('Laura', 'Davis', 'laura.davis@example.com', '555-6789', '202 Birch St', 'Capital City', 'IL', '62704');

-- Accounts
INSERT INTO accounts (customer_id, account_number, account_type, balance, created_at) VALUES
(1, '1001', 'Checking', 1500.00, '2023-01-01'),
(2, '1002', 'Savings', 2500.00, '2023-02-01'),
(3, '1003', 'Checking', 500.00, '2023-03-01'),
(4, '1004', 'Savings', 10000.00, '2023-04-01'),
(5, '1005', 'Checking', 200.00, '2023-05-01');

-- Transactions
INSERT INTO transactions (account_id, transaction_type, amount, transaction_date) VALUES
(1, 'Deposit', 500.00, '2024-01-01'),
(2, 'Withdrawal', 200.00, '2024-02-01'),
(3, 'Deposit', 300.00, '2024-03-01'),
(4, 'Withdrawal', 1000.00, '2024-04-01'),
(5, 'Deposit', 150.00, '2024-05-01');

-- Loans
INSERT INTO loans (customer_id, loan_type, amount, interest_rate, start_date, end_date) VALUES
(1, 'Home Loan', 200000.00, 3.5, '2023-01-01', '2033-01-01'),
(2, 'Car Loan', 30000.00, 4.0, '2023-02-01', '2028-02-01'),
(3, 'Personal Loan', 10000.00, 5.0, '2023-03-01', '2026-03-01'),
(4, 'Student Loan', 50000.00, 2.5, '2023-04-01', '2033-04-01'),
(5, 'Business Loan', 100000.00, 4.5, '2023-05-01', '2033-05-01');

-- Branches
INSERT INTO branches (name, address, city, state, zip_code) VALUES
('Main Branch', '123 Main St', 'Springfield', 'IL', '62701'),
('North Branch', '456 North St', 'Springfield', 'IL', '62701'),
('East Branch', '789 East St', 'Shelbyville', 'IL', '62565'),
('South Branch', '101 South St', 'Capital City', 'IL', '62704'),
('West Branch', '202 West St', 'Capital City', 'IL', '62704');

-- Employees
INSERT INTO employees (branch_id, first_name, last_name, email, phone, hire_date) VALUES
(1, 'Alice', 'Johnson', 'alice.johnson@example.com', '555-1111', '2023-01-01'),
(2, 'Bob', 'Smith', 'bob.smith@example.com', '555-2222', '2023-02-01'),
(3, 'Charlie', 'Brown', 'charlie.brown@example.com', '555-3333', '2023-03-01'),
(4, 'Daisy', 'Miller', 'daisy.miller@example.com', '555-4444', '2023-04-01'),
(5, 'Eve', 'Davis', 'eve.davis@example.com', '555-5555', '2023-05-01');

-- Customer Contacts
INSERT INTO customer_contacts (customer_id, contact_type, contact_value) VALUES
(1, 'Phone', '555-1234'),
(1, 'Email', 'john.doe@example.com'),
(2, 'Phone', '555-5678'),
(2, 'Email', 'jane.smith@example.com'),
(3, 'Phone', '555-8765');

-- Account Types
INSERT INTO account_types (type_name) VALUES
('Checking'),
('Savings'),
('Credit'),
('Loan'),
('Mortgage');

-- Loan Payments
INSERT INTO loan_payments (loan_id, payment_date, amount) VALUES
(1, '2023-02-01', 1500.00),
(1, '2023-03-01', 1500.00),
(2, '2023-03-01', 500.00),
(3, '2023-04-01', 300.00),
(4, '2023-05-01', 1000.00);

-- Employee Roles
INSERT INTO employee_roles (role_name, employee_id) VALUES
('Manager', 1),
('Teller', 2),
('Loan Officer', 3),
('Customer Service', 4),
('IT Support', 5);

### Functions

SELECT SUM(balance) AS total_balance FROM accounts;

SELECT AVG(balance) AS avg_savings_balance FROM accounts WHERE account_type = 'Savings';

SELECT MAX(amount) AS max_loan_amount FROM loans;

SELECT MIN(balance) AS min_checking_balance FROM accounts WHERE account_type = 'Checking';

SELECT branch_id, COUNT(*) AS employee_count FROM employees GROUP BY branch_id;

SELECT COUNT(*) AS transaction_count FROM transactions
WHERE DATE(transaction_date) = '2023-01-10';

SELECT AVG(amount) AS average_loan_amount FROM loans;

SELECT account_number, MAX(balance) AS highest_balance
FROM accounts;

SELECT COUNT(*) AS customers_with_emails
FROM customers
WHERE email IS NOT NULL;

SELECT SUM(amount) AS total_interest_paid
FROM loan_payments;

### Joins
SELECT c.first_name, c.last_name, a.account_number, a.balance
FROM customers c
JOIN accounts a ON c.id = a.customer_id;

SELECT t.*, a.account_number, c.first_name, c.last_name
FROM transactions t
JOIN accounts a ON t.account_id = a.id
JOIN customers c ON a.customer_id = c.id;

SELECT lp.*, l.loan_type, c.first_name, c.last_name
FROM loan_payments lp
JOIN loans l ON lp.loan_id = l.id
JOIN customers c ON l.customer_id = c.id;

SELECT e.*, b.name AS branch_name, b.city, b.state
FROM employees e
JOIN branches b ON e.branch_id = b.id;

SELECT at.type_name, a.account_number, a.balance
FROM account_types at
JOIN accounts a ON at.type_name = a.account_type;

### Subqueries
SELECT * FROM accounts
WHERE balance > (SELECT AVG(balance) FROM accounts);

SELECT customer_id FROM loans
GROUP BY customer_id
HAVING COUNT(*) > 1;

SELECT branch_id FROM employees
GROUP BY branch_id
ORDER BY COUNT(*) DESC
LIMIT 1;

SELECT * FROM loans
WHERE amount > (SELECT AVG(amount) FROM loans);

SELECT customer_id, balance FROM accounts
ORDER BY balance DESC
LIMIT 1;

### Having Clause
SELECT customer_id, SUM(amount) AS total_loan_amount
FROM loans
GROUP BY customer_id
HAVING total_loan_amount > 50000;

SELECT branch_id, COUNT(*) AS employee_count
FROM employees
GROUP BY branch_id
HAVING employee_count > 2;

SELECT account_type, COUNT(*) AS account_count
FROM accounts
GROUP BY account_type
HAVING account_count > 2;

SELECT customer_id, COUNT(*) AS account_count
FROM accounts
GROUP BY customer_id
HAVING account_count > 1;

SELECT * FROM employees
WHERE YEAR(hire_date) < 2024;

### Distinct Functions
SELECT DISTINCT city FROM branches;

SELECT DISTINCT account_type FROM accounts;

SELECT DISTINCT loan_type FROM loans;

SELECT DISTINCT role_name FROM employee_roles;

SELECT DISTINCT transaction_type FROM transactions;

### Operators
SELECT * FROM accounts
WHERE balance BETWEEN 500 AND 2000;

SELECT * FROM loans
WHERE interest_rate > 4;

SELECT * FROM employees
WHERE hire_date LIKE '2023%';

SELECT * FROM transactions
WHERE amount > 300;

SELECT * FROM accounts
WHERE balance < 500;

SELECT *
FROM customers
WHERE first_name LIKE 'J%';

SELECT *
FROM loans
WHERE end_date > '2025-01-01';

SELECT *
FROM employees
WHERE hire_date BETWEEN '2021-01-01' AND '2021-12-31';

SELECT *
FROM loans
WHERE amount < 20000 AND interest_rate > 4;

SELECT *
FROM customers
WHERE last_name LIKE '%son';

### Aggregate Functions
SELECT SUM(amount) AS total_transaction_amount FROM transactions;

SELECT AVG(balance) AS average_balance FROM accounts;

SELECT COUNT(*) AS customer_count FROM customers;

SELECT SUM(amount) AS total_loan_amount FROM loans;

SELECT MAX(balance) AS max_balance FROM accounts;

### Complex Queries
SELECT customer_id, SUM(amount) AS total_loan_amount, COUNT(*) AS loan_count
FROM loans
GROUP BY customer_id;

SELECT c.id, c.first_name, c.last_name
FROM customers c
JOIN accounts a1 ON c.id = a1.customer_id AND a1.account_type = 'Checking'
JOIN accounts a2 ON c.id = a2.customer_id AND a2.account_type = 'Savings';

SELECT e.id, e.first_name, e.last_name
FROM employees e
JOIN branches b ON e.branch_id = b.id
GROUP BY e.id, e.first_name, e.last_name
HAVING COUNT(DISTINCT e.branch_id) > 1;

SELECT b.name AS branch_name, SUM(a.balance) AS total_balance
FROM branches b
JOIN customers c ON b.city = c.city AND b.state = c.state
JOIN accounts a ON c.id = a.customer_id
GROUP BY b.name;

SELECT c.id, c.first_name, c.last_name
FROM customers c
LEFT JOIN accounts a ON c.id = a.customer_id
LEFT JOIN transactions t ON a.id = t.account_id AND t.transaction_date LIKE '2024%'
WHERE t.id IS NULL;
