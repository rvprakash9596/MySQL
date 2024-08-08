SHOW DATABASES;

create database DBMS_LAB_WORK;

show databases;

use dbms_lab_work;

show tables;

-- Now let's create Worker Table

create table Worker (WORKER_ID INT(10), 
					 FIRST_NAME varchar(15), 
                     LAST_NAME varchar(15), 
                     SALARY int(10),
                     JOINING_DATE datetime,
                     DEPARTMENT varchar(15)
                     );
DESC WORKER;
INSERT INTO WORKER VALUES(001,"Raman","Singh",100000,'2014-02-20 09:00:00',"HR"),
						 (002,"Ravi","Prakash",80000,'2014-06-11 09:00:00',"Admin"),
						 (003,"Vishal","Singhal",300000,'2014-02-20 09:00:00',"HR"),
                         (004,"Amitabh","Singh",500000,'2014-02-20 09:00:00',"Admin"),
                         (005,"Vivek","Bhati",500000,'2014-06-11 09:00:00',"Admin"),
                         (006,"Vipul","Diwan",200000,'2014-06-11 09:00:00',"Account"),
                         (007,"Satish","Kumar",75000,'2014-01-20 09:00:00',"Account"),
                         (008,"Geetika","Chauhan",90000,'2014-04-11 09:00:00',"Admin");
select * from worker;

-- Now let's create Bonus Table

create table Bonus (WORKER_REF_ID INT(5), BONUS_DATE datetime, BONUS_AMOUNT INT(10));
DESC BONUS;
INSERT INTO BONUS VALUES (1,'2016-02-20   00:00:00',5000),
						 (2,'2016-06-11   00:00:00',3000),
                         (3,'2016-02-20   00:00:00',4000),
                         (1,'2016-02-20   00:00:00',4500),
                         (2,'2016-06-11   00:00:00',3500);
select * from BONUS;


-- Now let's create Title Table

CREATE TABLE TITLE ( WORKER_REF_ID INT(5), WORKER_TITLE varchar(20), AFFECTED_FROM datetime);
DESC TITLE;
INSERT INTO TITLE VALUES ( 1,"Manager",'2016-02-20   00:00:00' ),
						 ( 2,"Executive",'2016-06-11  00:00:00'),
						 (8,"Executive",'2016-06-11  00:00:00'),
						 (5,"Manager",'2016-06-11  00:00:00'),
                         (4,"Asst. Manager",'2016-06-11  00:00:00'),
                         (7,"Executive",'2016-06-11  00:00:00'),
                         (6,"Lead",'2016-06-11  00:00:00'),
                         (3,"Lead",'2016-06-11  00:00:00');
select * from TITLE;
-- Q-1. Write an SQL query to fetch “FIRST_NAME” from Worker table using the alias name as <WORKER_NAME>.
select first_name as Worker_Name from worker;

-- Q-2. Write an SQL query to fetch “FIRST_NAME” from Worker table in upper case.
select upper(First_Name) from worker;

-- Q-3. Write an SQL query to fetch unique values of DEPARTMENT from Worker table.
select distinct Department from worker;

-- Q-4. Write an SQL query to print the first 3 characters of FIRST_NAME from Worker table.
select substring(First_Name,1,3) from worker;

-- Q-5. Write an SQL query to find the position of the alphabet (‘t’) in the first name column ‘Amitabh’ from Worker table.
select instr(First_Name, binary 't') from worker where first_name="Amitabh";

-- Q-6. Write an SQL query to print the FIRST_NAME from Worker table after removing white spaces from the right side.
select rtrim(first_name) from worker;

-- Q-7. Write an SQL query to print the DEPARTMENT from Worker table after removing white spaces from the left side.
select ltrim(Department) from worker;

-- Q-8. Write an SQL query that fetches the unique values of DEPARTMENT from Worker table and prints its length.
select distinct length(Department)  from worker;

-- Q-9. Write an SQL query to print the FIRST_NAME from Worker table after replacing ‘a’ with ‘A’.
select replace(First_Name,'a','A') from worker;

-- Q-10. Write an SQL query to print the FIRST_NAME and LAST_NAME from Worker table into a single column COMPLETE_NAME. A space char should separate them.
select concat(First_Name,'  ',Last_Name) as 'Complete_Name' from worker;

-- Q-11. Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending.
select * from worker order by first_name asc;
select * from worker order by salary desc;

-- Q-12. Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending and DEPARTMENT Descending.
select * from worker order by first_name asc,department desc;

-- Q-13. Write an SQL query to print details for Workers with the first name as “Vipul” and “Satish” from Worker table.
select * from worker where first_name in ('Vipul','Satish','Ravi');

-- Q-14. Write an SQL query to print details of workers excluding first names, “Vipul” and “Satish” from Worker table.
select * from worker where first_name not in ('Vipul','Satish');

-- Q-15. Write an SQL query to print details of Workers with DEPARTMENT name as “Admin”.