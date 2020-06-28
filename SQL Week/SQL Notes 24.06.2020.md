#SQL Notes 24/06/2020
- Where clause filters data
````
SELECT * FROM Products WHERE Discontinued = 1
````
- Count function does as suggested, and AS creates new column
````
SELECT COUNT(*) AS "Number of Employees in London" FROM Employees 
WHERE CITY = 'London';
````
- Always use "" for AS in coding games

- Apostrophe
    - Cant use ' on own within '', have to use escape character

- Top command limits data asked for
````
SELECT TOP 10 c.CompanyName, c.City
FROM Customers c
WHERE Country = 'France'
````
- AND/OR. Helps define where
````
SELECT p.ProductName, p.UnitPrice
FROM Products p
WHERE p.CategoryID = 1 AND p.Discontinued = 0

SELECT p.ProductName, p.UnitPrice
FROM Products p
WHERE p.CategoryID = 1 OR p.Discontinued = 0
````
- Distinct. Values must be distinct in table
````
SELECT DISTINCT Country
AS "Place"
FROM Customers
Where ContactTitle = 'Owner'
````
- Operators
````
SELECT p.ProductName, p.UnitPrice
FROM Products p
WHERE p.UnitsInStock > 0 AND p.UnitPrice > 29.99
````
- Like, search for specified pattern in column
````
SELECT c.Country
FROM Customers c
WHERE c.Country like '%Y'
````
- Wildcards
    - % is unlimited characters
    - _ is set amount of units
    - [y] is Charlist. Searches for what in list
    - [^x] is negative Charlist. defines not what in lists
````
SELECT c.Country
FROM Customers c
WHERE c.Country like '%Y'
WHERE c.Country like 'U__' OR c.Country LIKE '[^IT]%'
````
- IN. Helps define where. Searches for item in set values.
````
SELECT DISTINCT p.ProductName, p.ProductID
FROM Products p
WHERE p.ProductID IN (1, 3) 
````
- Between. Includes values between and limiting values. 
````
SELECT DISTINCT p.ProductName, p.ProductID
FROM Products p
WHERE p.ProductID BETWEEN 1 AND 2
````
- Group by. Sorts Table by column
````
SELECT o.EmployeeID, COUNT(*)
AS 'Number of orders'
FROM Orders o
WHERE o.EmployeeID IN (5, 7)
GROUP BY o.EmployeeID
````
- Concecanate. Combines two columns to new column. 
    - Without AS will leave column unnamed
````
SELECT CompanyName AS "Company name",
CONCAT(City, ', ' ,c.Country) AS "City"
FROM Customers c
````
- Is NULL, checks in value is NULL. Also can be IS NOT NULL
````
SELECT CompanyName AS "Company Name",
City + ', ' + Country AS "City"
From Customers
Where Region is NULL
````
- Arithmetic Functions
    - * is times
    - + is plus
    - - is minus
    - / is divide
    - % is modulus. Finding reminder
````
SELECT o.UnitPrice, o.Quantity, o.Discount, o.OrderID,
o.UnitPrice * o.Quantity AS "Gross Total",
ROUND((1.00- o.Discount) *o.UnitPrice * o.Quantity,2) AS "Net Total"
FROM [Order Details] o
ORDER BY [Net Total] desc
````
**- SQL indexing starts at 1**
- String functions
    - Substring. Selects substring. 
    ````
  SELECT film_name, SUBSTRING(film_name, 1, 3) AS "Extracted String" FROM film_table
     ````
    - Charindex. Gets position of character
    ````
    SELECT film_name, CHARINDEX('s', film_name) AS "Position of Character" FROM film_table ;
    ````
    - LEFT/RIGHt, gets x. amount of characters from right or left
    ````
    SELECT film_name, RIGHT(film_name, 2) AS "Extracted String" FROM film_table
    ````
    - LTRIM/RTRIM. Removes spaces from edge of left or right
    ````
    SELECT film_name, RTRIM(film_name) AS "Trimmed String" FROM film_table
    ````
    - LEN. Gets length of string
    ````
    SELECT film_name, LEN(film_name) AS "LENGTH of String" FROM film_table
    ````   
    - Replace. Replaces characters with others
    ````
    SELECT film_name, REPLACE(film_name,' ','A') AS "Replaced String" FROM film_table
    ````
    - UPPER/LOWER. Changes case of letters
    ````
    SELECT film_name, UPPER(film_name) AS "Uppercase String", LOWER(film_name) AS "Lowercase String" FROM film_table
    ````
