use school;
CREATE TABLE STUDENT
(
StdID INT,
StdName VARCHAR(50),
Sex VARCHAR(6),
Percentage INT,
Class INT,
Sec VARCHAR(1),
Stream VARCHAR(50),
DOB DATE
);

insert into student values
(1002,"Anjani Sharma","Female",75,11,"A","Commerce","18/09/1996"),
(1003,"Anshul Saxena","Male",78,11,"A","Commerce","19/11/1996"),
(1004,"Aishwarya Singh","Female",79,11,"A","Commerce","01/11/1996"),
(1005,"Akriti Saxena","Female",76,11,"A","Commerce","20/09/1996"),
(1006,"Khushi Agarwal","Female",77,11,"A","Commerce","14/09/2003"),
(1007,"Maahi Agarwal","Female",74,11,"A","Science","21/04/1997"),
(1008,"Mitali Gupta","Female",78,12,"A","Science","26/11/1997"),
(1009,"Nikunj Agarwal","Male",58,12,"A","Science","12/07/1997"),
(1010,"Parkhi","Female",59,12,"A","Commerce","20/12/1997"),
(1011,"Prakhar Tiwari","Male",43,12,"A","Science","22/04/1997"),
(1012,"Raghav Gangwar","Male",58,12,"A","Commerce","21/12/1997"),
(1013,"Sahil Saraswat","Male",57,12,"A","Commerce","13/08/1997"),
(1014,"Swati Mishra","Female",98,11,"A","Science","13/08/1996"),
(1015,"Harsh Agarwal","Male",58,11,"B","Science","28/08/2003"),
(1016,"Harshit Kumar","Male",98,11,"B","Science","22/05/2003"),
(1017,"Jahanvi Kapoor","Male",65,11,"B","Science","10/01/1997"),
(1018,"Stuti Mishra","Male",66,11,"C","Commerce","10/01/1996"),
(1019,"Suryansh Kumar Agarwal","Male",85,11,"C","Commerce","22/08/2007"),
(1020,"Tani Rastogi","Female",75,12,"C","Commerce","15/01/1998"),
(1021,"Tanishk Gupta","Male",55,12,"C","Science","11/04/1998"),
(1022,"Tanmay Agarwal","Male",57,11,"C","Commerce","28/06/1998"),
(1023,"Yash Saxena","Male",79,11,"C","Science","13/03/1998"),
(1024,"Yesh Dubey","Male",85,12,"C","Commerce","03/04/1998");

select*from student;
SELECT STDNAME,DOB FROM STUDENT;
SELECT * FROM STUDENT WHERE PERCENTAGE>=80;
SELECT *  FROM STUDENT WHERE STREAM="SCIENCE" AND PERCENTAGE>75;
DESC STUDENT;
ALTER TABLE STUDENT ADD TeacherID varchar(20);
ALTER TABLE STUDENT MODIFY COLUMN TeacherID INT;
ALTER TABLE STUDENT DROP COLUMN TeacherID;
SET SQL_SAFE_UPDATES=0;
UPDATE STUDENT SET PERCENTAGE=PERCENTAGE-5;
SELECT STDNAME,PERCENTAGE FROM STUDENT;
SELECT STDNAME AS STUDENT_NAME,DOB AS DATE_OF_BIRTH FROM STUDENT;
SELECT* FROM STUDENT WHERE STREAM!="SCIENCE";
SELECT STDNAME,PERCENTAGE FROM STUDENT WHERE PERCENTAGE BETWEEN 60 AND 80;
UPDATE STUDENT SET STDNAME="SWATI VERMA",PERCENTAGE=86 WHERE STDID=1014;
DELETE FROM STUDENT WHERE STDID=1016;
SELECT * FROM STUDENT WHERE STDNAME LIKE 'G_';
SELECT * FROM STUDENT WHERE STDNAME='G';
SELECT * FROM STUDENT WHERE STDNAME LIKE 'G%';
SELECT * FROM STUDENT WHERE STDNAME='%G%';
SELECT STREAM FROM STUDENT;
SELECT StdName, Sex, Stream FROM Student WHERE percentage BETWEEN 70 AND 80;

CREATE TABLE empl(empno int,ename varchar(20),job varchar(20),mgr int,hiredate varchar(20),sal float,comm float,deptno int);
DESC EMPL;
INSERT INTO EMPL VALUES
(8369,"SMITH","CLERK",8902,"1990-12-18",800.00,NULL,20),
(8499,"ANYA","SALSEMAN",8698,"1991-02-20",1600.00,300,30),
(8521,"SETH","SALSEMAN",8698,"1991-02-22",1250.00,500.00,30),
(8566,"MAHADEVAN","MANAGER",8839,"1991-04-02",2985.00,NULL,20),
(8654,"MOMIN","SALESMAN",8698,"1991-09-28",1250.00,1400.00,30),
(8698,"BINA","MANAGER",8839,"1991-05-01",2850.00,NULL,30),
(8882,"SHIVANSH","MANAGER",8839,"1991-06-09",2450.00,NULL,10),
(8888,"SCOTT","ANALYST",8566,"1992-12-09",3000.00,NULL,20),
(8839,"AMIR","PRESIDENT",NULL,"1991-11-16",5000.00,NULL,10),
(8844,"KULDEEP","SALSEMAN",8698,"1991-09-08",1500.00,0.00,30);

SELECT * FROM EMPL;
SELECT ENAME,SAL FROM EMPL WHERE SAL>=2200;
SELECT * FROM EMPL WHERE COMM="NULL";
SELECT ENAME,SAL FROM EMPL;
SELECT ENAME,JOB,SAL FROM EMPL WHERE JOB!="MANAGER";
SELECT ENAME FROM EMPL WHERE ENAME LIKE "__A%";
SELECT ENAME FROM EMPL WHERE ENAME LIKE "%T";
SELECT ENAME FROM EMPL WHERE ENAME LIKE "M_L";
SELECT * FROM EMPL WHERE COMM="NULL";
SELECT ENAME,SAL FROM EMPL WHERE SAL NOT BETWEEN 2500 AND 4000;
SELECT * FROM EMPL WHERE COMM IS NULL AND COMM = 'Not given';