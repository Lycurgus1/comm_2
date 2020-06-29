#SQL Cheat Sheet for common errors

***Common Errors***

***Having***
- Done when using conditonal statements to data not in table
- I.E Using aggregate functions(sum etc.)
- Can be used as well as where, see below
```
SELECT titles.pub_id, AVG(titles.price)  
FROM titles INNER JOIN publishers  
   ON titles.pub_id = publishers.pub_id  
WHERE publishers.state = 'CA'  
GROUP BY titles.pub_id  
HAVING AVG(price) > 10
```
- Where first classifies based on data in table
- Then having uses aggregate function(virtual table) to secondly classify

***Subquery***
- Can have inner query inside inner query
- Runs prior to query. Similar to join
- Alternative to joins
```
SELECT a.studentid, a.name, b.total_marks
FROM student a, marks b
WHERE a.studentid = b.studentid AND b.total_marks >
    (SELECT total_marks
    FROM marks
    WHERE studentid =  'V002');
```
- Inner query runs first, gets total marks of student 2
- Then compares this to the where statement
    
***COUNT***
- Count enables you to count by the attribute selected in the group by section
- Can also be done with conditional statements
````
SELECT 
e.Title
, COUNT(*) AS "Amount of people with same title"
FROM Employees e
GROUP BY e.Title;
````
```
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
```
***Using a Self Join***
- Inner join the table to virtual table

```
SELECT
CONCAT(A.FirstName, ' ', A.LastName) "Employee Name"
, CONCAT(B.FirstName, ' ', B.LastName) AS "Manager Name"
FROM Employees A 
INNER JOIN Employees B
    ON A.EmployeeID = B.ReportsTo
ORDER BY [Manager Name];
```
***Joins***
- Inner join
- Full join
- Left join
- Right join
- Self join
- Cartesian join
    - Return nulls where no matches bar Full Join
    - Cartesian Join is every possible combination of rows

***Maxims***
- Always answer specific question - Specif column name
- Format ((xyz)'c') to display something in cash format
- Only sort in game questions when asked
- SQL indexing starts at 1
- When Customers mentioned do GROUP BY customers
- Cast can be used to make something into another datatype
````
SELECT CAST('2017-08-25' AS datetime); 
````
- 