
/*1. Create a report showing the title of courtesy and the first and last name
of all employees whose title of courtesy is not "Ms." or "Mrs.".*/

SP_HELP employees
SELECT 
e.LastName
, e.FirstName
, e.TitleOfCourtesy
FROM Employees e
WHERE e.TitleOfCourtesy != 'Ms.' 
AND e.TitleOfCourtesy !='Mrs.';

--Answer
SELECT e.TitleOfCourtesy, e.FirstName, e.LastName
FROM employees e WHERE e.TitleOfCourtesy NOT IN ('Ms.', 'Mrs.')

/*2. Create a report that shows the company name, contact title, city and country of all customers 
in Mexico or in any city in Spain except Madrid(in Spain).*/


SELECT 
c.CompanyName
, c.ContactTitle
, c.City
, c.Country
FROM Customers c
WHERE c.Country = 'Mexico'
OR (c.Country = 'Spain' 
AND c.City != 'Madrid');


--Answer
SELECT c.CompanyName, c.ContactTitle, c.City, c.Country
FROM customers c WHERE Country IN ('Mexico','Spain') AND CITY NOT IN ('Madrid')


/*3. Create a report showing the title of courtesy and the first and
last name of all employees whose title of courtesy begins with "M" and
is followed by any character and a period (.).*/

SELECT 
e.TitleOfCourtesy
, e.FirstName
, e.LastName
FROM Employees e
WHERE e.TitleOfCourtesy 
LIKE 'M_.';


--Answer
SELECT e.TitleOfCourtesy, e.FirstName, e.LastName
FROM Employees e WHERE e.TitleOfCourtesy LIKE ('M%.')

/*4. Create a report showing the first and last names of
all employees whose region is defined.*/

SELECT 
e.FirstName
, e.LastName
FROM Employees e
WHERE e.Region IS NOT NULL;


--Answer
SELECT e.FirstName, e.LastName
FROM Employees e WHERE e.Region IS NOT NULL


/*5. Select the Title, FirstName and LastName columns from the Employees table.
  Sort first by Title in ascending order and then by LastName 
   in descending order.*/

SELECT 
e.TitleOfCourtesy
, e.FirstName
, e.LastName
FROM Employees e
ORDER BY e.TitleOfCourtesy ASC
, e.LastName DESC;


--Answer
SELECT e.TitleOfCourtesy, e.FirstName, e.LastName
FROM Employees e ORDER BY e.TitleOfCourtesy, e.LastName DESC

/*6. Write a query to get the number of employees with the same job title.*/

SELECT * FROM Employees

SELECT 
e.Title
, COUNT(*) AS "Amount of people with same title"
FROM Employees e
GROUP BY e.Title;


--Answer
SELECT e.Title,COUNT(e.EmployeeID) AS "Count of Number of Employees with same job title"
FROM Employees e
GROUP BY e.Title

/*7.
Create a report showing the Order ID, the name of the company that placed the order,
and the first and last name of the associated employee.
Only show orders placed after January 1, 1998 that shipped after they were required.
Sort by Company Name.
*/


SELECT 
o.OrderID
, c.CompanyName
, e.FirstName
, e.LastName
FROM Customers c
	INNER JOIN Orders o
	ON c.CustomerID = o.CustomerID
	INNER JOIN Employees e
	ON e.EmployeeID = o.EmployeeID
WHERE o.OrderDate > '1998-01-01'
AND o.ShippedDate > o.RequiredDate
ORDER BY c.CompanyName;


--Answer
SELECT o.OrderID, c.CompanyName, e.FirstName, e.LastName
FROM Employees e
	JOIN Orders o ON (e.EmployeeID = o.EmployeeID)
	JOIN Customers c ON (c.CustomerID = o.CustomerID)
WHERE o.ShippedDate > o.RequiredDate AND o.OrderDate > '1998-01-01'
ORDER BY c.CompanyName;

/*8.
Create a report that shows the total quantity per products (from the OrderDetails table) ordered. Only show records for products for which the quantity ordered is fewer than 200. 
The report should return*/

SELECT
od.ProductID
, SUM(od.Quantity) AS "Total quantity ordered"
FROM [Order Details] od
GROUP BY od.ProductID
HAVING SUM(od.Quantity) < 200;


--Answer
SELECT p.ProductName, SUM(od.Quantity) AS "TotalUnits"
FROM [Order Details] od JOIN Products p ON
	(p.ProductID = od.ProductID)
GROUP BY p.ProductID,p.ProductName
HAVING SUM(od.Quantity) < 200;

/*9.Create a report that shows the total number of orders by Customer since December 31, 1996. The report should only return rows for which the NumOrders is greater than 15. 
*/

SELECT
o.CustomerID
, COUNT(o.OrderID) AS "Amount of Orders"
FROM Orders o
INNER JOIN Customers c
ON o.CustomerID = c.CustomerID
GROUP BY o.CustomerID
, o.OrderID
HAVING o.OrderDate > '1996-12-31'
AND COUNT(o.OrderID) > 15


SELECT
o.CustomerID
, COUNT(o.OrderID) AS "Amount of Orders"
FROM Orders o
INNER JOIN Customers c
ON o.CustomerID = c.CustomerID
GROUP BY o.CustomerID
HAVING o.CustomerID IN
    (SELECT o.OrderDate
    FROM Orders o
    WHERE o.OrderDate > '1996-12-31')

--Answer

SELECT c.CustomerID, COUNT(o.OrderID) AS "NumOrders"
FROM Customers c JOIN Orders o ON
	(c.CustomerID = o.CustomerID)
WHERE OrderDate >= '31-Dec-1996'
GROUP BY c.CustomerID
HAVING COUNT(o.OrderID) > 15
ORDER BY NumOrders DESC;

/*10.  SQL statement will return all customers, and number of orders they might have placed. 
Include those customers as well who have not placed any orders.*/

SELECT
c.CompanyName AS "Customers"
, COUNT(c.CustomerID) AS "Number of Orders"
FROM Orders o
FULL JOIN Customers c
ON c.CustomerID = o.CustomerID
GROUP BY c.CompanyName;


--Answer

SELECT c.CustomerID, COUNT(o.OrderID) AS "Number Of Orders Placed by Customer"
FROM Customers c LEFT JOIN Orders o
ON c.CustomerID=o.CustomerID
GROUP BY c.CustomerID


-- Time limit = 3:25