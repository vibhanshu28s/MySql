CREATE DATABASE college;
USE college;
CREATE TABLE student(
	roll_no INT PRIMARY KEY,
	name VARCHAR(50),
	marks INT NOT NULL,
	grade VARCHAR(1),
	city VARCHAR(20)
);

INSERT INTO student values
(101,"Anil",78,"C","Pune"),
(102,"Bhumika",93,"A","Mumbai"),
(103,"Chetan",85,"B","Mumbai"),
(104,"Dhruv",96,"A","Delhi"),
(105,"Riya",12,"F","Delhi");

INSERT INTO student values(106,"Farah",82,"B","Delhi");

show databases;

SELECT * FROM STUDENT;

select city from student;
select distinct city from student;

SELECT name FROM STUDENT WHERE marks>80;

SELECT * FROM student WHERE marks>80;

SELECT name, marks FROM STUDENT WHERE MARKS>80;

SELECT * FROM STUDENT WHERE MARKS>80 AND CITY="MUMBAI";

SELECT * FROM STUDENT WHERE MARKS+10>100;

SELECT * FROM STUDENT WHERE MARKS>=75 OR CITY="MUMBAI";

SELECT * FROM STUDENT WHERE MARKS BETWEEN 80 AND 90;

SELECT * FROM STUDENT WHERE CITY IN ("DELHI","MUMBAI");

SELECT * FROM STUDENT WHERE CITY NOT IN ("DELHI","MUMBAI");

SELECT * FROM STUDENT WHERE CITY!="DELHI" AND CITY!="MUMBAI";

SELECT * FROM STUDENT WHERE MARKS>=75 LIMIT 3;

SELECT * FROM STUDENT LIMIT 3 OFFSET 2;

SELECT * FROM STUDENT ORDER BY MARKS DESC;

SELECT * FROM STUDENT ORDER BY MARKS ASC;

SELECT * FROM STUDENT ORDER BY MARKS;

SELECT * FROM STUDENT ORDER BY MARKS DESC LIMIT 3;

SELECT * FROM STUDENT ORDER BY MARKS DESC LIMIT 3 OFFSET 1;

SELECT MAX(MARKS) FROM STUDENT;

SELECT MIN(MARKS) FROM STUDENT;

SELECT SUM(MARKS) FROM STUDENT;

SELECT AVG(MARKS) FROM STUDENT;

SELECT COUNT(MARKS) FROM STUDENT;

SELECT CITY, COUNT(ROLL_NO) FROM STUDENT GROUP BY CITY;

SELECT CITY, AVG(MARKS) FROM STUDENT GROUP BY CITY;

SELECT CITY, AVG(MARKS) FROM STUDENT GROUP BY CITY ORDER BY AVG(MARKS) DESC;

SELECT CITY, AVG(MARKS) FROM STUDENT GROUP BY CITY ORDER BY CITY ASC;

SELECT CITY, COUNT(ROLL_NO) FROM STUDENT GROUP BY CITY HAVING MAX(MARKS)>90;

SELECT CITY FROM STUDENT WHERE GRADE="A" GROUP BY CITY HAVING MAX(MARKS)>90 ORDER BY CITY;

UPDATE STUDENT SET ROLL_NO=107 WHERE ROLL_NO=102;

UPDATE STUDENT SET MARKS=MARKS+1;

SET SQL_SAFE_UPDATES=0;

DELETE FROM STUDENT WHERE MARKS<30;