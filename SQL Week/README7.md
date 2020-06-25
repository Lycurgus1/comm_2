#SQL Notes 25/06/2020
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
SELECT YEAR/MONTH/DAY AS "Order time period
````
-exercise 1
````
SELECT e.BirthDate,
CONCAT(e.FirstName, ' ' ,e.LastName) AS "Name",
DATEDIFF(yy, e.BirthDate, GETDATE()) AS "AGE"
FROM Employees e
````
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
- Aggregate functions
    - Sum, average, min, max, Count
````
SELECT SUM(p.UnitsOnOrder) AS "Total",
    AVG(p.UnitsOnOrder) AS "AVG",
    Min(p.UnitsOnOrder) AS "Min",
    Max(p.UnitsOnOrder) AS "Max",
    Count(p.UnitsOnOrder) AS "Count"
FROM Products p
````
-Exercise
````
SELECT AVG(p.ReorderLevel) AS "AVG Reorder Level"
FROM Products p
GROUP BY p.CategoryID
ORDER BY "AVG Reorder Level" DESC
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
   - Various types:
   - Inner join
   - Full join
   - Left join
   - Right join
   - Self join
   - Cartesian join
   - Reliant on Primary, Foreign Key relationship
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
    