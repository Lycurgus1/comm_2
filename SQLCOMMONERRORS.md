#SQL Cheat Sheet

***Common Errors***

- Having
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

- Subquery
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
    
 
