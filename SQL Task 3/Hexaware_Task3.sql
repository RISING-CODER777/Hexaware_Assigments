--Task 1
DROP DATABASE HMBank;

-- Create the database named "HMBank"
CREATE DATABASE HMBank;

-- Use the database 
USE HMBank;

DROP TABLE IF EXISTS Customers;
-- Create Table Customers
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(30),
    last_name VARCHAR(30),
    DOB DATE,
	email VARCHAR(30),
    phone_number VARCHAR(30),
	city VARCHAR(30)
);

-- Create Table Accounts
CREATE TABLE Accounts (
    account_id INT PRIMARY KEY,
    customer_id INT,
	CONSTRAINT FK_Customerid FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    account_type VARCHAR(30),
    balance INT
);

-- Create Table Transactions
CREATE TABLE Transactions (
    transaction_id INT,
    account_id INT,
	CONSTRAINT FK_Accountid FOREIGN KEY (account_id) REFERENCES Accounts(account_id),
	transaction_type VARCHAR(30),
	amount INT,
    transaction_date DATE
);

-- Tasks 2: Select, Where, Between, AND, LIKE:
-- 1. Insert at least 10 sample records into each of the following tables.

-- Insert Values into table Customers
INSERT INTO Customers VALUES
(1, 'Surya', 'Prakash', '1990-01-01', 'surya@gmail.com', '9876543210', 'Chennai'),
(2, 'Keith', 'Raja', '1995-05-15', 'keith@gmail.com', '8765432109', 'Delhi'),
(3, 'Arun', 'Pandi', '1988-08-25', 'arun@gmail.com', '7654321098', 'Pune'),
(4, 'Ashwin', 'Kumar', '1992-11-10', 'ashwin@gmail.com', '6543210987', 'Mumbai'),
(5, 'Rachin', 'Ravindra', '1998-03-20', 'rachin@gmail.com', '5432109876', 'Hyderabad'),
(6, 'Bala', 'Guru', '1997-07-05', 'bala@gmail.com', '4321098765', 'Bangalore'),
(7, 'Nishok', 'Krishna', '1994-09-30', 'nishok@gmail.com', '3210987654', 'Kolkata'),
(8, 'Raju', 'Singh', '1993-12-12', 'raju@gmail.com', '2109876543', 'Jaipur'),
(9, 'Praveen', 'Kumar', '1991-04-18', 'praveen@gmail.com', '1098765432', 'Ahmedabad'),
(10, 'Rahul', 'Singh', '1996-06-28', 'rahul@gmail.com', '9876543210', 'Chandigarh');

-- Insert Values into table Accounts
INSERT INTO Accounts VALUES
(101, 1, 'Savings', 5000),
(102, 2, 'Current', 10000),
(103, 3, 'Savings', 7500),
(104, 4, 'Current', 6000),
(105, 5, 'Savings', 3000),
(106, 6, 'Current', 8500),
(107, 7, 'Savings', 4000),
(108, 8, 'Zero_Balance', 0),
(109, 9, 'Savings', 6000),
(110, 10, 'Current', 7000);

INSERT INTO Accounts VALUES
(111, 1, 'Current', 8000);
-- Insert Values into table Transactions
INSERT INTO Transactions VALUES
(201, 101, 'deposit', 2000, '2024-04-13'),
(202, 102, 'withdrawal', 3000, '2024-04-14'),
(203, 103, 'transfer', 2500, '2024-04-15'),
(204, 104, 'deposit', 1500, '2024-04-16'),
(205, 105, 'withdrawal', 1000, '2024-04-17'),
(206, 106, 'transfer', 2000, '2024-04-18'),
(207, 107, 'deposit', 1800, '2024-04-19'),
(208, 108, 'withdrawal', 0, '2024-04-20'),
(209, 109, 'transfer', 2500, '2024-04-21'),
(210, 110, 'deposit', 3500, '2024-04-22');


-- SELECT all the rows
SELECT * FROM Customers;

--2. Write SQL queries for the following tasks:

--2- 1. Write a SQL query to retrieve the name, account type and email of all customers.

SELECT CONCAT(first_name,' ',last_name)  AS CustomerName, account_type ,email FROM Customers c , Accounts a
WHERE c.customer_id=a.customer_id;

--2- 2. Write a SQL query to list all transaction corresponding customer.

SELECT  CONCAT(c.first_name,' ',c.last_name)  AS CustomerName, t.transaction_id, t.account_id, t.transaction_type , t.amount, t.transaction_date
FROM Customers c , Accounts a , Transactions t WHERE c.customer_id=a.customer_id AND a.account_id=t.account_id;

--2- 3. Write a SQL query to increase the balance of a specific account by a certain amount.

UPDATE  Accounts SET balance = balance *1.10 WHERE account_type = 'Savings';
SELECT * FROM Accounts;

--2- 4. Write a SQL query to Combine first and last names of customers as a full_name.
SELECT CONCAT(first_name,' ',last_name)  AS full_name FROM Customers;

--2- 5. Write a SQL query to remove accounts with a balance of zero where the account
--type is savings.

INSERT INTO Accounts VALUES(111, 1, 'Savings', 0);

DELETE FROM Accounts WHERE balance = 0 AND account_type = 'Savings';

--2. 6. Write a SQL query to Find customers living in a specific city.

SELECT * FROM Customers WHERE city= 'Chennai';

--2- 7. Write a SQL query to Get the account balance for a specific account.

SELECT balance FROM Accounts WHERE account_id=105;

--2- 8. Write a SQL query to List all current accounts with a balance greater than $1,000.

SELECT account_id FROM Accounts WHERE account_type = 'Current' AND balance > 1000;

--2- 9. Write a SQL query to Retrieve all transactions for a specific account.
SELECT * FROM Transactions WHERE account_id=104;

--10. Write a SQL query to Calculate the interest accrued on savings accounts based on a given interest rate.

DECLARE @InterestRate DECIMAL(5,2) ;
SET @InterestRate = 5.00;
SELECT account_id , balance , FORMAT(balance * (@InterestRate / 100), '0.00') AS InterestAccured FROM Accounts ;

--11. Write a SQL query to Identify accounts where the balance is less than a specified overdraft limit.
DECLARE @OverdraftLimit INT = 5000;

SELECT * FROM Accounts WHERE balance < @OverdraftLimit;
--12. Write a SQL query to Find customers not living in a specific city.

SELECT * FROM Customers WHERE city NOT IN ('Mumbai','Hyderabad','Bangalore');


-- Tasks 3: Aggregate functions, Having, Order By, GroupBy and Joins:

--1. Write a SQL query to Find the average account balance for all customers.
SELECT AVG(balance) AS AverageAccountBalance FROM Accounts;

--2. Write a SQL query to Retrieve the top 10 highest account balances.

SELECT TOP 10 balance AS HighestAccountBalances FROM Accounts ORDER BY balance DESC;

--3. Write a SQL query to Calculate Total Deposits for All Customers in specific date.

SELECT SUM(amount) AS TotalDeposits FROM Transactions WHERE transaction_type='Deposit' 
AND transaction_date BETWEEN '2024-04-13'AND '2024-04-20';

--4. Write a SQL query to Find the Oldest and Newest Customers.

-- Oldest Customer
SELECT TOP 1 * FROM Customers ORDER BY DOB ASC;

-- Newest Customer
SELECT TOP 1 * FROM Customers ORDER BY DOB DESC;

--5.Write a SQL query to Retrieve transaction details along with the account type.
SELECT t.transaction_id , t.transaction_type, t.transaction_date, t.account_id, a.account_type FROM Transactions t
JOIN Accounts a  ON t.account_id = a.account_id;

--6. Write a SQL query to Get a list of customers along with their account details.

SELECT c.customer_id, CONCAT(c.first_name,'',c.last_name ) AS CustomerName, a.account_id , a.account_type , balance FROM Customers c
JOIN Accounts a  ON c.customer_id = a.customer_id;

--7.  Write a SQL query to Retrieve transaction details along with customer information for a
--specific account.

SELECT c.customer_id, CONCAT(c.first_name,'',c.last_name ) AS CustomerName , t.transaction_id, t.transaction_type, t.amount, t.transaction_date 
FROM Customers c  JOIN Accounts a ON c.customer_id = a.customer_id 
JOIN Transactions t ON t.account_id = a.account_id WHERE a.account_id=102;

--8. Write a SQL query to Identify customers who have more than one account.
SELECT c.customer_id, CONCAT(c.first_name,'',c.last_name ) AS CustomerName  FROM Customers c JOIN 
Accounts a ON c.customer_id = a.customer_id GROUP BY c.customer_id, c.first_name,c.last_name
HAVING COUNT(a.account_id)>1;

--9. Write a SQL query to Calculate the difference in transaction amounts between deposits and withdrawals.
SELECT ABS(SUM(amount * CASE WHEN transaction_type = 'deposit' THEN 1 ELSE -1 END)) AS Difference
FROM Transactions;

--10. Write a SQL query to Calculate the average daily balance for each account over a specified period.

SELECT AVG(a.balance) AS AverageBalance FROM Accounts a  JOIN  Transactions t
ON a.account_id = t.account_id   WHERE t.transaction_date  BETWEEN '2024-04-13'AND '2024-04-20'
GROUP BY a.account_id;

--11. Calculate the total balance for each account type.
SELECT account_type , SUM(balance) AS TotalBalance FROM Accounts
GROUP BY account_type;

--12. Identify accounts with the highest number of transactions order by descending order.

SELECT account_id , COUNT(transaction_id) AS NumTransactions FROM Transactions GROUP BY account_id  ORDER BY NumTransactions DESC;

--13. List customers with high aggregate account balances, along with their account types.
SELECT CONCAT(c.first_name,' ',c.last_name)  AS full_name ,a.account_id ,a.account_type , SUM(balance) AS HighAccountBalance 
FROM Accounts a  JOIN Customers c ON a.customer_id = c.customer_id GROUP BY c.first_name ,c.last_name ,account_id ,a.account_type
ORDER BY HighAccountBalance DESC;

--14. Identify and list duplicate transactions based on transaction amount, date, and account.
INSERT INTO Transactions VALUES(211, 101, 'deposit', 2000, '2024-04-13');
INSERT INTO Transactions VALUES(212, 101, 'deposit', 2000, '2024-04-13');

SELECT account_id, amount, transaction_date, COUNT(*) AS duplicate_count FROM Transactions
GROUP BY account_id, amount, transaction_date HAVING COUNT(*) > 1;

-- Tasks 4: Subquery and its type:

--1. Retrieve the customer(s) with the highest account balance.

SELECT customer_id , CONCAT(first_name,' ',last_name)  AS full_name FROM Customers WHERE customer_id = 
(SELECT TOP 1 customer_id FROM Accounts ORDER BY balance DESC);


--2. Calculate the average account balance for customers who have more than one account.
SELECT AVG(balance) AS AverageAccountBalance FROM Accounts WHERE customer_id IN
(SELECT customer_id FROM Accounts GROUP BY customer_id HAVING COUNT(account_id)>1);


--3. Retrieve accounts with transactions whose amounts exceed the average transaction amount.

SELECT t.account_id, t.transaction_id, t.transaction_type, t.amount
FROM Transactions t WHERE t.amount > (SELECT AVG(amount) FROM Transactions);

--4. Identify customers who have no recorded transactions.
INSERT INTO Customers VALUES
(11, 'Aarav', 'Patel', '1990-05-15', 'aarav@gmail.com', '9876543211', 'Mumbai');

SELECT customer_id , CONCAT(first_name,' ',last_name)  AS full_name FROM Customers WHERE customer_id NOT IN(
SELECT a.customer_id FROM Accounts a JOIN Transactions t ON a.account_id=t.account_id );

--5. Calculate the total balance of accounts with no recorded transactions.

SELECT SUM(balance) AS TotalBalance 
FROM Accounts WHERE account_id NOT IN (SELECT  DISTINCT account_id FROM Transactions);

--6. Retrieve transactions for accounts with the lowest balance.

SELECT transaction_id FROM Transactions WHERE account_id=(SELECT TOP 1 account_id FROM Accounts ORDER BY balance ASC );

--7. Identify customers who have accounts of multiple types.
SELECT CONCAT(first_name,' ',last_name)  AS full_name FROM Customers WHERE customer_id IN (
SELECT customer_id FROM Accounts  GROUP BY customer_id HAVING COUNT( DISTINCT account_type)>1);


--8. Calculate the percentage of each account type out of the total number of accounts.
SELECT account_type , SUM(balance) AS TotalBalance ,FORMAT((SUM(balance)*100.0 /(SELECT SUM(balance) FROM Accounts)),'0.00') AS PercentageOfAccount 
FROM Accounts  GROUP BY account_type;


--9. Retrieve all transactions for a customer with a given customer_id.

DECLARE @CustomerID INT =2;
SELECT t.transaction_id , t.transaction_type , t.transaction_date ,t.account_id , t.amount FROM Transactions t 
WHERE t.account_id IN (SELECT account_id FROM Accounts a  WHERE a.customer_id = @CustomerID);

--10. Calculate the total balance for each account type, including a subquery within the SELECT clause.

SELECT account_type ,(SELECT SUM(balance) FROM Accounts a1 WHERE a1.account_type=a2.account_type 
) AS TotalBalance  FROM Accounts a2 GROUP BY account_type;