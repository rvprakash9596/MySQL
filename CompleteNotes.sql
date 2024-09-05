create database college;
show databases;
use college;

create table student (
Roll_No int primary key,
Name varchar(20) ,
Age int not null
);

show tables;
desc student;

select * from student;

insert into student values(101,"Ramu",21),(102,"Chacha",25);
insert into student (Roll_no , name,age ) values (103,"Shyam",32);
select * from student;

-- Practice 1 ============================================================================

create database xyz_company;
use xyz_company;
create table employee (id int primary key, 
name varchar(20) , 
salary float);

insert into employee values(1,"Ravi ",35000),(2,"Sonu ",45000),(3,"Mote ",65000);
select * from employee;

-- =======================================================================================

create table temp1( id int unique);
insert into temp1 values(101);
insert into temp1 values(101);


create table temp2( id int , salary int default 25000);
insert into temp2 (id)  values (101); 
select * from temp2;
drop database xyz;

-- =======================================================================================
create database t1;
create database if not exists t1; -- It is a good practice while we are creating a Database

drop database t1;
drop database if exists t1; -- This is a good practice.
show databases;

drop database college;


create database college;
use college;
show tables;

create table student (
rollno int primary key,
name varchar(50),
marks int not null ,
grade varchar(1),
city varchar(20)
);

insert into student (rollno,name,marks,grade,city) values
(101,"Ram",88,"A","KLD"),
(102,"Shyam",93,"A","gkp"),
(103,"Mohaam",84,"A","lko"),
(104,"Monu",97,"A","bnz"),
(105,"Shonu",11,"F","noida"),
(106,"Daaku",75,"B","Mumbai");

select * from student;

insert into student (rollno,name,marks,grade,city) values
(107,"Karan",48,"C","KLO"),
(108,"Shyam",38,"D","gkp"),
(109,"Raj",75,"B","lko");



-- Concept of Keys
-- primary key
-- foreign key

create table emp(
id int ,
salary int default 25000
);


insert into emp (id) values(101);
select * from emp;

create table city (
id int primary key,
city varchar(20),
age int,
constraint age_check check (age>=18 AND city="delhi")
);

select * from city;
select distinct city from student;


create table newTable(
age int check(age>=18)
);

select * from newTable;


-- delete query

delete from student where rollno=108;

insert into student (rollno,name,marks,grade,city) values
(108,"Karan",48,"B","KLO");



select * from student;
select name , marks from student;
select city from student;
select distinct city from student;

-- =======================================================================================

-- Where Clause


select name from student where marks>80;
select * from student where marks>80;
select * from student where city = "mumbai";
select * from student where city = "KLD";
select * from student where marks>=97;
select * from student where marks>=80 and city="KLD";

-- Where Clause using Operators

select * from student where marks+10>90;
select * from student where marks=97;

select * from student where marks=97 or city="noida";

truncate table student;
select * from student;


-- BETWEEN operator
select * from student where marks between 80 and 90;

-- IN operator
select * from student where city in ("gkp","kld");

-- NOT operator
select * from student where city not in ("gkp","kld");

-- LIMIT Clause
select * from student where marks>75 limit 5;

#order by clause in ascending order or descending order

select * from student order by city asc;
select * from student order by marks asc;
select * from student order by marks desc;

select * from student order by marks desc;
select * from student order by marks desc limit 3;

-- =======================================================================================

-- aggreegate functions: aggreegate functions perform a calculation on a set of values , and return a single values.
/* Ex:  COUNT()
		MAX()
        MIN()
        SUM()
        AVG()
*/
        select marks from student;
		select max(marks) from student;
        select min(marks) from student;
        select avg(marks) from student;
        select sum(marks) from student;
        select count(name) from student;
        select max(city) from student;
        select min(city) from student;
        
-- Group by clause : Groups rows that have the same values into summary rows.
-- It collects data from multiple records and groups the result by one or more column.
-- generally we use group by Clause with some aggregate function.

select city from student group by city;


select city , count(name) from student group by city;

select city , name ,min(marks) from student group by name,city;

select city , avg(marks) from student group by city order by city;

select city , avg(marks) from student group by city order by avg(marks) desc;

select city from student group by city order by avg(marks);

create table customer (customer_id int not null primary key,
						customer varchar(15),mode varchar(20),city varchar(20));

show tables;
desc customer;

insert into customer values (101,"Ram","Netbanking","KLD"),
							(102,"Shyam","Credit Card","LKO"),
                            (103,"Mohan","Credit Card","BNZ"),
                            (104,"Aman","Netbanking","Noida"),
                            (105,"Akshay","Credit Card","KLD"),
                            (106,"Ritik","Debit Card","DEOS"),
                            (107,"Mukesh","Debit Card","Kushinagar"),
                            (108,"Abhi","Netbanking","Kusinagar"),
                            (109,"Harsh","Netbanking","Lucknow"),
                            (110,"Tushar","Credit Card","Mahmoodabad");
                            
select * from customer;

select mode from customer group by mode;
select mode,count(customer) from customer group by mode;
alter table customer rename payment;
show tables;
select * from payment;
select mode,count(customer) from payment group by mode;
select grade from student order by grade;
select grade from student group by grade;
select grade,count(name) from student group by grade;
select grade , count(rollno) from student group by grade order by grade;


-- truncate table student;
select * from student;


-- Having Clause: It is similar to where i.e. applies some condition on rows.
-- used when we want to apply any condition after grouping.
-- Q. count the number of students in each city where max marks cross 90;

select city, count(name) from student group by city;
select city, count(name) from student group by city having max(marks)>90;
select distinct city from student;
-- general order
select city,count(rollno) from student group by city having max(marks)>70;
select city FROM student group by City;
select city FROM student WHERE grade="A" GROUP BY city HAVING max(marks)>=63 ORDER BY city desc;

#General Order
/*
SELECT column(s)
FROM table_name
WHERE condition
GROUP BY column(s)
HAVING condition
ORDER BY column(s) ASC/DESC;
*/

-- Table related queries
-- Update operation

UPDATE student
SET grade="O"
WHERE grade="A";

SET SQL_SAFE_UPDATES=0;

select * from student;

update student set marks=22 where rollno=105;

update student set grade="C" where rollno=106;

update student set grade="E" where marks<50;

update student set marks=marks+1;
select * from student;

show databases;
show tables;
use college;


-- Delete related queries
DELETE FROM student WHERE marks < 50;

-- Revisiting Foregin Key

create table dept (
id int primary key,
name varchar(50)
);

insert into dept values(101,"English"),(102,"Hindi");
select * from dept;

update dept set id=111 where id=103;

-- Cascading for Foreign Keys 
-- On delete cascade
-- On update cascade

create table teacher (
id int primary key,
name varchar(50),
dept_id int,
foreign key (dept_id) references dept(id)
on delete cascade
on update cascade
);

drop table teacher;

insert into teacher values(101,"Ravi Prakash",101),(102,"Shivam",102);
select * from teacher;

SET SQL_SAFE_UPDATES=0;

-- Table Related Queries
-- ALTER ( to change the schema/attributes/column_name )
-- ADD Column : ALTER TABLE table_name ADD COLUMN column_name datatype constraint;
-- DROP Column : ALTER TABLE table_name DROP COLUMN column_name;
-- RENAME Table : ALTER TABLE table_name RENAME TO new_table_name;
-- CHANGE Column :ALTER TABLE table_name CHANGE COLUMN old_name new_name new_datatype new_constraint;
-- MODIFY Column: ALTER TABLE table_name MODIFY col_name new_datatype new_constraint;
-- DROP Column : ALTER TABLE Student drop column column_name;
-- TRUNCATE Table: Clear all the data of table but table is safe.
-- DROP : it deletes the table/database;

show databases;
use college;
show tables;
desc customer;
select * from customer;
select * from student;


-- ADD Column : ALTER TABLE table_name ADD COLUMN column_name datatype constraint;
alter table customer add column contact_no bigint(10);
select * from customer;

-- DROP Column : ALTER TABLE table_name DROP COLUMN column_name;
alter table customer drop column contact_no;
select * from customer;


alter table student add column age int not null default 19;
alter table student modify column age varchar(2);
select * from student;
insert into student(rollno,name,marks,age)values(110,"Raman",81,108);


alter table student change age stu_age int;
insert into student(rollno,name,marks,stu_age)values(111,"Raman",81,108);

-- DROP Column : ALTER TABLE Student drop column column_name;
-- Truncate command : truncate table table_name;
select rollno,name,char_length(name) as characters from student;

show tables;
select * from student;

alter table student change name Full_Name varchar(25);
alter table student rename column Full_Name to Student_Name;

DELETE FROM student
WHERE marks < 80;
truncate table student;

insert into student (rollno,Student_Name,marks,grade,city,stu_age) values
(101,"Ram",88,"A","KLD",20),
(102,"Shyam",93,"A","gkp",20),
(103,"Mohaam",84,"A","lko",21),
(104,"Monu",97,"A","bnz",19),
(105,"Shonu",11,"F","noida",25),
(106,"Daaku",75,"B","Mumbai",20),
(107,"Karan",48,"C","KLO",18),
(108,"Shyam",38,"D","gkp",23);

desc student;
select * from student;
alter table student drop column grade;


-- Joins in SQL: Join is used to combine rows from two or more tables,based on a related column between them.
-- Types of joins:Inner Join , Outer Join ( Left Join , Right Join , Full Join )
-- Inner Join: returns records that have matching values in both tables.
-- Syntax: select column(s) from tableA inner join tableB ON tableA.col_name=tableB.col_name;

show tables;
-- drop database college;
show databases;

create database college;
show databases;
use college;

create table student(
	id int primary key,
    name varchar(30));
show tables;
insert into student values(101,"Ravi Prakash"),(102,"Aman"),(103,"Gunnu");
select * from student;
select * from course;

create table course ( id int primary key,course varchar(50));
insert into course values(101,"English"),(105,"Maths"),(103,"Science"),(107,"Computer Science");
select * from course;

-- INNER JOIN:-
select * from student inner join course on student.id=course.id;
-- OR
select * from student as x inner join course as y on x.id=y.id;

-- LEFT JOIN :-
select * from student left join course on student.id=course.id;

-- RIGHT JOIN :-
select * from student right join course on student.id=course.id;

-- FULL JOIN :- In MySQL Full join does not works . another way we can use full join as UNION
select * from student as x left join course as y on x.id=y.id
UNION
select * from student as x right join course as y on x.id=y.id;

-- Ques. Write SQL Comands to display the right exclusive join.

select * from student as a left join course as b on a.id=b.id where b.id is null;
select * from student as a right join course as b on a.id = b.id where a.id is null;

-- Self Join : It is a regular join but the table is joined with itself.
-- Syntax: SELECT column(s) FROM table as a JOIN table as b ON a.col_name=b.col_name;

show tables;

create table employee (
	id int primary key,
    name varchar(20),
    manager_id int);
insert into employee values(101,"Alice",103),
	(102,"Bob",104),
    (103,"Jimmy",null),
    (104,"Allen",103);
select * from employee;

select * 
from employee as a 
join employee as b
on a.id=b.manager_id;

select a.name, b.name 
from employee as a
join employee as b
on a.id=b.manager_id;

select a.name as manager_name, b.name
from employee as a 
join employee as b
on a.id=b.manager_id;

-- UNION: It is used to combine the result-set of two or more SELECT statements.
-- gives UNIQUE value.It removes duplicate row/data.
-- To use it :
-- .Every SELECT should have same no of columns.
-- .column must have similar data types.
-- .column in every SELECT should be in same order.
-- Syntax: SELECT column from tableA UNION SELECT column from tableB;

select * from employee;
select name from employee
union 
select name from employee;

select name from employee
union all
select name from employee;

-- SQL Sub Queries :A subquery or inner query or a nested query is a query within another SQL query.
-- It involves 2 select statements.
-- Syntax: SELECT column(s) FROM table_name WHERE col_name operator (subquery );
-- There are three ways to write sub querise i.e. SSELECT,FROM,WHERE but WHERE are mostly used.
show tables;
select * from student;


create table student(rollno int(5),name varchar(30),marks int(5),city varchar(30));
insert into student values 
(101,"Ram",88,"Delhi"),
(102,"Shyam",93,"Pune"),
(103,"Mohaam",84,"Lucknow"),
(104,"Monu",97,"Khalilabad"),
(105,"Shonu",11,"Deoria"),
(106,"Daaku",75,"Gorakhpur"),
(107,"Karan",48,"Sahjanwa"),
(108,"Shyam",38,"Lucknow");
select * from student;

-- Ques. Get the name of all students who have scored more than class average
-- Step 1: Find the average of class.
-- Step 2: Finnd the names of students with marks > avg.
-- Ans:
select avg(marks) from student;
select rollno,name from student where marks>66.7500;

select name,marks from student where marks>(select avg(marks) from student);

-- Ques: Find the name of all students with even roll numbers.
-- Step 1: Find the even roll numbers.
-- Step 2: Find the names of students with even roll no.

SELECT rollno from student where rollno%2=0;
SELECT name, rollno from student where rollno in(102,104,106);
-- OR
SELECT name, rollno 
from student 
where rollno in(
		SELECT rollno
        FROM student
        WHERE rollno % 2 = 0);

-- Ques: Find thw max marks from the students of delhi .
-- Step 1: Find the students of delhi.
-- Step 2: Find their max marks using the sublist in step 1

alter table student add city varchar(50) after marks;
desc student;

select * from student;

alter table student drop column city;
use college;
show tables;
select * from skc;
drop table customer;

create table SKC(V_id int(3),V_name varchar(20),V_Contact_No bigint(10));
insert into skc values(102,"Ramu",9839029547),
					  (103,"Shyamu",8874542123),
                      (104,"Aman",7490542147),
                      (105,"Anil",7485451232),
                      (106,"Golu",8525654121);
select * from skc;
alter table skc add column address varchar(50);
update skc set address="KLD" where v_id=101;

SET SQL_SAFE_UPDATES=0;
update skc set address="KLD" where v_id=102;
update skc set address="NDLS";
desc skc;
select * from skc;
select * from student;
-- Ques: find the max marks from the student of Lucknow.
-- Step 1: find the student of lucknow.
-- Step 2: find their max marks using the sublist in step 1.
select max(marks) from student where city="Lucknow";
select max(marks) from(select * from student where city="Lucknow") as temp;

select( select max(marks) from student),name from student;
select max(marks) from student;

-- MySQL Views: A view is a virtual table based on the result-set of an SQL statement.
-- A View always shows up-to-date data.the database engine recreates the view,every time a user queries it.

create view view1 as
select rollno,name,marks from student;

select * from view1;
select * from view1 where marks>80;

drop view view1;

/*SQL INDEX : The CREATE INDEX statement is used to create indexes in tables.Indexes are used to retrieve data from the database more quickly than otherwise. The users cannot see the indexes, they are just used to speed up searches/queries.*/ 

-- Syntax : CREATE INDEX index_name ON table_name (column1, column2, ...);
-- Create UNIQUE INDEX Syntax:CREATE UNIQUE INDEX index_name ON table_name (column1, column2);

CREATE INDEX idx_lastname ON Persons (LastName);
CREATE INDEX idx_pname ON Persons (LastName, FirstName);

CREATE UNIQUE INDEX idx_pname ON Persons (LastName, FirstName);
-- DROP INDEX Statement
ALTER TABLE student DROP INDEX idx_rollno;