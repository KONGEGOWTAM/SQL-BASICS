

-- Create the Products table
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(50),
    Category VARCHAR(20),
    Price DECIMAL(10, 2),
    StockQuantity INT,
    Supplier VARCHAR(50),
    Rating DECIMAL(3, 1)
);

-- Insert data into the Products table
INSERT INTO Products (ProductID, ProductName, Category, Price, StockQuantity, Supplier, Rating) VALUES
(1, 'Wireless Mouse', 'Electronics', 25.99, 150, 'Tech Supplies', 4.5),
(2, 'Office Chair', 'Furniture', 120.00, 85, 'Comfort Co', 4.7),
(3, 'Water Bottle', 'Accessories', 15.00, 250, 'AquaGear', 4.3),
(4, 'Laptop Backpack', 'Accessories', 45.99, 200, 'GearUp', 4.6),
(5, 'Gaming Laptop', 'Electronics', 999.99, 45, 'Tech Supplies', 4.8),
(6, 'Desk Lamp', 'Furniture', 35.00, 120, 'LightHouse', 4.2),
(7, 'Bluetooth Speaker', 'Electronics', 59.99, 95, 'SoundWave', 4.4),
(8, 'Standing Desk', 'Furniture', 250.00, 50, 'Comfort Co', 4.9),
(9, 'Fitness Tracker', 'Electronics', 129.99, 180, 'FitTech', 4.7),
(10, 'Coffee Mug', 'Accessories', 9.99, 300, 'MugMasters', 4.1);


select * from Products

--example1: add a column to categorize each product into categories
--high,medium and low

select * ,
case
when price  > 500 then 'high'
when price  <= 500 and price >= 200 then 'medium'
else 'low'
end as [high/mediu/low]
from products

--------------------------------

--example2:
--provide priority to each category & sort the data according to that priority

select  * from Products
order by
case
when Category in ('electronics') then 1
when category in ('furniture') then 2
else 3
end
-------------------------------test
select  * from Products
order by
case
when Category in ('electronics') then 1
when category in ('furniture') then 2
when Category = 'Accessories' then 3
end

--------------------------
select * from Products

--we need to group the data based on column category & price into different categories 
--i.e affordable and premium

select *,
case
    when Category = 'electronics' then 
	case when price >= 300 then 'premium electronics'
	else 'affordable electronics'
	end
  when category = 'furniture' then
    case when price >= 250 then 'premium furniture'
	else 'affordable furniture'
	end
 else 
    case when price >= 25 then 'premium accessories'
	else 'affordable accessories'
	end
end as [Groups]
from Products

----------------test

select *,
case 
when category = 'electronics' then
case when price >= 300 then 'premium electronics'
else 'affordable electronics'
end
when Category = 'furniture' then
case when price >= 250 then 'premium furniture'
else 'affordable furniture'
end
when Category in ('accessories') then
case when price >= 25 then 'premium accessories'
else 'affordable accessories'
end
end as [groups]
from Products

--create a table 


create database Student 

create table student (
Student_Name nvarchar(256),
Gender char(1),
Age tinyint,
Event_date date,
Distance decimal(5,2))

--drop table student



insert into student 
(Student_Name,Gender,Age,Event_date,Distance)
Values ('RAJ MAHERA','M',25,'2024-03-23',123.87)

insert into student
values ('nitin singh','M',32,'2023-09-8',345.23)

insert into student
values
('harish','m',29,'2024-12-28',136.98),
('Girish','m',24,'2025-12-28',111.98),
('Gopal','m',23,'2024-4-28',176.98),
('Harini','F',25,'2022-12-28',134.98)

SELECT * FROM INFORMATION_SCHEMA.COLUMNS
where table_name like 'student'

insert into student
(student_name,gender)
values
('rudhav','F')
select * from student

-------------------------

insert into student
(Age,Event_date)
values
(34,'2023-09-25'),
(43,'2019-01-01'),
(23,'2022-02-12')


---coping data from existing table to new table

--case 1: The new tab simply doesn't exist
--case 2: The new table structure/new table exists

--case 1:
select * from dbo.sales

select * into new_tabel_1 from dbo.Sales

--This statement will result in the creation of
--new_table_1 which will be having structure & records both
--same as that of dbo.sales table

select * from new_tabel_1

----certain columns to be copied

drop table new_tabel_1

select * from Sales

select productid,quantity  into new_table_1 from dbo.Sales

select * from new_table_1

-- case 2: new table structure/table already exists

select top 0 * into new_table_2 from dbo.Sales

select * from new_table_2

insert into new_table_2 select * from dbo.Sales


-----copying certain columns

select * into new_table_3 from dbo.Sales where 1=0

select * from new_table_3

insert into new_table_3 
(ProductID,SaleDate) select productid,saledate from dbo.Sales

select * from new_table_3


CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    email VARCHAR(100)
);



CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    amount DECIMAL(10, 2),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);



-- Insert data into Customers table
INSERT INTO Customers (customer_id, customer_name, email)
VALUES 
(1, 'Alice Smith', 'alice@example.com'),
(2, 'Bob Johnson', 'bob@example.com'),
(3, 'Charlie Brown', 'charlie@example.com');

-- Insert data into Orders table
INSERT INTO Orders (order_id, customer_id, order_date, amount)
VALUES 
(101, 1, '2024-07-15', 250.00),
(102, 1, '2024-08-05', 300.00),
(103, 2, '2024-08-10', 150.00),
(104, 3, '2024-06-25', 100.00);


select * from customers

select * from Orders

select * from customers
where customer_id in
( select distinct customer_id from orders
where order_date between 
'2024-08-01' and '2024-08-31'
)

select * from Customers
where customer_id in
( select distinct customer_id from orders where
order_date not between '2024-08-01' and '2024-08-31')

--constraints 
--conditions that can be applied on columns of a table and 
--these conditions are to be followed while inserting records into the table

--not null constraint
 create database constraints

 use constraints

 --case 1: we will have to create a new table

 create table test_not_null
 (EID int not null,
 age tinyint ,
 firstname varchar(256)
 )
 select * from test_not_null

 select * from INFORMATION_SCHEMA.columns
 where TABLE_NAME like 'test_not_null'

 insert into test_not_null
 values (1,23,'kiran')

 insert into test_not_null
 values (null,23,'kiran')

 insert into test_not_null
 values (2,null,'raj')

 --case2: the table already exists
--we want to make firstname column nullable

alter table test_not_null
alter column firstname varchar(256)
not null

insert into test_not_null
values (2,34,null)

select * from test_not_null

--unique constrainst
-- it ensures that a column consists of unique values
--case1: when the table already exists



--case2: we need to create the table

create table test_unique
(sid int unique,
age tinyint not null,
firstname varchar(256) not null unique,
lastname varchar(256) 
)
select * from test_unique

insert into test_unique
values (1,22,'kiran','sakary')

insert into test_unique
values (1,24,'rohit','jujare')

insert into test_unique
values (null,34,'akhilesh','jain')

select * from test_unique

insert into test_unique
values (null,43,'purnima','gaikwad')

truncate table test_unique

insert into test_unique values (null,54,'nitin','singh')
insert into test_unique values (1, 34,'praveen','singh')

alter table test_unique
add unique (lastname)

--check constraint
--it checks for certain condition that can be applied on the column
--of a table, if this condition is not fullfilled we will not be able to into the table

--case1: Table doesn't exist
create table test_check
(EID INT,
FIRSTNAME VARCHAR(256),
AGE TINYINT CHECK(AGE>=18)
)
SELECT * FROM test_check

INSERT INTO test_check
VALUES 
(1,'MAYAK','20')

INSERT INTO test_check
VALUES 
(0,'NAYAK','18')

--CASE 2: TABLE EXISTS
ALTER TABLE TEST_CHECK
ADD CHECK(EID>0)

--DEFAULT CONSTRAINTS
--THIS CONSTRAINT TO PROVIDE DEFAULT VALUES TO COLUMNS

--CASE 1: THE TABLE DOES NOT EXIST

create table test_default
(EID INT NOT NULL,
STUDENTNAME VARCHAR(256) NOT NULL,
COLLEGE VARCHAR(256) DEFAULT 'AASC',
)

SELECT * FROM test_default

INSERT INTO test_default VALUES
(1,'VEVIK','AASC'),
(2,'DHANUSH',''),
(3,'NIHAL','')

ALTER TABLE TEST_DEFAULT
ADD DEFAULT 'AASC' FOR COLLEGE

--PRIMARY AND FOREIGN KEY

create table test_PK_1
(EID INT PRIMARY KEY,
GENDER CHAR(1),
AGE TINYINT,
FIRSTNAME VARCHAR(256)
)

INSERT INTO test_PK_1 VALUES
(1,'M',23,'NIHAL'),
(2,'M',24,'CHITTI')

SELECT * FROM test_PK_1

INSERT INTO test_PK_1
VALUES (1,'F',25,'PRIYA'

INSERT INTO TEST_PK_1 VALUES (NULL,'M',23,'RAJ')

--CASE 2: TABLE ALREADY EXISTS

TRUNCATE TABLE TEST_PK_1


ALTER TABLE TEST_PK_1
ADD PRIMARY KEY (AGE)


CREATE TABLE TEST_PK_2
(SID INT,
FIRSTNAME NVARCHAR(256),
AGE TINYINT
)

ALTER TABLE TEST_PK_2
ADD PRIMARY KEY(SID,AGE)

DROP TABLE TEST_PK_2

CREATE TABLE TEST_PK_2
( SID INT NOT NULL UNIQUE,
FIRSTNAME NVARCHAR(256),
AGE TINYINT NOT NULL
)
ALTER TABLE TEST_PK_2
ADD PRIMARY KEY (SID, AGE)

--FOREIGN KEY CONSTRAINT

--CASE 1: WHEN THE NEW TABLE HAS TO BE CREATED
CREATE TABLE TEST_PRIMARY_KEY
(ID INT PRIMARY KEY,
NAME VARCHAR (256)
)
insert into test_primary_key values
(1, 'mayank'),
(2,'raj'),
(3,'jayant')


select * from TEST_PRIMARY_KEY

create table test_pk
(ID INT FOREIGN KEY REFERENCES TEST_PRIMARY_KEY(ID),
COURSE VARCHAR(256)
)

