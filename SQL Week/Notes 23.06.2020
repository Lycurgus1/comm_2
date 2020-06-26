#SQL Notes 23/06/2020

****SQL languages****
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
- Examples for all in word
    
