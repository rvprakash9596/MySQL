show databases;
create database Inventory_System;
use Inventory_System;
create table CLIENT_MASTER(
							Client_No int(5) primary key not null,
							Name varchar(15),
                            City varchar(15),
                            Pin_Code int(6),
                            State varchar(20),
                            Bal_Due float(8,2));
                            
create table Product_Master(
							Product_Number int(10) not null primary key,
                            Description varchar(50),
                            Profit_Percent float(3,2),
                            Unit_Measure int(8),
                            Qty_Onhand int(8),
                            Sell_Price int(8),
                            Cost_Price int(8));

create table Salseman_Master(
							Salesman_No int(8) primary key not null,
                            Address varchar(20),
                            City varchar(20),
                            Pin_Code int(6),
                            State varchar(20),
                            Salary_AMT float(8,2),
                            Target_Get bool,
                            Remark varchar(50));
                                                        
show tables;

desc CLIENT_MASTER;
desc Product_Master;
desc Salseman_Master;

insert into CLIENT_MASTER values (101,"Ritik","Deoria",274301,"UP",7800),
								 (102,"Aman","Hauz Khas",274741,"Delhi",8000),
                                 (103,"Suraj","Mumbai",224301,"Maharashtra",9000),
                                 (104,"Ravi Prakash","Khalilabad",272164,"UP",25000),
                                 (105,"Mukesh","Khalilabad",224308,"UP",15500),
                                 (106,"Ramu","Pune",225501,"Maharashtra",18000),
                                 (107,"Sanoj","Allahabad",214301,"Rudrapur",15000),
                                 (108,"Sanjay","Basti",214301,"UP",18000),
                                 (109,"Safiq","Lucknow",227301,"UP",18000),
                                 (110,"Akshay","Bangluru",454301,"Telengana",18000),
                                 (111,"Tushar","Hyderabad",214501,"Pune",20000),
                                 (112,"Harsh","Nainital",244301,"UP",21000),
                                 (113,"Saurabh","Noida",222301,"Delhi",28000),
                                 (114,"Monu","Mumbai",224301,"Maharashtra",150),
                                 (115,"Akash","Mumbai",224401,"Maharashtra",2100),
                                 (116,"Abhinandan","Kushinagar",221301,"UP",1540);
                                 
insert into Product_Master values   (1, " Sweet Tooth", 10.00, 10, 100, 100.00, 90.00),
									(2, "Cake Shop", 20.00, 200, 200, 200.00, 180.00),
									(3, " Bread Box", 10.00, 300, 300, 300.00, 270.00),
									(4, "Rice", 11.00, 400, 400, 400.00, 360.00),
									(5, "Cooking oil", 15.20, 50, 500, 500.00, 450.00),
									(6, "Sugar", 10.00, 600, 600, 600.00, 540.00),
									(7, "Salt", 18.00, 70, 700, 700.00, 630.00),
									(8, " Turmeric", 18.00, 80, 800, 800.00, 720.00),
									(9, "Tea leaves", 19.00, 90, 900, 900.00, 810.00),
									(10, "Coffee", 25.00, 15, 1000, 1000.00, 900.00),
									(11, "Milk", 35.00, 11, 1100, 1100.00, 990.00),
									(12, "Biscuits", 40.00, 60, 1200, 1200.00, 1080.00),
									(13, "Cornflakes", 36.00, 130, 1300, 1300.00, 1170.00),
									(14, "Pasta", 12.00, 25, 1400, 1400.00, 1260.00),
									(15, "Noodles", 8.00, 45, 1500, 1500.00, 1350.00);