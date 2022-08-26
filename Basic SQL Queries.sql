-- Creating database
create database Student_Details;
show databases;
use Student_Details;
show tables;

-- Creating tables
create table Student_Table 
(
StudentID int NOT NULL AUTO_INCREMENT,
Student_Name varchar(255),
Phone_Number varchar(255),
Address varchar(255),
Department varchar(255),
Gender char(1),
Marks float,
Start_Date Date,
city varchar(255),
PRIMARY KEY (StudentID)
);
 desc Student_Table;
 
insert into Student_Table (Student_Name, Phone_Number,Address, Department, Gender, Marks, Start_Date, city) values ("Jeevan", "9876543210", "Bhadrak", "Engg", "M", '455.0','2022-04-05', "Bhadrak");
insert into Student_Table (Student_Name, Phone_Number,Address, Department, Gender, Marks, Start_Date, city) values ('Adesh', '1234567890','Solapur','Engg', 'M', '358.0', '2022-03-02', 'Pune');


select * from Student_Table;
delete from Student_Table where StudentID = '1';

select * from Student_Table where Student_Name = 'Jeevan';

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- /
select Marks as Marks from Student_Table; 

alter table Student_Table rename column Marks to Marks;
create table Marks as select StudentID,Student_Name,Marks from Student_Table;
describe Marks;
select * from Marks;

update Student_Table set Marks = '350.0' where Student_Name = 'Adesh';

/*Group by,sum,count,avg,min,max*/
select sum(Marks) from Student_Table where Gender = 'F' group by Gender;
select sum(Marks) from Student_Table where Gender = 'M' group by Gender;

select count(*) from Student_Table where Gender = 'F';
select count(*) from Student_Table where Gender = 'M';

select count(*) from Student_Table group by Gender;

select avg(Marks) from Student_Table where Gender = 'M' group by Gender;
select avg(Marks) from Student_Table where Gender = 'F' group by Gender;

select min(Marks) from Student_Table where Gender = 'M' group by Gender;
select max(Marks) from Student_Table where Gender = 'M' group by Gender;

select min(Marks) from Student_Table where Gender = 'F' group by Gender;
select max(Marks) from Student_Table where Gender = 'F' group by Gender;

select * from Student_Table order by Marks desc;
select * from Student_Table order by Marks asc;
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- /
select * from Student_Table;
SELECT * FROM Student_Table WHERE Start_Date = '2022-03-02'; -- > <

create view view1 as select Student_Name , Department from Student_Table where city = "Pune";
select * from view1;

select * from Student_Table where NOT city = "Nagpur";

select * from Student_Table limit 3;

select * from Student_Table where Student_Name LIKE 'A%';
select * from Student_Table where Student_Name LIKE '%a';
select * from Student_Table where Student_Name LIKE '%ur%';
select * from Student_Table where Student_Name LIKE '_n%';
select * from Student_Table where Student_Name LIKE 'k__%';
select * from Student_Table where Student_Name LIKE 'A%h';
select * from Student_Table where Student_Name NOT LIKE 'A%';

select * from Student_Table where city in ('Pune','Mumbai');
select * from Student_Table where Marks between 350.0 AND 410.0;

select StudentID as Id, Student_Name as Name from Student_Table;
select * from Student_Table;

create table Orders(OrderId int Not Null, CustomerId int, OrderDate date);
create table Customers(CustomerId int Not Null, CustomerName varchar(255), country varchar(255),Mobile varchar(10));

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- /
SELECT * FROM Student_Details.Orders;
insert into Orders(OrderId,CustomerId,OrderDate) values('10308','2','2021-03-09');
insert into Orders(OrderId,CustomerId,OrderDate) values('10309','37','2022-05-05');
insert into Orders(OrderId,CustomerId,OrderDate) values('10310','77','2022-02-03');

/*Union - Combines the result-set of two or more select stmt */
SELECT OrderID FROM Orders UNION SELECT CustomerName FROM Customers;


SELECT * FROM Student_Details.Customers;
use Student_Details;

insert into Customers(CustomerId,CustomerName,country,Mobile) values('1','Jeevan','America','9098456560');
insert into Customers(CustomerId,CustomerName,country,Mobile) values('2','Adesh','India','9098789560');
insert into Customers(CustomerId,CustomerName,country,Mobile) values('3','Sinu','India','9098781234');

/*Inner Join ==> Return matching values from both table*/
SELECT Orders.OrderID, Customers.CustomerName, Orders.OrderDate FROM Orders 
INNER JOIN Customers ON Orders.CustomerID=Customers.CustomerID;

/*Left Join == Returns all records from left table and mathcing from the right table*/
SELECT Orders.OrderID, Customers.CustomerName, Orders.OrderDate FROM Orders 
LEFT JOIN Customers ON Orders.CustomerID=Customers.CustomerID;

/*Right Join == Returns all records from right table and mathcing from the left table*/
SELECT Orders.OrderID, Customers.CustomerName, Orders.OrderDate FROM Orders 
Right JOIN Customers ON Orders.CustomerID=Customers.CustomerID;

/*Cross Join == Returns all records from both tables*/
SELECT Orders.OrderID, Customers.CustomerName, Orders.OrderDate FROM Orders 
CROSS JOIN Customers ON Orders.CustomerID=Customers.CustomerID;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- /

/* Indexes */
create index byCity on Student_Table(StudentID, Student_Name, city);
select * from byCity;
ALTER TABLE Student_Table DROP INDEX byCity;
show indexes from Student_Table;