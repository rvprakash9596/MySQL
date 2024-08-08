show databases;
create database Organization;
show databases;
use organization;

create table worker (
					Worker_ID int not null primary key auto_increment,
                    First_Name varchar(25),
                    Last_Name varchar(25),
                    Salary int(15),
                    Joining_Date DATETIME,
                    Department varchar(15));
Show tables;
desc worker;
INSERT INTO WORKER VALUES(001,"Aman","Singh",100000,'2014-02-20 09:00:00',"HR"),
						 (002,"Ravi","Prakash",80000,'2014-06-11 09:00:00',"Admin"),
						 (003,"Vishal","Singhal",300000,'2014-02-20 09:00:00',"HR"),
                         (004,"Amitabh","Singh",500000,'2014-02-20 09:00:00',"Admin"),
                         (005,"Vivek","Bhati",500000,'2014-06-11 09:00:00',"Admin"),
                         (006,"Vipul","Diwan",200000,'2014-06-11 09:00:00',"Account"),
                         (007,"Satish","Kumar",75000,'2014-01-20 09:00:00',"Account"),
                         (008,"Geetika","Chauhan",90000,'2014-04-11 09:00:00',"Admin");
select * from worker;
create table bonus(
				Worker_Ref_ID int,
                Bonus_Amount int(10),
                Bonus_Date datetime,
                foreign key (Worker_Ref_ID) 
                references Worker(Worker_ID) on delete cascade);
)
Show tables;
desc bonus;
insert into bonus values(1,5000,'16-02-20'),
						(2,3000,'16-01-20'),
						(3,4000,'16-02-20'),
						(1,4500,'16-02-20'),
						(2,3500,'16-04-11');
select * from bonus;
create table Title(
					Worker_Ref_ID int,
                    Worker_Title varchar(20),
                    Affected_From datetime,
                    foreign key (Worker_Ref_ID)
                    references Worker(Worker_ID) on delete cascade
                    );
show tables;
desc title;
insert into title values(001, 'Manager', '2016-02-20 00:00:00'),
						(002, 'Executive', '2016-06-11 00:00:00'),
						(008, 'Executive', '2016-06-11 00:00:00'),
						(005, 'Manager', '2016-06-11 00:00:00'),
						(004, 'Asst. Manager', '2016-06-11 00:00:00'),
						(007, 'Executive', '2016-06-11 00:00:00'),
						(006, 'Lead', '2016-06-11 00:00:00'),
						(003, 'Lead', '2016-06-11 00:00:00');
select * from title;

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
SELECT * FROM worker WHERE department = "ADMIN";

-- Q-16.Write an SQL query to print details of the Workers whose FIRST_NAME contains ‘a’.
SELECT * FROM worker WHERE first_name LIKE '%a%';

-- Q-17. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘a’.
SELECT * FROM worker WHERE first_name LIKE '%a';

-- Q-18. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘h’ and contains six alphabets.
SELECT * FROM worker WHERE first_name LIKE '%h' AND LENGTH(first_name) = 7;

-- Q-19. Write an SQL query to print details of the Workers whose SALARY lies between 100000 and 500000.
SELECT * FROM worker WHERE salary BETWEEN 100000 AND 500000;

-- Q-20. Write an SQL query to print details of the Workers who have joined in Feb’2014.
SELECT * FROM worker WHERE joining_date BETWEEN "2014-02-01" AND "2014-02-29";

-- Q-21. Write an SQL query to fetch the count of employees working in the department ‘Admin’.
SELECT COUNT(*) as "Admin_Count" FROM worker WHERE department="Admin";

-- Q-22. Write an SQL query to fetch worker names with salaries >= 50000 and <= 100000.
SELECT CONCAT_WS(" ", first_name, last_name) as "worker_name", salary FROM worker WHERE salary BETWEEN 50000 AND 100000;

-- Q-23. Write an SQL query to fetch the no. of workers for each department in the descending order.
SELECT department, COUNT(department) as "count" FROM worker GROUP BY department ORDER BY count DESC;

-- Q-24. Write an SQL query to print details of the Workers who are also Managers.
SELECT worker_id, first_name, last_name, salary, joining_date, department, affected_from FROM worker INNER JOIN title on title.worker_ref_id = worker.worker_id AND title.worker_title = "Manager";

-- Q-25. Write an SQL query to fetch duplicate records having matching data in some fields of a table.
SELECT worker_title, affected_from, COUNT(*) as "count" FROM title GROUP BY worker_title, affected_from;

-- Q-26. Write an SQL query to show only odd rows from a table. 
SELECT * FROM worker WHERE worker_id % 2 = 1;

-- Q-27. Write an SQL query to show only even rows from a table.
SELECT * FROM worker WHERE worker_id % 2 = 0;

-- Q-28. Write an SQL query to clone a new table from another table.
CREATE TABLE IF NOT EXISTS worker_copy as SELECT worker_id, CONCAT_WS(" ", first_name, last_name) as 'worker_name', department FROM worker;
select * from worker_copy;
create table Worker_Clone like worker;
show tables;
select * from worker_clone;


-- Q-29. Write an SQL query to fetch intersecting records of two tables
SELECT worker_id, worker_name FROM worker_copy INNER JOIN bonus on bonus.worker_ref_id = worker_copy.worker_id;

-- Q-30. Write an SQL query to show records from one table that another table does not have.
SELECT * FROM worker WHERE worker_id  NOT IN (SELECT worker_ref_id FROM bonus);



-- Q-31. Write an SQL query to show the current date and time.
SELECT CURDATE() as "date", NOW() as "time";


-- 32. Write an SQL query to show the top n (salary 10) records of a table.
SELECT * FROM worker ORDER BY salary DESC LIMIT 5;

-- 33. Write an SQL query to determine the nth (say n=5) highest salary from a table
SELECT * FROM worker ORDER BY salary DESC LIMIT 4, 1;

-- 34. Write an SQL query to determine the 5th highest salary without using TOP or limit method.
SELECT * FROM worker w1 WHERE 4 = (SELECT COUNT( DISTINCT ( w2.salary ) ) FROM worker w2 WHERE w2.salary >= w1.salary);

-- 35. Write an SQL query to fetch the list of employees with the same salary.
SELECT DISTINCT W.worker_id, W.first_name, W.salary 
FROM worker W, worker W1 
WHERE W.salary = W1.salary 
AND W.worker_id != W1.worker_id;

-- 36. Write an SQL query to show the second highest salary from a table.
SELECT max(salary) FROM worker WHERE salary not in (SELECT max(salary) FROM worker);

-- 37. Write an SQL query to show one row twice in results from a table.
select first_name, department FROM worker W WHERE 
W.department='HR' 
union all 
select first_name, department FROM worker W1 WHERE 
W1.department='HR';


-- 38. Write an SQL query to fetch intersecting records of two tables
SELECT worker_id, first_name, last_name, worker_title, salary FROM worker INNER JOIN title ON worker_id = worker_ref_id;


-- 39.  Write an SQL query to fetch the first 50% records from a table.
SELECT *
FROM worker
WHERE worker_id <= (SELECT count(worker_id)/2 FROM worker);

-- 40. Write an SQL query to fetch the departments that have less than five people in it
SELECT department, COUNT(worker_id) as 'Number of Workers' 
FROM worker GROUP BY department HAVING COUNT(worker_id) < 5;

-- 41. Write an SQL query to show all departments along with the number of people in there.
SELECT department, COUNT(department) as 'Number of Workers'  FROM worker GROUP BY department;

-- 42.Write an SQL query to show the last record from a table.
SELECT * FROM worker WHERE worker_id = (SELECT max(worker_id)  FROM worker);

-- 43.Write an SQL query to fetch the first row of a table.
SELECT * FROM worker WHERE worker_id = (SELECT min(worker_id) FROM worker);

-- 44. Write an SQL query to fetch the last five records from a table.
SELECT * FROM worker WHERE worker_id <=5
UNION
SELECT * FROM (SELECT * FROM worker W ORDER BY W.worker_id 
DESC) AS W1 WHERE W1.worker_id <=5;

-- 45.  Write an SQL query to print the name of employees having the highest salary in each department.

SELECT t.department,t.first_name,t.salary FROM(SELECT 
max(salary) as TotalSalary,department FROM worker GROUP BY 
department) as TempNew 
Inner Join worker t on TempNew.department=t.department 
AND TempNew.TotalSalary=t.salary;

-- 46. Write an SQL query to fetch three max salaries from a table.
SELECT DISTINCT salary FROM worker a WHERE 3 >= (SELECT 
count(DISTINCT salary) FROM worker b WHERE a.salary <= 
b.salary) ORDER BY a.salary desc;

-- 47. Write an SQL query to fetch three min salaries from a table.
SELECT DISTINCT salary FROM worker a WHERE 3 >= (SELECT COUNT(DISTINCT salary) FROM worker b WHERE a.salary >= b.salary) ORDER BY a.salary desc;

-- 48. Write an SQL query to fetch nth max salaries from a table
SELECT DISTINCT salary FROM worker a WHERE 3 >= (SELECT COUNT(DISTINCT salary) FROM worker b WHERE a.salary >= b.salary) ORDER BY a.salary desc;

-- 49. Write an SQL query to fetch departments along with the total salaries paid for each of them.
SELECT department, sum(salary) FROM worker GROUP BY department;

-- 50. Write an SQL query to fetch the names of workers who earn the highest salary.
SELECT first_name, salary FROM worker WHERE salary=(SELECT max(salary) FROM worker);