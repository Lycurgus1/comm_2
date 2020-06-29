--Exercise from yesterday
SELECT 
o.OrderID
, c.CompanyName AS "Customer Name"
, CONCAT(e.FirstName, ' ', e.LastName) AS "Employee Name"
, o.OrderID
, o.OrderDate
, o.Freight
FROM Employees e INNER JOIN Orders o
ON e.EmployeeID = o.EmployeeID
INNER JOIN Customers c
ON c.CustomerID = o.CustomerID;

--Date formatting. 103 describes what format to us. Old way of doing this
SELECT 
o.OrderID
, CONVERT(VARCHAR(10), o.OrderDate, 103) AS [dd/MM/yyyy]
FROM Orders o;

-- Mostly use format, intriduced in 2012
SELECT o.OrderID
, FORMAT(O.OrderDate, 'dd/MM/yyyy')
FROM Orders o

--Subquery
SELECT 
c. CompanyName AS "Customer"
FROM 
Customers c
WHERE c.CustomerID NOT IN
    (SELECT o.CustomerID FROM Orders o)

--if doing with join. Groups all data then specifies when custome id is null
SELECT 
c.CompanyName AS "Customer"
FROM Customers c
LEFT JOIN Orders o
ON c.CustomerID = o.CustomerID
WHERE o.CustomerID IS NULL

--nested subquery. Nesting select max price enables it to run, 
-- as otherwise it is an aggregate function

SELECT
OrderID
,ProductID
,UnitPrice
,Quantity
,Discount
,(SELECT MAX(UnitPrice)FROM [Order Details]) AS "Max Price"
FROM [Order Details]

--wont work
SELECT
OrderID
,ProductID
,UnitPrice
,Quantity
,Discount
,MAX(UnitPrice) AS "Max Price"
FROM [Order Details]

--exercise 2, with query

SELECT od.OrderID
, od.ProductID
, od.UnitPrice
, od.Quantity
, od.Discount
FROM [Order Details] od
WHERE od.ProductID IN
    (SELECT p.ProductID
    FROM Products p
    WHERE p.Discontinued = 1)

--exercise 2 with join
SELECT od.OrderID
, p.Discontinued
, od.ProductID
, od.UnitPrice
, od.Quantity
, od.Discount
FROM [Order Details] od 
LEFT JOIN Products p
ON od.ProductID = p.ProductID
WHERE p.Discontinued = 1

--Union ALL command. Must have same number of columns. 
SELECT e.EmployeeID AS "Employee/Supplier"
FROM Employees e
UNION ALL
SELECT s.SupplierID
FROM Suppliers s

--Union command. Removes duplicates. Must have same no. of columns
SELECT e.EmployeeID AS "Employee/Supplier"
FROM Employees e
UNION
SELECT s.SupplierID
FROM Suppliers s

--out of scope for exam. Virtual table created, then inner joined with order details table
SELECT od.ProductID
, sq1.totalamt AS "Total sold"
, od.UnitPrice
, (od.UnitPrice * od.Quantity)/totalamt * 100 AS "% of Total"
    FROM [Order Details] od
    INNER JOIN
        --this creates a virtual table with columns of product id and totalamt
        (SELECT o.ProductID, SUM(o.UnitPrice * o.Quantity) AS "totalamt"
        FROM [Order Details] o
        GROUP BY o.ProductID)
        SQ1 ON SQ1.ProductID= od.ProductID

SP_HELP [Products]