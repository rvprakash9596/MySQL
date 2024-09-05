show databases;

create database Techpile;

show databases;

use techpile;

create table tbl_b1(
rollno smallint primary key,
name varchar(50) not null,
mobno bigint,
email varchar(100),
password int,
tfee int
);

show tables;
desc tbl_b1;

insert into tbl_b1 value
(1,"Ravi Prakash",9839029547,"ravi@gmail.com",12345,4500),
(2,"Sanjay Chauhan",9874587412,"sanjay@gmail.com",12457,5500),
(3,"Prahlad Cha",8745784144,"prahlad@gmail.com",12457,4800);

select * from tbl_b1;

create table tbl_Address(
id int primary key auto_increment,
addr text,
city varchar(100),
pincode int,
userid smallint,
foreign key (userid) references tbl_b1(rollno)
);

desc tbl_address;

create table tbl_fee(
sr int primary key auto_increment,
amount int,
date datetime,
mode varchar(20),
userid smallint,
foreign key(userid) references tbl_b1(rollno)
);

desc tbl_fee;
-- =======================================================================================================


create table tbl_department
(
sr int primary key auto_increment,
name varchar (100) not null,
seat int,
hod varchar(100)
);

show tables;
desc tbl_department;

insert into tbl_department values(3,"Civil Engg",80,"Mr Rohit Kumar");

select * from tbl_department;

create table tbl_student(
name varchar(50) not null,
emailid varchar(50) primary key,
password varchar(10),
tfee int,
department int ,
foreign key(department) references tbl_department(sr)
);

desc tbl_student;

insert into tbl_student values (
"Shabbir Ansari","shabbir12@gmail.com","babu#123",45000,1
);

select * from tbl_student;
select * from tbl_department;