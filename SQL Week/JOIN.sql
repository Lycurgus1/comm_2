USE astha_db

CREATE TABLE student
(
    st_id INT IDENTITY(1,1),
    student_name VARCHAR(30),
    course_id INT,
    FOREIGN KEY (course_id) REFERENCES course(c_id) ON DELETE CASCADE

)
DROP TABLE course
CREATE TABLE course  
(
    c_id INT IDENTITY(1,1) PRIMARY KEY,
    course_name VARCHAR(30)
)

INSERT INTO course
(
    course_name
)
VALUES
(
    'Business' 
),
(
    'Test'
),
(
    'Agile'
),
(
    'Web'
),
(
    'Dev'
)

INSERT INTO student
(
   student_name, course_id 
)
VALUES
(
    'Lee', 1
),
(
    'Barry', 1
),
(
    'David', 2
),
(
    'Tim',5
),
(
    'Nicole',
)

INSERT INTO student
(
   student_name
)
VALUES
(
    'Nicole'   
)

SELECT * FROM student
SELECT * FROM course

/*INNER JOIN-matched rows*/

SELECT * FROM course c INNER JOIN student s
ON s.course_id=c.c_id

/*OUTER JOINS-LEFT JOIN, RIGHT JOIN, FULL JOIN*/
/*LEFT JOIN-All the rows from the left table and only the matching rows from the right table*/

SELECT * FROM student s LEFT JOIN course c   
ON s.course_id=c.c_id

SELECT * FROM student s RIGHT JOIN course c   
ON s.course_id=c.c_id

SELECT * FROM student s FULL JOIN course c   
ON s.course_id=c.c_id

