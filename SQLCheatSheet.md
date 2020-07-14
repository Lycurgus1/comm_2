#SQL Cheat Sheet

***SQL Lanaguages***
- Data Manipulation Language (DML)
    - Contains SELECT, INSERT,UPDATE, DELETE
 - Data Definition Language (DDL)
    - Contains CREATE, ALTER, DROP, TRUNCATE
    - Structure of table manipulation
    - Drop gets rid of table and data
    - Truncate gets rid of data not table
- Data Control Language (DCL)
    - Grant, Revoke
    - Data Administration and access to table
- Transaction Control Language (TCL)
    - COMMIT, ROLLBACK, SAVEPOINT
    - Only when change is committed will others see it
    
**Data types**
- VARCHAR()
    - Records max size of string, adaptable to different sizes and memory efficent
- CHAR()
    - Data must be of fixed length, fixed space use but 50% more efficient
- INT
    - Holds whole number, postive or negative
    - Also BIGINT, SMALLINT, TINYINT (Diff memory sizes)
- DATE/DATETIME
    - As expected, set format of:'2000-01-19 12:00:00'
 - DECIMAL(size, d)
    - fixed precision, sacle no. of digits to right specified.The total digits is specified in size. The digits after decimal point is specified in the d parameter.
 - BINARY(size)
    - Stores Binary data like image and files 
 -FLOAT(size, d)
    - The total digits is specified in size. The digits after decimal point is specified in the d parameter.
- BIT
    - Binary. 0,1 or NULL. Used as boolean
 - Data Type usage
    - Phone number etc. as CHAR as limited and always same length
    - VARCHAR when length variable  
    
**Code**   
Create Database
- "CREATE DATABASE max_palmer"
Create Table
```
CREATE TABLE film_table
(
    film_name VARCHAR(10),
    film_type VARCHAR(6),
    date_of_Release DATE,
    film_language CHAR (3),
);
```

SELECT usage
````
SELECT * FROM film_table;
````

Alter Table
````
ALTER TABLE film_table
ADD release_date DATETIME NOT NULL;
````
- Can be used to modify, rename, add or drop columns

Inserting Values
````
INSERT INTO director
(director_name, film_id)
VALUES
('Harry', 3)
````
- OR dont need to mention columns as in 'INSERT INTO x VALUES ('test', 'test2'). Will fall into relevant columns.


Drop command
- DROP TABLE director;

Null
- NULL is not nothing, not = 0. Not empty string. Value can be null but null != null as null undefined. 

**Update, Delete Commands**
````
UPDATE film_table SET film_type='thing' WHERE film_name='LOTR2'
DELETE FROM x WHERE column_name = 2
````
- without where will empty out table

**Constraints**
- IDENTITY
    - Creates iterating int for primary key and foreign key relationships
    ````
    CREATE TABLE Customers ( 
    CustomerID Int IDENTITY NOT NULL);
    ````
- NOT NULL
    -Ensures that a column cannot have a NULL value
    ````
    CREATE TABLE Persons (
    ID int NOT NULL);_
    ````
- UNIQUE
    - Ensures that all values in a column are different
    ````
    CREATE TABLE Persons (
    ID int UNIQUE
    );
  ````
 - PRIMARY KEY
    -A combination of a NOT NULL and UNIQUE. Uniquely identifies each row in a table
    ````
    CREATE TABLE Persons (
    Age int,
    PRIMARY KEY (ID)
    ); 
   ````
- FOREIGN KEY
    - Uniquely identifies a row/record in another table
    ````
    CREATE TABLE Persons (
    Age int,
    FOREIGN KEY (ID)
    ); 
  ````
- DEFAULT
    - Sets a default value for a column when no value is specified
    ````
    CREATE TABLE Persons (
    City varchar(255) DEFAULT 'Sandnes'
    ); 
    ````
**Database considerations**
- Security (admin rights etc.)
- Recovery (data centre outages etc.)
- Integrity
- Normal form(normalisation)

**Normalisation**
- 1st Normal form
    - When Data is atomic, as simple as possible
    - No repition of Data
- 2nd Normal form
    - When 1NF met
    - When all non - key attributes based on primary key
- 3rd Normal form
    - When 2NF met
    - When no non-key column depedent on other non-key column

- Count function does as suggested, and AS creates new column
````
SELECT COUNT(*) AS "Number of Employees in London" FROM Employees 
WHERE CITY = 'London';
````

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
  **Date Functions**
- Returns current date and time
````
SELECT GETDATE()
````
- returns date and time of computer
````
SELECT SYSDATETIME()
````
- add days 
````
DATEADD(YEAR/MONTH/DAY, 5, OrderDate) AS "Due Date"
````
- calculates date difference
````
DATEDIFF(YEAR/MONTH/DAY, OrderDate, ShippedDate) AS "Ship Time"
````
-Get year/month/day
````
SELECT YEAR/MONTH/DAY() AS "Order time period
````
-exercise 1, also showing datetime formatting
````
SELECT e.BirthDate,
CONCAT(e.FirstName, ' ' ,e.LastName) AS "Name",
DATEDIFF(yy, e.BirthDate, GETDATE()) AS "AGE"
FROM Employees e
````
- SELECT DATENAME
    - Used for displaying data in excel
    - Otherwise can be weird in making graphs   
```
SELECT DATENAME(year, '12:10:30.123')
```

SELECT CASE
````
SELECT CASE
WHEN DATEDIFF (d, OrderDate,ShippedDate) < 10 THEN 'On Time'
ELSE 'Overdue'
END AS "Status"
FROM Orders o
````
- Exercise 
````
SELECT CONCAT(e.FirstName, ' ' ,e.LastName) AS "Name",
    DATEDIFF(yy, e.BirthDate, GETDATE()) AS "AGE",
CASE
WHEN DATEDIFF(YEAR,BirthDate, GETDATE()) >= 65 THEN 'Retired'
WHEn DATEDIFF(YEAR,BirthDate, GETDATE()) >= 60 THEN 'Retirement due'
ELSE 'More than 5 years'
END AS "Status"
FROM Employees e
````
- Group by, Having
   - Group by does not allow WHERE due to SQL Processing sequence
   ````
    SELECT p.SupplierID,
    SUM(UnitsOnOrder) AS "Total",
    AVG(p.UnitsOnOrder) AS "AVG"
    FROM Products p
    Group by p.SupplierID
    HAVING AVG (p.UnitsOnOrder) > 5
  ````
- Joins
   - Combines rows
   - Often explained with Venn Diagrams
   - Reliant on Primary, Foreign Key relationship
   - Use Entity relationship diagram to find method

- Inner Join
   - Selects only matches
   ````
   --join. Left becomes left table, right right table
    SELECT *
    FROM Course c 
    INNER JOIN Student s
   ````
- Left/Right join
   - Combines matches + left/right join
   - Null inserted where no matches
   ````
    SELECT * FROM student s LEFT JOIN course c   
    ON s.course_id=c.c_id
    ````
- Full join
    - returns all records
    - Also uses null where no matches
    ````
    SELECT * FROM student s FULL JOIN course c   
    ON s.course_id=c.c_id
    ````
- Self Join
    - Unary relationship
    - Rows of table combined

- Cross/Cartesian join
    - Generates pair combination of each row in 1st table with row in second table
    - Ouputs all combinations of rows
    - Output = amount of columns from A * Amount of columns from B
 
- SQL Logical Syntax Sequence
    - Select, Distinct, Where, Group by, Having, Order by 

- SQL Processing Sequence
    - From, Where,Group by, Having, Select, Distinc, Order by
 
