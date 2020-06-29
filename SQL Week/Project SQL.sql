--Mini project 

/*1.1 Write a query that lists all Customers in either Paris or London. 
Include Customer ID, Company Name and all address fields.*/

--Select relevant columns, and then specify in where clause the city locations
SELECT 
c.CustomerID
, c.CompanyName
, c.Address
, c.City
FROM Customers c
WHERE c.City IN ('London','Paris');



/*1.2	List all products stored in bottles.*/

--Quantity per unit inclued to test code, where clause searches for quantity per unit that
--That includes bottles as part of tht text
SELECT 
p.ProductName
, p.QuantityPerUnit
FROM Products p
WHERE p.QuantityPerUnit LIKE '%bottle%';



/*1.3 Repeat question above but add in the Supplier Name and Country */

--Adding in column names as per question
SELECT 
p.ProductName
, p.QuantityPerUnit
, s.CompanyName AS "Supplier Name"
, s.Region
FROM Products p
, Suppliers S
WHERE p.QuantityPerUnit LIKE '%bottle%';



/*1.4 Write an SQL Statement that shows how many products there are in each category. 
Include Category Name in result set and list the highest number first.*/

-- Counts category ID for product count, 
-- then full join inludes category names from the category table
SELECT
c.CategoryName
, COUNT(c.CategoryID) AS "Products in Category"
FROM Categories c
FULL JOIN Products p
    ON p.CategoryID = c.CategoryID
GROUP BY c.CategoryName;



/*1.5	List all UK employees using concatenation to join their title of courtesy, 
first name and last name together. Also include their city of residence.*/

--Concantenating name, and city column also included. Where column restricts rows to those that contain UK
SELECT 
CONCAT(e.TitleOfCourtesy, ' ', e.FirstName, ' ',e.LastName) "FULL NAME"
, e.City
FROM Employees e
WHERE e.Country = 'UK';



/*1.6	List Sales Totals for all Sales Regions (via the Territories table using 4 joins) 
with a Sales Total greater than 1,000,000. Use rounding or FORMAT to present the numbers.*/

--Checking tables
SP_HELP Products
SELECT * FROM [Order Details]

--The SUM lines at 68 and 80 calculate the sales totals and put it in the table and use it to satisfy the conditions respecively.
--Inner join commands join Territoties to Order details via 4 joins
SELECT 
ROUND(SUM(od.Quantity * od.UnitPrice * (1-od.Discount)), 1) AS "Sales Total"
, t.RegionID
FROM Territories t
INNER JOIN EmployeeTerritories et
    ON t.TerritoryID = et.TerritoryID
INNER JOIN Employees e
    ON et.EmployeeID = e.EmployeeID
INNER JOIN Orders o
    ON e.EmployeeID = o.EmployeeID
INNER JOIN [Order Details] od
    ON o.OrderID = od.OrderID
GROUP BY t.RegionID
HAVING SUM(od.Quantity * od.UnitPrice * (1-od.Discount)) > 1000000;


/*1.7 Count how many Orders have a Freight amount 
greater than 100.00 and either USA or UK as Ship Country.*/

--Inital look into table before attempting question
SELECT * FROM Orders

--Count function with where limiter that counts only rows that match conditions set
SELECT 
COUNT(o.OrderID) AS "Orders matching conditions"
FROM Orders o
WHERE o.Freight > 100.00
AND o.ShipCountry IN ('USA', 'UK');



/*1.8 Write an SQL Statement to identify the Order Number of the Order 
with the highest amount(value) of discount applied to that order*/

--Inital look into table before attempting question
SELECT * FROM [Order Details]

--This selects only the top option of the results when the discount is ordered with highest discount on top
--It therefore returns the order number with largest discount
SELECT TOP 1
od.OrderID
, od.Discount
FROM [Order Details] od
ORDER BY od.Discount DESC

/*Out of scope
--Potential subquery way of doing this
SELECT
od.OrderID
, od.Discount
FROM [Order Details]
WHERE od.Discount = 
(SELECT MAX(od.Discount) FROM [Order Details] od)
*/



/* 2.1 Create table questions */

--Creating new database
CREATE DATABASE max_palmer

--Signalling what database to use
USE max_palmer

--To make sure table does not exist already before creating it
DROP TABLE Spartans

--Creating table
CREATE TABLE Spartans
(
    SPARTANID INTEGER IDENTITY (1, 1) PRIMARY KEY
    , title VARCHAR(5)
    , first_name VARCHAR(20)
    , last_name VARCHAR(20)
    , university VARCHAR(50)
    , course VARCHAR(50)
    , mark VARCHAR(20)
    , beginning_date DATE
);

--Checking work has completed correctly
SP_HELP Spartans



/*2.2 Write SQL statements to add the details of the Spartans in your corse */

--Signalling what database to use
USE max_palmer

--Inserting values
INSERT INTO Spartans
VALUES 
('Mr', 'Max', 'Palmer', 'Birmingham', 'Ancient History', '2:1', '2020-06-15'),
('Miss', 'Georgina', 'Bartlett ', 'Newcastle', 'Archaeology ', '2:1', '2020-06-15'),
('Mr', 'Humza', 'Malak', 'Kent', 'Computer Science', '2:2', '2020-06-15'),
('Mr', 'Ibrahim', 'Bocus', 'Leicester', 'Mechanical Engineering', '2:1', '2020-06-15'),
('Mr', 'Bari', 'Allali', 'Lancaster', 'Business Economics', '2:1', '2020-06-15'),
('Mr', 'Mehdi', 'Shamaa', 'Nottingham', 'Philosphy and Economics', '2:2', '2020-06-15'),
('Miss', 'Anais', 'Tang', 'Edinburgh', 'Modern Languages', '2:1', '2020-06-15'),
('Mr', 'Saheed', 'Lamina', 'Warwick', 'Politics', '2:1', '2020-06-15'),
('Mr', 'Marcus', 'Tse', 'Herts', 'Engineering', '2:1', '2020-06-15'),
('Mr', 'Sohaib', 'Sohail', 'Brunel', 'Communications', '2:1', '2020-06-15'),
('Mr', 'Ugne', 'Okmanaite', 'Aston', 'Business & Management', '2:1', '2020-06-15'),
('Mr', 'John', 'Byrne', 'Greeenwich', 'Computing', '?', '2020-06-15'),
('Mr', 'Daniel', 'Teegan', 'Brighton', 'Product Design ', '2:2', '2020-06-15')

--Update statement to correct error
UPDATE Spartans SET Title='Miss' WHERE first_name = 'Ugne'

--Select to view/check queston
SELECT * FROM Spartans



/*3.1 List all Employees 
from the Employees table and who they report to. No Excel required. (5 Marks)*/

--USING CORRECT DATABASE
USE NORTHWIND

--SELF JOIN Table on itself, 
--This leads to the "second" employees table matching reporting to ID with the manager name
SELECT
CONCAT(A.FirstName, ' ', A.LastName) "Employee Name"
, CONCAT(B.FirstName, ' ', B.LastName) AS "Manager Name"
FROM Employees A 
INNER JOIN Employees B
    ON A.EmployeeID = B.ReportsTo
ORDER BY [Manager Name];



/*3.2  List all Suppliers with total sales over $10,000 in the Order Details table. 
Include the Company Name from the Suppliers Table and present as a bar chart as below*/

--Checking the table before attempting question
SELECT * FROM [Order Details]
SELECT * FROM Suppliers

--Total sales is rounded to 2 decimal figures
--Inner joins allow the Company and the total sales in the same table as they come from seperate tables
SELECT
s.CompanyName
, ROUND(SUM(od.Quantity * od.UnitPrice * (1-od.Discount)), 2) "Total sales"
FROM [Order Details] od
INNER JOIN Products p
    ON od.ProductID = p.ProductID
INNER JOIN Suppliers s
    ON p.SupplierID = s.SupplierID
GROUP BY s.CompanyName
HAVING ROUND(SUM(od.Quantity * od.UnitPrice * (1-od.Discount)), 2) > 10000
ORDER BY ROUND(SUM(od.Quantity * od.UnitPrice * (1-od.Discount)), 2) DESC;



/*3.3 List the Top 10 Customers YTD for the latest year in the Orders file. 
Based on total value of orders shipped. No Excel required*/

--Checking the table before attempting question
SELECT * FROM Orders
SELECT * FROM [Order Details]

--Distinct top 10 specifies top 10 different companies
--Inner join to connect customers table to order details
SELECT 
DISTINCT TOP 10 c.CompanyName
, ROUND(SUM(od.Quantity * od.UnitPrice * (1-od.Discount)),2) AS "Sales total"
FROM Customers c
INNER JOIN Orders o
    ON o.CustomerID = c.CustomerID
INNER JOIN [Order Details] od
    ON o.OrderID = od.OrderID
GROUP BY c.CompanyName
ORDER BY ROUND(SUM(od.Quantity * od.UnitPrice * (1-od.Discount)),2) DESC;




/*3.4 Plot the Average Ship Time by month for all data in 
the Orders Table using a line chart as below*/

--Checking the table before attempting question
SELECT * FROM Orders

--Creates relevant columns and then groups them in order to get correct data format
SELECT
CONCAT(YEAR(o.OrderDate), '-', MONTH(o.OrderDate)) AS "Date"
, AVG(DATEDIFF(d, o.OrderDate, o.ShippedDate)) AS "Average ship time per month"
FROM Orders o
GROUP BY YEAR(o.OrderDate), MONTH(o.OrderDate)
ORDER BY YEAR(o.OrderDate), MONTH(o.OrderDate);
