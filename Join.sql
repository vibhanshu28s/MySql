CREATE DATABASE JOINS;
USE JOINS;
CREATE TABLE STUDENT(ID INT PRIMARY KEY, NAME VARCHAR(50));
INSERT INTO STUDENT VALUES
(101,"ADAM"),
(102,"BOB"),
(103,"CASEY");
SELECT * FROM STUDENT;

CREATE TABLE COURSE(ID INT PRIMARY KEY, NAME VARCHAR(50));
INSERT INTO COURSE VALUES
(102,"ENGLISH"),
(105,"MATHS"),
(103,"SCIENCE"),
(107,"CS");

SELECT * FROM COURSE;

SELECT * FROM STUDENT INNER JOIN COURSE ON STUDENT.ID=COURSE.ID;

SELECT * FROM STUDENT S INNER JOIN COURSE C ON S.ID=C.ID;

SELECT * FROM STUDENT AS S INNER JOIN COURSE AS C ON S.ID=C.ID;

SELECT * FROM STUDENT AS S LEFT JOIN COURSE AS C ON S.ID=C.ID UNION ALL

SELECT * FROM STUDENT AS S RIGHT JOIN COURSE AS C ON S.ID=C.ID;

SELECT * FROM STUDENT WHERE 
COURSE.ID CONTAINS ONLY ELEMENTS FROM STUDENT.ID;

create table employee
(id int primary key,
name varchar(10),
manager_id int);

insert into employee values
(101,"Adam",103),
(102,"Bob",104),
(103,"Casey",null),
(104,"Donald",103);

SELECT*FROM employee;

SELECT a.name as manager,b.name
FROM employee as a
join employee as b
ON a.id=b.manager_id;

SELECT *
FROM employee as a
join employee as b
ON a.id=b.manager_id;
