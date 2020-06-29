#SQL Theory
***Languages***
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

***Foreign, Primary Keys***
- Key to relational databases
- Primary keys are:
    - Unique
    - Cannot change
    - Not null
    - Sometimes composite
- Foreign keys are:
    - Duplicate
    - Can be null
    - Not unique
- Referential Integrity
    - Part of the one to N relationship
    - Foreign key must reference valid primary key
    - Key to adding record to table
    - Prevents missing or orphan rows
    
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
    
***Basics***
- Database
    - Repositry of Data, an organised collection of tables (columns, rows)
    - Structured set of data held in computer. SQL is a management system for it

- Needs to be structured
    - So contains right amount of info, and can be quiried. Labels therefore needed. 
 
- Column - Correspond to attributes of object
- Row - One set of attributes for one instance (Records, tuples)
- Table - Rows & Columns for entity (also called file)
- DBMS - Database management system
- Entity - whole dataset

***Types of databses***
- Flat-file
    - Stores everything in one table e.g excel, good for small datasets
- Relational
    - Seperate data into seperate tables
    - Linked through keys
- Big data
    - MongDB, Verica
    - For data analytics, Business Intel
    - Digital Age and IoT

***Database relationships***
- One to one. One employee has one NHS ID
- One to many. One customer has many purchases
- One to n = one to many
- Many to many. Many students on one courses
- Creates two way relationship, so needs junction box. 
    
***Processing sequence***
- Sytanx sequence is
    - SELECT, Distinct, Where, Group BY, **Having,** Order by

- Processing sequence
    - FROM, Where, Group BY, **Having,** SELECT, Distinct, Order by
