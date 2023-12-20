use TechShop

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    Phone VARCHAR(20),
    Address VARCHAR(255)
);

INSERT INTO Customers (CustomerID, FirstName, LastName, Email, Phone, Address)
VALUES
    (1, 'udit', 'panthi', 'uditpanthi31@gmail.com', '1234567890', '4 rajnikunj'),
    (2, 'Emma', 'Johnson', 'emma.j@email.com', '5554561234', '123 Main St'),
    (3, 'Michael', 'Davis', 'michael.d@email.com', '5551235678', '456 Oak Ave'),
    (4, 'Sophia', 'Anderson', 'sophia.a@email.com', '5558769876', '789 Pine Rd'),
    (5, 'Ethan', 'Smith', 'ethan.s@email.com', '1234556431', '101 Elm Blvd'),
    (6, 'Olivia', 'Taylor', 'olivia.t@email.com', '111222333', '987 Cedar St'),
    (7, 'Noah', 'Brown', 'noah.b@email.com', '9990001111', '234 Oak St'),
    (8, 'Ava', 'Martinez', 'ava.m@email.com', '6667778888', '876 Maple Ave'),
    (9, 'Isabella', 'White', 'isabella.w@email.com','2223334444', '543 Pine St'),
    (10, 'Liam', 'Robinson', 'liam.r@email.com', '3334445555', '765 Birch Ave');

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Description TEXT,
    Price DECIMAL(10, 2)
);



INSERT INTO products (ProductID, ProductName, Description, Price)
VALUES 
  (1,'Widget X', 'A versatile and durable widget for everyday use.', 19.99),
  (2,'Gizmo Z', 'The latest technology gizmo with advanced features.', 49.99),
  (3,'Super Blender', 'High-speed blender for smoothies and food preparation.', 39.99),
  (4,'Smartwatch Pro', 'A feature-rich smartwatch with fitness tracking.', 129.99),
  (5,'Wireless Earbuds', 'Noise-canceling wireless earbuds for immersive audio.', 79.99),
  (6,'Coffee Maker Deluxe', 'Programmable coffee maker for the perfect brew.', 59.99),
  (7,'Ultra HD TV', 'A large-screen TV with stunning 4K resolution.', 599.99),
  (8,'Smart Home Hub', 'Central hub for controlling smart home devices.', 89.99),
  (9,'Digital Camera', 'High-resolution camera for capturing memorable moments.', 249.99),
  (10,'Fitness Tracker', 'Track your fitness goals with this sleek wearable.', 69.99);



CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10, 2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

INSERT INTO Orders (OrderID, CustomerID, OrderDate, TotalAmount)
VALUES
    (1, 1, '2023-01-01', 39.98),
    (2, 2, '2023-02-01', 59.98),
    (3, 3, '2023-03-01', 79.97),
    (4, 4, '2023-04-01', 99.96),
    (5, 5, '2023-05-01', 119.95),
    (6, 6, '2023-06-01', 139.94),
    (7, 7, '2023-07-01', 159.93),
    (8, 8, '2023-08-01', 179.92),
    (9, 9, '2023-09-01', 199.91),
    (10, 10, '2023-10-01', 219.90);

CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, Quantity)
VALUES
    (1, 1, 1, 2),
    (2, 1, 2, 1),
    (3, 2, 3, 3),
    (4, 2, 4, 1),
    (5, 3, 5, 2),
    (6, 3, 6, 1),
    (7, 4, 7, 3),
    (8, 4, 8, 1),
    (9, 5, 9, 2),
    (10, 5, 10, 1);

CREATE TABLE Inventory (
    InventoryID INT PRIMARY KEY,
    ProductID INT,
    QuantityInStock INT,
    LastStockUpdate DATETIME,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

INSERT INTO Inventory (InventoryID, ProductID, QuantityInStock, LastStockUpdate)
VALUES
    (1, 1, 100, '2023-01-01 12:00:00'),
    (2, 2, 50, '2023-02-01 10:30:00'),
    (3, 3, 75, '2023-03-01 15:45:00'),
    (4, 4, 30, '2023-04-01 08:20:00'),
    (5, 5, 60, '2023-05-01 14:10:00'),
    (6, 6, 25, '2023-06-01 11:55:00'),
    (7, 7, 40, '2023-07-01 09:30:00'),
    (8, 8, 90, '2023-08-01 13:25:00'),
    (9, 9, 55, '2023-09-01 16:05:00'),
    (10, 10, 20, '2023-10-01 07:40:00');


-----------------------------------------------------------
--1. Write an SQL query to retrieve the names and emails of all customers. 
SELECT FirstName, LastName, Email
FROM Customers;


------------------------------------------------------------
--2. Write an SQL query to list all orders with their order dates and corresponding customer names.

SELECT Orders.OrderID, Orders.OrderDate, Customers.FirstName, Customers.LastName
FROM Orders
JOIN Customers ON Orders.CustomerID = Customers.CustomerID;


------------------------------------------------------------
--3.Write an SQL query to insert a new customer record into the "Customers" table. Include  customer information such as name, email, and address.
INSERT INTO Customers (CustomerID, FirstName, LastName, Email, Address)
VALUES (11, 'NewFirstName', 'NewLastName', 'new.email@example.com', 'NewAddress');


------------------------------------------------------------
--4. Write an SQL query to update the prices of all electronic gadgets in the "Products" table by increasing them by 10%.
ALTER TABLE Products
ADD Category VARCHAR(50);

UPDATE products
SET Category = 'Electronics'
WHERE ProductID = 1;

UPDATE products
SET Category = 'Gadgets'
WHERE ProductID = 2;

UPDATE products
SET Category = 'Appliances'
WHERE ProductID = 3;

UPDATE products
SET Category = 'Electronics'
WHERE ProductID = 4;

UPDATE products
SET Category = 'Gadgets'
WHERE ProductID = 5;

UPDATE products
SET Category = 'Appliances'
WHERE ProductID = 6;

UPDATE products
SET Category = 'Electronics'
WHERE ProductID = 7;

UPDATE products
SET Category = 'Gadgets'
WHERE ProductID = 8;

UPDATE products
SET Category = 'Electronics'
WHERE ProductID = 9;

UPDATE products
SET Category = 'Gadgets'
WHERE ProductID = 10;


UPDATE Products
SET Price = Price * 1.10
WHERE Category = 'Electronics';

------------------------------------------------------------------
--5--Write an SQL query to delete a specific order and its associated order details from the 
   --"Orders" and "OrderDetails" tables. Allow users to input the order ID as a parameter.

DECLARE @OrderIDToDelete INT = 1;    --Replace the id to delete
DELETE FROM OrderDetails WHERE OrderID = @OrderIDToDelete;
DELETE FROM Orders WHERE OrderID = @OrderIDToDelete;

------------------------------------------------------------------
--6--Write an SQL query to insert a new order into the "Orders" table. Include the customer ID, 
   --order date, and any other necessary information.

DECLARE @CustomerID INT = 1;  -- Replace with the customer ID
DECLARE @OrderDate DATE = '2023-11-28';  -- Replace with the order date

DECLARE @OrderID INT = 11;  -- Replace with the actual unique order ID
--SET @OrderID = (SELECT MAX(OrderID) + 1 FROM Orders);
INSERT INTO Orders (OrderID, CustomerID, OrderDate)
VALUES (@OrderID, @CustomerID, @OrderDate);


-------------------------------------------------------------------
--7--Write an SQL query to update the contact information (e.g., email and address) of a specific 
   --customer in the "Customers" table. Allow users to input the customer ID and new contact information.

DECLARE @newCustomerID INT = 4;
UPDATE Customers
SET Email = 'new.email@example.com', Address = 'New Address', Phone='7535975455'
WHERE CustomerID = @newCustomerID;


--------------------------------------------------------------------
--8--Write an SQL query to recalculate and update the total cost of each order in the "Orders" 
   --table based on the prices and quantities in the "OrderDetails" table.
   UPDATE Orders
SET TotalAmount = (
    SELECT SUM(OrderDetails.Quantity * Products.Price)
    FROM OrderDetails
    JOIN Products ON OrderDetails.ProductID = Products.ProductID
    WHERE OrderDetails.OrderID = Orders.OrderID
);


--------------------------------------------------------------------
--9--Write an SQL query to delete all orders and their associated order details for a specific 
   --customer from the "Orders" and "OrderDetails" tables. Allow users to input the customer ID 
   --as a parameter

DECLARE @CustomerIDToDelete INT = 5;
DELETE FROM OrderDetails WHERE OrderID IN (SELECT OrderID FROM Orders WHERE CustomerID = @CustomerIDToDelete);
DELETE FROM Orders WHERE CustomerID = @CustomerIDToDelete;


--------------------------------------------------------------------
--10--Write an SQL query to insert a new electronic gadget product into the "Products" table, 
   --including product name, category, price, and any other relevant details.

INSERT INTO Products (ProductID, ProductName, Category, Price)
VALUES (11, 'NewGadget', 'electronic gadget', 99.99);



--------------------------------------------------------------------
--11--Write an SQL query to update the status of a specific order in the "Orders" table (e.g., from 
   --"Pending" to "Shipped"). Allow users to input the order ID and the new status.
ALTER TABLE Orders
ADD Status NVARCHAR(50) DEFAULT 'Pending';
UPDATE Orders
SET Status = 'Pending'
WHERE Status IS NULL;

---------------------------------------------------------------------
--12--Write an SQL query to calculate and update the number of orders placed by each customer 
   --in the "Customers" table based on the data in the "Orders" table.

-- Add a new column 'NumOrders' to the "Customers" table.
ALTER TABLE Customers
ADD NumOrders INT;
-- Update the number of orders placed by each customer in the "Customers" table.
UPDATE Customers
SET NumOrders = (
    SELECT COUNT(*)
    FROM Orders
    WHERE Orders.CustomerID = Customers.CustomerID
);










--# Aggregate Functions--
-----------------------------------------------------
--1--Write an SQL query to find out which customers have not placed any orders.
Select * 
From Customers 
where numorders=0;

------

SELECT Customers.CustomerID, Customers.FirstName, Customers.LastName, Orders.OrderID
FROM Customers
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID
WHERE Orders.OrderID IS NULL;


-----------------------------------------------------
--2--Write an SQL query to find the total number of products available for sale. 

SELECT COUNT(*) AS TotalProducts
FROM Products;

-----------------------------------------------------
--3--Write an SQL query to calculate the total revenue generated by TechShop. 
Select Sum(TotalAmount) as TotalRevenue
from Orders


-----------------------------------------------------
--4--Write an SQL query to calculate the average quantity ordered for products in a specific category. 
   --Allow users to input the category name as a parameter.
   Declare @input varchar(10)='Electronics';
   Select AVG (Quantity)
   from orderdetails
   where ProductID IN 
   (Select productId from Products where category='Electronics')
  
  --Select Quantity from OrderDetails where ProductID IN (Select productId from Products where category='Electronics')-



-------------------------------------------------------
--5--Write an SQL query to calculate the total revenue generated by a specific customer. Allow users 
   --to input the customer ID as a parameter.
Declare @inputCID int=9;
Select SUM(TotalAmount) as TotalRevenue
from orders
where CustomerID=@inputCID


-------------------------------------------------------
--6--Write an SQL query to find the customers who have placed the most orders. List their names 
   --and the number of orders they've placed.

Select FirstName,Lastname,NumOrders
from Customers
where NumOrders=(Select MAX(numOrders) from Customers)



SELECT TOP 1 WITH TIES Customers.CustomerID, Customers.FirstName, Customers.LastName, COUNT(*) AS OrderCount
FROM Customers
JOIN Orders ON Customers.CustomerID = Orders.CustomerID
GROUP BY Customers.CustomerID, Customers.FirstName, Customers.LastName
ORDER BY OrderCount DESC;

---------------------------------------------------------
--7--Write an SQL query to find the most popular product category, which is the one with the highest 
   --total quantity ordered across all orders.

SELECT top 1 p.Category,(SELECT SUM(od.Quantity)
      FROM OrderDetails od
      WHERE od.ProductID IN (SELECT ProductID FROM Products WHERE Category = p.Category)) AS NoOfOrder
FROM Products p
GROUP BY p.Category
ORDER BY NoOfOrder desc



SELECT TOP 1 WITH TIES Products.Category, SUM(Quantity) AS TotalQuantityOrdered
FROM OrderDetails
JOIN Products ON OrderDetails.ProductID = Products.ProductID
GROUP BY Products.Category
ORDER BY TotalQuantityOrdered DESC;

---------------------------------------------------------
--8--Write an SQL query to find the customer who has spent the most money (highest total revenue) 
   --on electronic gadgets. List their name and total spending.

SELECT Customers.CustomerID, Customers.FirstName, Customers.LastName, SUM(TotalAmount) AS TotalSpending
FROM Customers
JOIN Orders ON Customers.CustomerID = Orders.CustomerID
JOIN OrderDetails ON Orders.OrderID = OrderDetails.OrderID
JOIN Products ON OrderDetails.ProductID = Products.ProductID
WHERE Products.Category = 'Electronic'
GROUP BY Customers.CustomerID, Customers.FirstName, Customers.LastName
ORDER BY TotalSpending DESC;


-------------------------------------------------------------
--9--Write an SQL query to calculate the average order value (total revenue divided by the number of 
   ---orders) for all customers.

SELECT AVG(TotalAmount) AS AverageOrderValue
FROM Orders;


-------------------------------------------------------------
--10--Write an SQL query to find the total number of orders placed by each customer and list their 
   --names along with the order count
select FirstName, NumOrders from Customers


SELECT Customers.CustomerID, Customers.FirstName, Customers.LastName, COUNT(Orders.OrderID) AS OrderCount
FROM Customers
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID
GROUP BY Customers.CustomerID, Customers.FirstName, Customers.LastName;
-------------------------------------------------------------------
---------------------------------------------------------------------









-- JOINS
--1--Write an SQL query to retrieve a list of all orders along with customer information (e.g., 
   --customer name) for each order.
SELECT o.OrderID,o.OrderDate,c.CustomerID, c.FirstName, c.LastName ,c.Phone
from Customers c
 join Orders o
on c.CustomerID=o.CustomerID
group by o.OrderID,o.OrderDate,c.CustomerID, c.FirstName, c.LastName ,c.Phone

--------------------------------------------
--2--Write an SQL query to find the total revenue generated by each electronic gadget product. 
   --Include the product name and the total revenue.
select p.ProductName, p.category, sum(od.quantity * p.Price) as productRevenue
from Products p
join OrderDetails od on p.ProductID=od.ProductID
--where category='electronics'
group by p.ProductName, p.category
order by productRevenue;

--------------------------------------------
--3--Write an SQL query to list all customers who have made at least one purchase. Include their 
   --names and contact information.
Select FirstName,Phone, numorders
from Customers 
where NumOrders>0

select c.FirstName, c.Phone, count(c.CustomerID) as ordercount 
from Customers c
join Orders o
on c.CustomerID=o.CustomerID
group by c.FirstName, c.Phone;



------------------------------------------
--4. Write an SQL query to find the most popular electronic gadget, which is the one with the highest 
--   total quantity ordered. Include the product name and the total quantity ordered.
Select Top 1 with ties p.category, p.ProductName, SUM(o.Quantity) as TotalQuantityOrdered
from OrderDetails o
join Products p ON o.ProductID = p.ProductID
where p.category='Electronics'
group by p.ProductName, p.category
order by TotalQuantityOrdered desc


-------------------------------------------
--5--Write an SQL query to retrieve a list of electronic gadgets along with their corresponding categories.

Select ProductName, Category
from Products
where Category='Electronics'

-------------------------------------------
--6--Write an SQL query to calculate the average order value for each customer. 
--   Include the  customer's name and their average order value.

SELECT C.FirstName, C.LastName, AVG(OD.Quantity * P.Price) AS AverageOrderValue
FROM Customers C
JOIN Orders O ON C.CustomerID = O.CustomerID
JOIN OrderDetails OD ON O.OrderID = OD.OrderID
JOIN Products P ON OD.ProductID = P.ProductID
GROUP BY C.FirstName, C.LastName;



------------------------------------------
--7--Write an SQL query to find the order with the highest total revenue. Include
-----the order ID, customer information, and the total revenue.

Select top 1 o.orderId, c.customerID, c.FirstName, max(o.totalAmount) as orderAmt
from Customers c
join Orders o on c.customerId=o.customerId
group by c.customerID, c.FirstName,o.orderId
order by orderAmt desc

Select top 1 o.orderId, c.customerId, c.FirstName, c.LastName, sum(od.quantity * o.totalamount) as orderAMT
from Customers c
join Orders o on c.customerId=o.customerId
join orderdetails od on od.orderid=o.orderid
group by o.orderId, c.customerId, c.FirstName, c.LastName
order by orderamt desc

------------------------------------------
--8--Write an SQL query to list electronic gadgets and the number of times each product has been ordered.

Select p.ProductID, p.ProductName,p.category , count (od.productID) as ItemSold
from Products p
join OrderDetails od on p.ProductID=od.ProductID
where (p.category='electronics')
group by p.ProductID, p.ProductName,p.category

------------------------------------------
--9--Write an SQL query to calculate the average order value (total revenue divided by the number
   --of orders) for all customers.

SELECT Customers.CustomerID,Customers.FirstName,Customers.LastName,
AVG(Orders.TotalAmount) AS average_order_value
FROM Customers
JOIN Orders ON Customers.CustomerID = Orders.CustomerID
GROUP BY Customers.CustomerID,Customers.FirstName,Customers.LastName;


 ---------------------------------------
 --10--Write an SQL query to calculate the total revenue generated by all orders placed within a 
   --specific time period. Allow users to input the start and end dates as parameters.

DECLARE @StartDate DATE;
DECLARE @EndDate DATE;

SET @StartDate = '2023-01-01'; 
SET @EndDate = '2023-12-31';  

SELECT SUM(TotalAmount) AS total_revenue
FROM Orders
WHERE OrderDate BETWEEN @StartDate AND @EndDate;



--SUBQUERY AND ITS TYPES--
--------------------------------------------
--1. Write an SQL query to find out which customers have not placed any orders.
Select Customers.FirstName,Customers.LastName 
from Customers 
left join Orders
on Customers.CustomerID=Orders.CustomerID
where Orders.customerId is null

-------------------------------------------
--2. Write an SQL query to find the total number of products available for sale.
Select Products.ProductName, Inventory.QuantityInStock
from Products
join Inventory
on Inventory.ProductID=Products.ProductID

SELECT COUNT(*) AS total_products
FROM Products
JOIN Inventory ON Products.ProductID = Inventory.ProductID
where Inventory.QuantityInStock > 0;


-------------------------------------------
--3. Write an SQL query to calculate the total revenue generated by TechShop.
Select sum(Orders.TotalAmount) as TotalRevenueGenerated
from Orders


-------------------------------------------
--4. Write an SQL query to calculate the average quantity ordered for products in a specific category. 
   --Allow users to input the category name as a parameter.
select AVG(Quantity)
from OrderDetails
where ProductID in(select ProductID from products where Products.Category='Electronics')


SELECT
    Category,
    (
        SELECT AVG(Quantity)
        FROM OrderDetails od
        WHERE od.ProductID IN (SELECT ProductID FROM Products WHERE Category = 'Electronics')
    ) AS average_quantity_ordered
FROM Products p
GROUP BY Category;


-------------------------------------------
--5.