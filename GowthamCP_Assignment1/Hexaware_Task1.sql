-- TASK 1
-- Create the database named "TechShop"
CREATE DATABASE TechShop;

-- Use the database 
USE TechShop;

-- Create Table Customers
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(30),
    LastName VARCHAR(30),
    Email VARCHAR(30),
    Phone VARCHAR(30),
    Address VARCHAR(50)
);

-- Create Table Products
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(30),
    Description VARCHAR(50),
    Price INT
);

-- Add the CategoryID column to the Products table
ALTER TABLE Products
ADD CategoryID INT;

-- Add the foreign key constraint
ALTER TABLE Products
ADD CONSTRAINT FK_CategoryID FOREIGN KEY (CategoryID) REFERENCES Category(CategoryID);

-- Create Table Orders
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    CONSTRAINT FK_CustomerID FOREIGN KEY(CustomerID) REFERENCES Customers(CustomerID),
    OrderDate DATE,
    TotalAmount INT
);
ALTER TABLE Orders
ADD Status VARCHAR(30);

-- Create Table OrderDetails
CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY,
    OrderID INT,
    CONSTRAINT FK_OrderID FOREIGN KEY(OrderID) REFERENCES Orders(OrderID),
    ProductID INT,
    CONSTRAINT FK_ProductID FOREIGN KEY(ProductID) REFERENCES Products(ProductID),
    Quantity INT
);

-- Create Table Inventory
CREATE TABLE Inventory (
    InventoryID INT PRIMARY KEY,
    ProductID INT,
    CONSTRAINT FK_InventoryProductID FOREIGN KEY(ProductID) REFERENCES Products(ProductID),
    QuantityInStock INT,
    LastStockUpdate DATE
);

-- Create Table Category
CREATE TABLE Category (
    CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR(30)
);

-- Insert Values into table Customers
INSERT INTO Customers  VALUES
(1, 'Surya', 'Prakash', 'surya@gmail.com', '9876543210', '1st Main St, Bangalore'),
(2, 'Keith', 'Raja', 'keith@gmail.com', '8765432109', '2nd West St, Mumbai'),
(3, 'Arun', 'Pandi', 'arun@gmail.com', '7654321098', '3rd East St, Chennai'),
(4, 'Ashwin', 'Kumar', 'ashwin@gmail.com', '6543210987', '4th Hollow St, Hyderabad'),
(5, 'Rachin', 'Ravindra', 'rachin@gmail.com', '5432109876', '5th North St, Kolkata'),
(6, 'Bala', 'Guru', 'bala@gmail.com', '4321098765', '6th North Gate St, Delhi'),
(7, 'Nishok', 'Krishna', 'nishok@gmail.com', '3210987654', '7th Mount St, Pune'),
(8, 'Raju', 'Singh', 'raju@gmail.com', '2109876543', '8th Mahadev St, Jaipur'),
(9, 'Praveen', 'Kumar', 'praveen@gmail.com', '1098765432', '9th Garden St, Ahmedabad'),
(10, 'Rahul', 'Singh', 'rahul@gmail.com', '0987654321', '10th LuckyBuilders St, Lucknow');


-- Insert Values into table Products
INSERT INTO Products (ProductID, ProductName, Description, Price) VALUES
(1, 'Laptop', 'High-performance laptop', 1000),
(2, 'Smartphone', 'Latest smartphone model', 800),
(3, 'Tablet', 'Compact tablet device', 500),
(4, 'Smartwatch', 'Fitness and smart features', 300),
(5, 'Headphones', 'Wireless noise-cancelling headphones', 200),
(6, 'Camera', 'Digital camera with advanced features', 700),
(7, 'Printer', 'All-in-one printer for home and office', 400),
(8, 'Speaker', 'High-quality Bluetooth speaker', 250),
(9, 'Laptop Sleeves', 'Protective covers for laptops', 99),
(10, 'AC', 'Air conditioner for cooling rooms', 149);


DELETE FROM OrderDetails;

-- Insert Values into table Orders
INSERT INTO Orders (OrderID, CustomerID, OrderDate, TotalAmount, Status) VALUES
(100, 1, '2024-04-01', 1200, 'Pending'),
(101, 2, '2024-04-02', 900, 'Shipped'),
(102, 3, '2024-04-03', 600, 'Pending'),
(103, 4, '2024-04-04', 1500, 'Shipped'),
(104, 5, '2024-04-05', 400, 'Pending'),
(105, 6, '2024-04-06', 800, 'Shipped'),
(106, 7, '2024-04-07', 1000, 'Pending'),
(107, 8, '2024-04-08', 700, 'Shipped'),
(108, 9, '2024-04-09', 300, 'Pending'),
(109, 10, '2024-04-10', 200, 'Shipped');

INSERT INTO Orders (OrderID, CustomerID, OrderDate, TotalAmount, Status) VALUES
(110, 2, '2024-04-05', 100, 'Shipped');

-- Insert Values into table OrderDetails
INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, Quantity) VALUES
(200, 100, 1, 2),
(201, 100, 3, 1),
(202, 101, 2, 1),
(203, 102, 4, 3),
(204, 103, 1, 1),
(205, 103, 5, 2),
(206, 104, 3, 1),
(207, 105, 6, 1),
(208, 106, 2, 1),
(209, 107, 8, 1);

-- Insert Values into table Inventory
INSERT INTO Inventory (InventoryID, ProductID, QuantityInStock, LastStockUpdate) VALUES
(300, 1, 20, '2024-04-01'),
(301, 2, 15, '2024-04-02'),
(302, 3, 10, '2024-04-03'),
(303, 4, 5, '2024-04-04'),
(304, 5, 30, '2024-04-05'),
(305, 6, 8, '2024-04-06'),
(306, 7, 12, '2024-04-07'),
(307, 8, 18, '2024-04-08'),
(308, 9, 25, '2024-04-09'),
(309, 10, 7, '2024-04-10');

INSERT INTO Category (CategoryID, CategoryName) VALUES
(1, 'Laptops'),
(2, 'Smartphones'),
(3, 'Tablets'),
(4, 'Wearable Devices'),
(5, 'Audio Devices'),
(6, 'Cameras'),
(7, 'Printers'),
(8, 'Speakers'),
(9, 'Accessories'),
(10, 'Appliances');


--Updating the ProductID
UPDATE Products
SET CategoryID = 
    CASE 
        WHEN ProductID IN (1, 9) THEN 1  
        WHEN ProductID IN (2, 3) THEN 2  
        WHEN ProductID IN (4, 5) THEN 3  
        WHEN ProductID = 6 THEN 4       
        WHEN ProductID = 7 THEN 5        
        WHEN ProductID = 8 THEN 6    
        WHEN ProductID = 10 THEN 7       
        ELSE NULL 
    END;


-- SELECT all the rows
SELECT * FROM OrderDetails;

--TASK 2

--1. Write an SQL query to retrieve the names and emails of all customers.
SELECT CONCAT(FirstName,'' ,LastName) AS CustomerName , Email FROM Customers;

--2. Write an SQL query to list all orders with their order dates and corresponding customer names.
SELECT O.OrderID, O.OrderDate, CONCAT(C.FirstName, ' ', C.LastName) AS CustomerName
FROM Orders O, Customers C
WHERE O.CustomerID = C.CustomerID;

--3. Write an SQL query to insert a new customer record into the "Customers" table. Include 
--customer information such as name, email, and address.

INSERT INTO Customers  VALUES
(11, 'Shardul', 'Takur', 'shardul@gmail.com', '9876543230', '1st East St, Gujarat');

--4. Write an SQL query to update the prices of all electronic gadgets in the "Products" table by
--increasing them by 10%.

UPDATE Products SET Price = Price * 1.10;

--5. Write an SQL query to delete a specific order and its associated order details from the
--"Orders" and "OrderDetails" tables. Allow users to input the order ID as a parameter.

DECLARE @OrderID INT;
SET @OrderID =102 
DELETE FROM OrderDetails WHERE OrderID = @OrderID;
DELETE FROM Orders WHERE OrderID = @OrderID;



--6. Write an SQL query to insert a new order into the "Orders" table. Include the customer ID,
--order date, and any other necessary information.

INSERT INTO Orders VALUES(102, 3, '2024-04-03', 600);

--7. Write an SQL query to update the contact information (e.g., email and address) of a specific
--customer in the "Customers" table. Allow users to input the customer ID and new contact information.


DECLARE @CustomerID INT, @NewEmail VARCHAR(30), @NewAddress VARCHAR(50);

SET @CustomerID = 5;
SET @NewEmail = 'ravindra@gmail.com';
SET @NewAddress = '5TH WEST GATE STREET, DELHI';

UPDATE Customers
SET Email = @NewEmail, Address = @NewAddress
WHERE CustomerID = @CustomerID;

SELECT * FROM Customers;

--8. Write an SQL query to recalculate and update the total cost of each order in the "Orders"
--table based on the prices and quantities in the "OrderDetails" table.

UPDATE Orders SET TotalAmount = (SELECT SUM(Price*Quantity) FROM OrderDetails O 
JOIN Products P ON O.ProductID=P.ProductID);


SELECT * FROM Orders;


--9. Write an SQL query to delete all orders and their associated order details for a specific
--customer from the "Orders" and "OrderDetails" tables. Allow users to input the customer ID as a parameter.

DECLARE @CustomerID INT;
SET @CustomerID = 2;


DELETE FROM OrderDetails WHERE OrderID IN (SELECT OrderID FROM Orders WHERE CustomerID = @CustomerID);


DELETE FROM Orders WHERE CustomerID = @CustomerID;


--10. Write an SQL query to insert a new electronic gadget product into the "Products" table,
--including product name, category, price, and any other relevant details.
INSERT INTO Products VALUES (11, 'Table Lamp', 'Modern table lamp with adjustable brightness', 50);

--11. Write an SQL query to update the status of a specific order in the "Orders" table (e.g., from
-- "Pending" to "Shipped"). Allow users to input the order ID and the new status.


DECLARE @OrderID INT, @NewStatus VARCHAR(20);
SET @OrderID = 103
SET @NewStatus =' Shipped'

UPDATE Orders SET Status = @NewStatus WHERE OrderID = @OrderID;

-- 12. Write an SQL query to calculate and update the number of orders placed by each customer
--in the "Customers" table based on the data in the "Orders" table.
ALTER TABLE Customers ADD TotalOrders INT;

UPDATE Customers  SET TotalOrders = (SELECT COUNT(OrderID) FROM Orders O WHERE O.CustomerID = Customers.CustomerID);

SELECT * FROM Customers;

-- Task 3

-- 1. Write an SQL query to find out which customers have not placed any orders.
SELECT CONCAT(C.FirstName,'', C.LastName) AS CustomerName, C.Email FROM Customers C 
LEFT JOIN  Orders O ON C.CustomerID = O.CustomerID WHERE O.CustomerID IS NULL;
--2. Write an SQL query to find the total revenue generated by each electronic gadget product.
--Include the product name and the total revenue.
SELECT P.ProductName , SUM(P.Price*O.Quantity) AS TotalRevenue FROM Products P
INNER JOIN OrderDetails O ON P.ProductID = O.ProductID GROUP BY P.ProductName;

--3. Write an SQL query to list all customers who have made at least one purchase. Include their
--names and contact information.
SELECT CONCAT(C.FirstName,'', C.LastName) AS CustomerName, C.Email, C.Phone FROM Customers C
INNER JOIN Orders O ON C.CustomerID = O.CustomerID;

--4. Write an SQL query to find the most popular electronic gadget, which is the one with the highest
-- total quantity ordered. Include the product name and the total quantity ordered.

SELECT TOP 1 P.ProductName, O.Quantity AS TotalQuantityOrdered
FROM Products P 
LEFT JOIN OrderDetails O ON P.ProductID = O.ProductID 
ORDER BY O.Quantity DESC;


--5. Write an SQL query to retrieve a list of electronic gadgets along with their corresponding
--categories

SELECT p.ProductName, p.Description, p.Price, c.CategoryName
FROM Products p
JOIN Category c ON p.CategoryID = c.CategoryID
WHERE p.ProductName IN ('Laptop', 'Smartphone', 'Tablet', 'Smartwatch', 'Headphones');

--6. Write an SQL query to calculate the average order value for each customer. Include the
-- customer's name and their average order value.
SELECT CONCAT(C.FirstName,'', C.LastName) AS CustomerName, AVG(O.TotalAmount) AS Average_Order_Value FROM Customers C 
JOIN Orders O ON C.CustomerID = O.CustomerID GROUP BY C.CustomerID, C.FirstName,C.LastName;

--7. Write an SQL query to find the order with the highest total revenue. Include the order ID,
--customer information, and the total revenue.
SELECT  TOP 1 O.OrderID,C.FirstName , C.LastName, SUM(P.Price*OD.Quantity) AS TotalRevenue FROM Orders O
INNER JOIN OrderDetails OD ON  O.OrderID=OD.OrderID
INNER JOIN Customers C ON  O.CustomerID=C.CustomerID
INNER JOIN Products P ON P.ProductID = OD.ProductID
GROUP BY O.OrderID,C.FirstName , C.LastName ORDER BY TotalRevenue DESC;

--8.Write an SQL query to list electronic gadgets and the number of times each product has been
--ordered.

SELECT P.ProductName ,COUNT(O.OrderID) AS Number_of_time_ordered FROM 
Products P LEFT JOIN OrderDetails O ON P.ProductID = O.ProductID
GROUP BY P.ProductName;


--9. Write an SQL query to find customers who have purchased a specific electronic gadget product.
--Allow users to input the product name as a parameter.

DECLARE @ProductName VARCHAR(30);
SET @ProductName = 'Laptop';

SELECT DISTINCT CONCAT(C.FirstName, ' ', C.LastName) AS CustomerName
FROM Customers C
JOIN Orders O ON C.CustomerID = O.CustomerID
JOIN OrderDetails OD ON O.OrderID = OD.OrderID
JOIN Products P ON OD.ProductID = P.ProductID
WHERE P.ProductName = @ProductName;

--10. Write an SQL query to calculate the total revenue generated by all orders placed within a
--specific time period. Allow users to input the start and end dates as parameters.
SELECT SUM(TotalAmount) AS TotalRevenue FROM Orders WHERE OrderDate BETWEEN '2024-04-01' AND '2024-04-07';


-- Task 4. Subquery and its type:

-- 1. Write an SQL query to find out which customers have not placed any orders.
SELECT  CustomerID  ,FirstName, LastName FROM Customers WHERE CustomerID NOT IN
(SELECT CustomerID FROM Orders);

--2. Write an SQL query to find the total number of products available for sale.

SELECT COUNT(*) AS TotalProductsAvailable
FROM Products
WHERE ProductID IN (SELECT ProductID FROM Inventory);

SELECT * FROM OrderDetails;
-- 3. Write an SQL query to calculate the total revenue generated by TechShop.

SELECT SUM(TotalAmount) AS 'Total Revenue' FROM Orders
WHERE OrderID IN (SELECT OrderID FROM OrderDetails);

-- 4. Write an SQL query to calculate the average quantity ordered for products in a specific category.
--Allow users to input the category name as a parameter.
DECLARE @CategoryName VARCHAR(30);
SET @CategoryName ='Laptops';

SELECT AVG(Quantity) AS 'Average Quantity Ordered'FROM OrderDetails WHERE ProductID IN(SELECT ProductID
FROM Products WHERE CategoryID =(SELECT CategoryID FROM Category WHERE CategoryName=@CategoryName));

--5. Write an SQL query to calculate the total revenue generated by a specific customer. Allow users
--to input the customer ID as a parameter.

DECLARE @custoID INT;
SET @custoID =1;

SELECT SUM(P.Price*OD.Quantity) AS TotalRevenue FROM Products P
INNER JOIN OrderDetails OD ON P.ProductID = Od.ProductID WHERE OD.OrderID IN
(SELECT OrderID FROM Orders WHERE CustomerID = @custoID);

--6. Write an SQL query to find the customers who have placed the most orders. List their names
--and the number of orders they've placed
SELECT TOP 1  CONCAT(FirstName,'',LastName) AS CustomerName, (SELECT COUNT(OrderID) FROM Orders WHERE CustomerID = C.CustomerID) 
AS TotalOrders FROM Customers C
ORDER BY TotalOrders DESC;

--7. Write an SQL query to find the most popular product category, which is the one with the highest
--total quantity ordered across all orders.

SELECT CategoryName  FROM Category WHERE CategoryID = (SELECT TOP 1 P.CategoryID
FROM OrderDetails OD JOIN Products P ON OD.ProductID = P.ProductID
GROUP BY P.CategoryID ORDER BY SUM(Quantity) DESC
);

--8. Write an SQL query to find the customer who has spent the most money (highest total revenue)
--on electronic gadgets. List their name and total spending.

SELECT  TOP 1 CONCAT(FirstName,'',LastName) AS CustomerName, (SELECT SUM(TotalAmount) FROM Orders O 
WHERE O.CustomerID = C.CustomerID) AS TotalSpending FROM Customers C ORDER BY TotalSpending DESC;


--9. Write an SQL query to calculate the average order value (total revenue divided by the number of
-- orders) for all customers.

SELECT  CONCAT(FirstName,'',LastName) AS CustomerName,
(SELECT SUM(TotalAmount) FROM Orders WHERE CustomerID = C.CustomerID) / (SELECT COUNT(OrderID) FROM Orders WHERE CustomerID = C.CustomerID) 
AS AverageOrderValue FROM Customers C
ORDER BY AverageOrderValue;

--10. Write an SQL query to find the total number of orders placed by each customer and list their
--names along with the order count.

SELECT  CONCAT(FirstName,'',LastName) AS CustomerName, (SELECT COUNT(OrderID) FROM Orders WHERE CustomerID = C.CustomerID) 
AS TotalOrders FROM Customers C
ORDER BY TotalOrders DESC;


