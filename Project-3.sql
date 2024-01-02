CREATE DATABASE assignment3;
USE assignment3;
CREATE TABLE customer (customer_id int,cust_name varchar(50),city varchar(50),grade int,salesman_id int);
INSERT INTO customer VALUE
(3002,"Nick Rimando","New York",100,5001),
(3007,"Brad Davis","New York",200,5001),
(3005,"Graham Zusi","California",200,5002),
(3008,"Julian Green","London",300,5002),
(3004,"Fabian Johnson","Paris",300,5006),
(3009,"Goeoff Cameron","Berlin",100,5003),
(3003,"Jozy Altidor","Moscow",200,5007),
(3001,"Brad Guzan","London",NULL,5005);

CREATE TABLE salesman(salesman_id int,name varchar(50),city varchar(50),commission float);
INSERT INTO salesman value
(5001,"James Hoog","New York",0.15),
(5002,"Nail Knite","Paris",0.13),
(5005,"Pit Alex","London",0.11),
(5006,"Mc Lyon","Paris",0.14),
(5007,"Paul Adam","Rome",0.13),
(5003,"Lauson Hen","San Jose",0.12);

CREATE TABLE orders(ord_no int,purch_amt float,ord_date date,customer_id int,salesman_id int);

INSERT INTO orders VALUE
(7001,150.5,"2012-10-05",3005,5002),
(7009,270.65,"2012-09-10",3001,5005),
(7002,65.26,"2012-10-05",3002,5001),
(7004,110.5,"2012-08-17",3009,5003),
(7007,948.5,"2012-09-10",3005,5002),
(7005,2400.6,"2012-07-27",3007,5001),
(7008,5760,"2012-09-10",3002,5001);

/*1. From the following tables write a SQL query to find the salesperson and customer who
reside in the same city. Return Salesman, cust_name and city.*/

SELECT s.name,c.cust_name,c.city FROM 
salesman as s, customer as c 
WHERE c.city=s.city;

/*2. From the following tables write a SQL query to find those orders where the order
amount exists between 500 and 2000. Return ord_no, purch_amt, cust_name, city.*/

SELECT o.ord_no,o.purch_amt,c.cust_name,c.city
FROM orders as o,customer as c
WHERE o.customer_id=c.customer_id
AND purch_amt BETWEEN 500 AND 2000;

/*3. From the following tables write a SQL query to find the salesperson(s) and the
customer(s) he represents. Return Customer Name, city, Salesman, commission.*/

SELECT c.cust_name,c.city,s.name,s.commission
FROM customer as c,salesman as s 
WHERE c.salesman_id=s.salesman_id;

/*4. From the following tables write a SQL query to find salespeople who received
commissions of more than 12 percent from the company. Return Customer Name,
customer city, Salesman, commission.*/

SELECT c.cust_name,c.city,s.name,s.commission
FROM customer as c,salesman as s
WHERE c.salesman_id=s.salesman_id
AND s.commission>0.12;

/*5. From the following tables write a SQL query to locate those salespeople who do not
live in the same city where their customers live and have received a commission of
more than 12% from the company. Return Customer Name, customer city, Salesman,
salesman city, commission.*/

SELECT c.cust_name,c.city,s.name,s.city,s.commission
FROM customer as c
INNER JOIN salesman s
ON c.salesman_id=s.salesman_id
WHERE s.city<>c.city AND s.commission>0.12;

/*6. From the following tables write a SQL query to find the details of an order. Return
ord_no, ord_date, purch_amt, Customer Name, grade, Salesman, commission.*/

SELECT o.ord_no,o.ord_date,o.purch_amt,c.cust_name,c.grade,s.name,s.commission
FROM orders o
INNER JOIN customer c
ON o.customer_id=c.customer_id
INNER JOIN salesman s 
ON o.salesman_id=s.salesman_id;

/*7. From the following tables write a SQL query to display the customer name, customer
city, grade, salesman, salesman city. The results should be sorted by ascending
customer_id.*/

SELECT C.cust_name AS Customer_Name,C.city AS Customer_City,C.grade,S.name AS Salesman,S.city AS Salesman_City
FROM
    Customer C
JOIN
    Salesman S ON C.salesman_id = S.salesman_id
ORDER BY
    C.customer_id ASC;


/*8. From the following tables write a SQL query to find those customers with a grade less
than 300. Return cust_name, customer city, grade, Salesman, salesmancity. The result
should be ordered by ascending customer_id.*/

SELECT c.cust_name,c.city,c.grade,s.name,s.city
FROM customer as c, salesman as s 
WHERE c.salesman_id=s.salesman_id 
AND grade<300;

/*9. Write a SQL statement to make a report with customer name, city, order number, order
date, and order amount in ascending order according to the order date to determine
whether any of the existing customers have placed an order or not.*/

SELECT C.cust_name,C.city,O.ord_no,O.ord_date,O.purch_amt
FROM
    Customer C
LEFT JOIN
    Orders O ON C.customer_id = O.customer_id;

/*10. Write a SQL statement to generate a report with customer name, city, order number,
order date, order amount, salesperson name, and commission to determine if any of the
existing customers have not placed orders or if they have placed orders through their
salesman or by themselves.*/

SELECT c.cust_name,c.city,o.ord_no,o.ord_date,o.purch_amt,s.name,s.commission
FROM customer c
RIGHT JOIN salesman s
ON c.salesman_id=s.salesman_id
RIGHT JOIN orders o
ON c.customer_id=o.customer_id;

/*11. Write a SQL statement to generate a list in ascending order of salespersons who work
either for one or more customers or have not yet joined any of the customers.*/

SELECT s.salesman_id,s.name
FROM salesman s
LEFT OUTER JOIN customer c ON s.salesman_id = c.salesman_id
ORDER BY s.name ASC;

/*12. From the following tables write a SQL query to list all salespersons along with customer
name, city, grade, order number, date, and amount. Condition for selecting list of
salesmen : 1. Salesmen who works for one or more customer or, 2. Salesmen who not
yet join under any customer, Condition for selecting list of customer : 3. placed one or
more orders, or 4. no order placed to their salesman.*/

SELECT s.name AS "Salesman", c.cust_name AS "Customer", c.city, c.grade, 
       o.ord_no AS "Order No", o.ord_date AS "Date", o.purch_amt AS "Amount"
FROM salesman s
LEFT OUTER JOIN customer c ON s.salesman_id = c.salesman_id
LEFT OUTER JOIN orders o ON c.customer_id = o.customer_id
ORDER BY s.name, c.cust_name;

/*13. Write a SQL statement to make a list for the salesmen who either work for one or more
customers or yet to join any of the customer. The customer, may have placed, either
one or more orders on or above order amount 2000 and must have a grade, or he may
not have placed any order to the associated supplier.*/

SELECT s.salesman_id 
FROM salesman s 
LEFT JOIN customer c
ON s.salesman_id=c.customer_id
LEFT JOIN orders o
ON c.customer_id=o.customer_id
WHERE
o.purch_amt>=2000 AND c.salesman_id=s.salesman_id;

/*14. For those customers from the existing list who put one or more orders, or which orders
have been placed by the customer who is not on the list, create a report containing the
customer name, city, order number, order date, and purchase amount.*/

SELECT
    c.cust_name,
    c.city,
    o.ord_no,
    o.ord_date,
    o.purch_amt
FROM
    customer c
JOIN
    orders o ON c.customer_id = o.customer_id
WHERE
    c.customer_id IN (
        SELECT
            customer_id
        FROM
            customer
    )
    OR
    c.customer_id IS NULL;

/*15.Write a SQL statement to generate a report with the customer name, city, order no.
order date, purchase amount for only those customers on the list who must have a grade
and placed one or more orders or which order(s) have been placed by the customer who
neither is on the list nor has a grade.*/

SELECT
    c.cust_name,
    c.city,
    o.ord_no,
    o.ord_date,
    o.purch_amt
FROM
    customer c
JOIN
    orders o ON c.customer_id = o.customer_id
WHERE
    (c.grade IS NOT NULL AND c.customer_id IN (
        SELECT
            customer_id
        FROM
            customer
        WHERE
            grade IS NOT NULL
    ))
    OR
    (c.grade IS NULL AND c.customer_id NOT IN (
        SELECT
            customer_id
        FROM
            customer
        WHERE
            grade IS NOT NULL
    ));

/*16. Write a SQL query to combine each row of the salesman table with each row of the
customer table.*/

SELECT
    s.*,
    c.*
FROM
    salesman s
CROSS JOIN
    customer c;

/*17. Write a SQL statement to create a Cartesian product between salesperson and customer,
i.e. each salesperson will appear for all customers and vice versa for that salesperson
who belongs to that city.*/

SELECT
    s.salesman_id,
    s.name,
    s.city AS salesperson_city,
    c.customer_id,
    c.cust_name,
    c.city AS customer_city
FROM
    salesman s
CROSS JOIN
    customer c
WHERE
    s.city = c.city;

/*18. Write a SQL statement to create a Cartesian product between salesperson and customer,
i.e. each salesperson will appear for every customer and vice versa for those salesmen
who belong to a city and customers who require a grade.*/

SELECT
    s.salesman_id,
    s.name,
    s.city AS salesperson_city,
    c.customer_id,
    c.cust_name,
    c.city AS customer_city
FROM
    salesman s
CROSS JOIN
    customer c
WHERE
    s.city = c.city
    AND c.grade IS NOT NULL;
