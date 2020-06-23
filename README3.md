#SQL Code from 23/06/2020
--create database
CREATE DATABASE max_palmer
USE max_palmer

-- This creates table
CREATE TABLE film_table
(
    film_id INT IDENTITY(1,2) PRIMARY KEY,
    film_name VARCHAR(10),
    film_type VARCHAR(6),
    date_of_Release DATE,
    director VARCHAR (15),
    writer VARCHAR (15),
    star VARCHAR (15),
    film_language CHAR (3),
    official_website VARCHAR (100),
    plot_summary VARCHAR (100)
);

--alter table, by adding column
ALTER TABLE film_table
ADD release_date DATETIME NOT NULL;

-- drop table
DROP TABLE director;

--insert values
INSERT INTO film_table (film_name, film_type, date_of_release, director, writer, star, film_language, official_website, release_date)
VALUES ('LOTR2', 'stuff', '2000-01-19', 'jeff', 'greg', 'vigo', 'eng', 'url here', '2000-01-19 12:00:00'); 

--update values
UPDATE film_table SET film_type='thing' WHERE film_name='LOTR2'

--create table
CREATE TABLE director
(
    director_id INT IDENTITY(1,1),
    director_name VARCHAR(50),
    city VARCHAR(20) DEFAULT 'London',
    film_id INT,
    PRIMARY KEY(director_id),
    FOREIGN KEY(film_id) REFERENCES film_table(film_id)
);

--inserts value into director
INSERT INTO director
(director_name, film_id)
VALUES
('Harry', 3)

--lists columns
SP_HELP director;

--seeing data containing in tables
SELECT * FROM film_table;
SELECT * FROM director;