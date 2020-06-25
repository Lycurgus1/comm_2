USE Northwind

-- Where Clause filers data END
SELECT * FROM Products WHERE Discontinued = 1

-- Select clause, COUNT function and AS function
SELECT COUNT(*) AS "Number of Employees in London" FROM Employees 
WHERE CITY = 'London';

-- Table aliasing
SELECT c.CustomerID, c.City
FROM Customers c
WHERE c.Country = 'France'

-- Top
SELECT TOP 10 c.CompanyName, c.City
FROM Customers c
WHERE Country = 'France'

--And
SELECT p.ProductName, p.UnitPrice
FROM Products p
WHERE p.CategoryID = 1 AND p.Discontinued = 0

--OR
SELECT p.ProductName, p.UnitPrice
FROM Products p
WHERE p.CategoryID = 1 OR p.Discontinued = 0

--Operators
SELECT p.ProductName, p.UnitPrice
FROM Products p
WHERE p.UnitsInStock > 0 AND p.UnitPrice > 29.99

--Distinct
SELECT DISTINCT Country
AS "Place"
FROM Customers
Where ContactTitle = 'Owner'

--Wildcards and like
SELECT c.Country
FROM Customers c
WHERE c.Country like '%Y'

--Charlist Wildcard, returns countries starting with U or not starting with IT. Ordered ascending
SELECT DISTINCT c.Country
FROM Customers c
WHERE c.Country like 'U%' OR c.Country LIKE '[^IT]%'
ORDER BY c.Country

--IN
SELECT DISTINCT p.ProductName, p.ProductID
FROM Products p
WHERE p.ProductID IN (1, 3) 

--Between
SELECT DISTINCT p.ProductName, p.ProductID
FROM Products p
WHERE p.ProductID BETWEEN 1 AND 2

-- problem 1. Checking for unit price below 5
SELECT p.ProductName, p.ProductID
FROM Products p
WHERE p.ProductID < 5.00

-- problem 2
SELECT c.CategoryName, c.[Description]
FROM Categories C
WHERE c.CategoryName LIKE '[SB]%'

-- Group by
SELECT o.EmployeeID, COUNT(*)
AS 'Number of orders'
FROM Orders o
WHERE o.EmployeeID IN (5, 7)
GROUP BY o.EmployeeID

--Concatenate
SELECT CompanyName AS "Company name",
CONCAT(City, ', ' ,c.Country) AS "City"
FROM Customers c 

--is Null, can also be IS NOT NULL
SELECT CompanyName AS "Company Name",
City + ', ' + Country AS "City"
From Customers
Where Region is NULL

--Round and using arithmetic functions
SELECT TOP 100 o.UnitPrice, o.Quantity, o.Discount, o.OrderID,
o.UnitPrice * o.Quantity AS "Gross Total",
ROUND((1.00- o.Discount) *o.UnitPrice * o.Quantity,2) AS "Net Total"
FROM [Order Details] o
ORDER BY [Net Total] desc

--using string functions
SELECT c.PostalCode "Post Code",
LEFT(c.PostalCode, CHARINDEX(' ',c.PostalCode)-1) AS "Post Code Region",
    CHARINDEX(' ',c.PostalCode) AS "Space Found", c.Country
FROM Customers c
WHERE c.Country = 'UK'

-- Uses string functions to find aposthre in product name
SELECT p.ProductName "Product Names",
CHARINDEX('''', p.ProductName) AS "Item count"
FROM Products p
WHERE CHARINDEX('''', p.ProductName) > 0

-- Uses like to find aposthre
SELECT p.ProductName "Product Names",
CHARINDEX('''', p.ProductName) AS "Item count"
FROM Products p
WHERE p.ProductName LIKE '%''%' 