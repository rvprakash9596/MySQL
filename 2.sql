-- create database college;

-- create table student (
-- Roll_No int primary key,
-- Name varchar(20) );

-- show tables;
-- desc student;

-- select * from student;

-- insert into student values(101,"Ramu"),(102,"Chacha");
-- insert into student (Roll_no , name ) values (103,"Shyam");

-- create database xyz;
-- use xyz;
-- create table employee (id int primary key, 
-- 	name varchar(20) , 
--     salary float);

-- insert into employee values(1,"Ravi ",35000),(2,"Sonu ",45000),(3,"Mote ",65000);
-- select * from employee;
--  select * from employee;

-- create table temp1( id int unique);
-- insert into temp1 values(101);
-- insert into temp1 values(101);


-- create table temp2( id int , salary int default 25000);
-- insert into temp2 (id)  values (101); 
-- select * from temp2;
-- drop database xyz;

create database college;
use college;

create table student (
rollno int primary key,
name varchar(50),
marks int not null ,
grade varchar(1),
city varchar(20)
);

insert into student (rollno,name,marks,grade,city) values
(101,"Ram",78,"C","KLD"),
(102,"Shyam",93,"O","gkp"),
(103,"Mohaam",84,"B","lko"),
(104,"Monu",97,"O","bnz"),
(105,"Shonu",11,"F","noida"),
(106,"Daaku",75,"B","Mumbai");

insert into student (rollno,name,marks,grade,city) values
(107,"Karan",48,"E","KLO"),
(108,"Shyam",38,"E","gkp"),
(109,"Raj",75,"B","lko");

delete from student where rollno=108;

insert into student (rollno,name,marks,grade,city) values
(108,"Karan",48,"B","KLO");



select * from student;
select name , marks from student;
select city from student;
select distinct city from student;

select name from student where marks>80;
select * from student where marks>80;
select * from student where city = "mumbai";
select * from student where city = "KLD";
select * from student where marks>=97;
select * from student where marks>=80 and city="KLD";
select * from student where marks+10>90;
select * from student where marks=97;

select * from student where marks=97 or city="noida";
truncate table student;
select * from student;

select * from student where marks between 80 and 90;

select * from student where city in ("gkp","kld");
select * from student where city not in ("gkp","kld");
select * from student where marks>75 limit 3;

#order by clause in ascending order or descending order

select * from student order by city asc;
select * from student order by marks asc;
select * from student order by marks desc;

select * from student order by marks desc limit 3;


-- aggreegate functions: aggreegate functions perform a calculation on a set of values , and return a single values.
/* Ex: COUNT()
		MAX()
        MIN()
        SUM()
        AVG()*/
        select marks from student;
		select max(marks) from student;
        select min(marks) from student;
        select avg(marks) from student;
        select sum(marks) from student;
        select count(name) from student;
        
-- Group by clause : Groups rows that have the same values into summary rows.
-- It collects data from multiple records and groups the result by one or more column.
-- generally we use group by with some aggregate function.

select city from student group by city;
select city , count(name) from student group by city;
select city , name ,count(rollno) from student group by name,city;
select city , avg(marks) from student group by city;
select city , avg(marks) from student group by city order by avg(marks) desc;
select city from student group by city order by avg(marks);

create table customer (customer_id int not null primary key,customer varchar(15),mode varchar(20),city varchar(20));
show tables;
desc customer;
insert into customer values(101,"Ram","Netbanking","KLD"),
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
select city from student where grade="A" group by city having max(marks)>=63 order by city desc;
-- Table related queries
-- Update operation

UPDATE student
SET grade="O"
WHERE grade="A";

SET SQL_SAFE_UPDATES=0;

select * from student;

update student set marks=82 where rollno=106;

update student set grade="C" where rollno=106;

update student set grade="E" where marks<50;

update student set marks=marks+1;