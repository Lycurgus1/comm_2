USE Northwind

-- Returns current date and time
SELECT GETDATE()

-- returns date and time of computer
SELECT SYSDATETIME()

-- add days 
DATEADD(YEAR/MONTH/DAY, 5, OrderDate) AS "Due Date"

-- calculates date difference
DATEDIFF(YEAR/MONTH/DAY, OrderDate, ShippedDate) AS "Ship Time"

-- Get year/month/day
SELECT YEAR/MONTH/DAY AS "Order time period"

--playing about
SELECT o.OrderDate, o.ShippedDate,
--SYSDATETIME() AS "Current date",
--GETDATE() AS "Current time",
DATEDIFF(DAY, o.OrderDate, o.ShippedDate) AS "Ship days",
DATEADD(d, 5, OrderDate) AS "Due Date"
FROM Orders o
WHERE DATEDIFF(d, o.OrderDate, o.ShippedDate) < 10

--exercise 1
SELECT e.BirthDate,
CONCAT(e.FirstName, ' ' ,e.LastName) AS "Name",
DATEDIFF(yy, e.BirthDate, GETDATE()) AS "AGE"
FROM Employees e

--diff way, using round to get exact age down to decials
SELECT e.BirthDate,
CONCAT(e.FirstName, ' ' ,e.LastName) AS "Name",
ROUND((DATEDIFF(DAY, e.BirthDate, GETDATE()) / 365.250), 6) AS "AGE"
FROM Employees e

--select case
SELECT CASE
WHEN DATEDIFF (d, OrderDate,ShippedDate) < 10 THEN 'On Time'
ELSE 'Overdue'
END AS "Status"
FROM Orders o

--exercise 2
SELECT CONCAT(e.FirstName, ' ' ,e.LastName) AS "Name",
    DATEDIFF(yy, e.BirthDate, GETDATE()) AS "AGE",
CASE
WHEN DATEDIFF(YEAR,BirthDate, GETDATE()) >= 65 THEN 'Retired'
WHEn DATEDIFF(YEAR,BirthDate, GETDATE()) >= 60 THEN 'Retirement due'
ELSE 'More than 5 years'
END AS "Status"
FROM Employees e

-- Sum, average, min, max, Count
SELECT SUM(p.UnitsOnOrder) AS "Total",
    AVG(p.UnitsOnOrder) AS "AVG",
    Min(p.UnitsOnOrder) AS "Min",
    Max(p.UnitsOnOrder) AS "Max",
    Count(p.UnitsOnOrder) AS "Count"
FROM Products p

-- Getting average and using group by, as well as order
SELECT AVG(p.ReorderLevel) AS "AVG Reorder Level"
FROM Products p
GROUP BY p.CategoryID
ORDER BY "AVG Reorder Level" DESC

--filtering data based on avg
SELECT p.SupplierID,
SUM(UnitsOnOrder) AS "Total",
    AVG(p.UnitsOnOrder) AS "AVG"
FROM Products p
Group by p.SupplierID
HAVING AVG (p.UnitsOnOrder) > 5

SELECT 
    COUNT(c.customerID)
    ,c.Country
    From Customers c
    WHERE c.country != 'USA'
    GROUP BY c.Country
HAVING count(c.CustomerID) > 10;

--join. Left becomes left table, right right table
SELECT *
FROM Course c 
INNER JOIN Student s

--multiple join commands at same time
SELECT e.EmployeeID, e.FirstName,o.OrderID,et.TerritoryID
FROM Orders o INNER JOIN Employees e 
ON o.EmployeeId=e.EmployeeId
INNER JOIN EmployeeTerritories et
ON et.EmployeeID=e.EmployeeID

--exercise 1
SELECT 
s.CompanyName AS "Supplier Name"
,AVG(p.UnitsOnOrder) AS "Average Units On Order"
FROM Products p
INNER JOIN Suppliers s
ON s.SupplierID = p.SupplierID
GROUP BY s.CompanyName
ORDER BY "Average Units On Order" DESC