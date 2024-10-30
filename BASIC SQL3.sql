use employee_details

select * from dbo.EMPLOYEES

select * into #1 from dbo.EMPLOYEES

select * from #1


#update_values

update #1 
set DEPARTMENT = 'HR'
where DEPARTMENT is null

select * from #1

update #1 
set SALARY =56000,HIREDATE = '2023-08-23'
where EMPLOYEEID = 14

select * from #1

select * into #2 from dbo.EMPLOYEES

select * from #2

update #2
set DEPARTMENT='finance'

select * from #2


select * from dbo.EMPLOYEES

select * into #3 from dbo.EMPLOYEES

delete from #3 
where LASTNAME ='' or DEPARTMENT = 'null'


select * from #3

select * into #4 from dbo.EMPLOYEES

select * from #4

delete from #4


select * from #3

truncate table #3


drop table #3


--Delete records from the certain table
--if we will use delete withour where condition,all records from the table will be deleted,
--but the table structure remains intact

--Truncate-delete all the records from the table but the structure of the table remains intact

--Drop-all the records will be deleted plus table structure will also be removed


--Hi we are learning MS SQL SERVER

SELECT * FROM DBO.EMPLOYEES


/* HI
WE 
ARE 
LEARNING
SQL
SERVER
*/
select * from dbo.EMPLOYEESRECORDS


select * from EMPLOYEES

--top N from employees

select top 2 * from employees
where DEPARTMENT = 'HR'

SELECT TOP 4 Firstname,lastname from dbo.EMPLOYEES

CREATE DATABASE [SALES DATABASE]

USE [SALES DATABASE]

-- Creating a table with more columns, including a varchar column
CREATE TABLE dbo.Sales (
    ProductID INT,
    SaleDate DATE,
    Quantity INT,
    TotalAmount DECIMAL(10, 2),
    CustomerID INT,
    StoreID INT,
    SalespersonID INT,
    PaymentMethod VARCHAR(50)  -- New varchar column for payment method
);

-- Inserting more sample data (10 records), including NULL values
INSERT INTO dbo.Sales (ProductID, SaleDate, Quantity, TotalAmount, CustomerID, StoreID, SalespersonID, PaymentMethod)
VALUES 
(1, '2023-08-01', 10, 200.00, 101, 1, 201, 'Credit Card'),
(2, '2023-08-01', 5, 150.00, 102, 1, 202, 'Cash'),
(1, '2023-08-02', 8, 160.00, 103, 2, 203, 'Credit Card'),
(2, '2023-08-02', 7, 210.00, 104, 2, 204, 'Cash'),
(1, '2023-08-03', 6, 120.00, 105, 1, 201, NULL),              -- NULL value in PaymentMethod
(3, '2023-08-04', 12, 300.00, 106, 3, 205, 'Credit Card'),
(1, '2023-08-04', 5, 100.00, 107, 3, 206, 'Debit Card'),
(2, '2023-08-05', 9, 270.00, 108, 1, 202, NULL),              -- NULL value in PaymentMethod
(3, '2023-08-05', 15, 375.00, 109, 3, 207, 'Cash'),
(1, '2023-08-06', 7, 140.00, 110, 2, 203, 'Credit Card');

SELECT * FROM Sales

SELECT MAX(TOTALAMOUNT) AS MAX_AMOUNT FROM SALES

SELECT MAX(SALEDATE) AS MAX_SALESDATE FROM DBO.Sales

SELECT MAX(PAYMENTMETHOD) AS MAX_PAYAMOUNT  FROM DBO.Sales


--MAXIMUM QUALITY SOLD FOR EACH PRODUCTID

select productid,
max(quantity) as max_quantity
from dbo.sales
group by ProductID

select * from dbo.sales

--maximum total amount for all distinct dates in saledate column

select saledate,
max(totalamount) as max_amount
from dbo.sales
group by saledate

select min(quantity) from dbo.sales

select * from dbo.Sales

select paymentmethod,
min(totalamount) as min_amount,
max(totalamount) as max_amount,
avg(totalamount) as avg_amount,
count(totalamount) as count_amount
from dbo.Sales
group by PaymentMethod

select storeid,
min(totalamount) as min_amount from dbo.sales
group by storeid

select * from dbo.Sales

select 
sum(quantity) as total_quantity
from dbo.Sales

select sum(quantity),
sum(totalamount) 
from dbo.Sales


select 
avg(quantity) as avg_quantity,
avg(totalamount) as avg_totalamount
from 
dbo.sales

--sum of quantity,
--sum of total amount,
--avg of quantity,
--avg of total amount for each distinct product

select 
ProductID,
sum(quantity) as total_quantity,
sum(totalamount) as total_amount,
avg(quantity) as average_quantity,
avg(totalamount) as average_amount
from dbo.sales
group by productid

select * from dbo.Sales

--sum of quantity ,sum of amount
--avg of quantity, avg of amount
--for distinct combination of producid and store id

select 
productid,
storeid,
sum(quantity)[TOTAL QUANTITY],
sum(totalamount) [SUM OF AMOUNT],
avg(quantity) [AVERAGE OF QUANTITY],
avg(totalamount) [TOTAL AMOUNT]
from dbo.Sales
group by ProductID,StoreID

SELECT * FROM DBO.Sales

SELECT COUNT(PAYMENTMETHOD) [NO OF REC]
FROM DBO.Sales

SELECT COUNT(DISTINCT PRODUCTID) [DISCTINCT PRODUCTS]
FROM DBO.Sales

SELECT PAYMENTMETHOD,
COUNT(DISTINCT PAYMENTMETHOD) [DISCTINT PAY MODE]
FROM DBO.Sales
GROUP BY PaymentMethod

SELECT Paymentmethod,
count(*) [pay mode]
from dbo.Sales
group by PaymentMethod

select paymentmethod,
sum(totalamount) [sum of sales]
from dbo.sales
group by PaymentMethod

select ProductID,PaymentMethod,
sum(totalamount) [sum of sales]
from dbo.sales
group by productid,PaymentMethod
order by ProductID

select * from dbo.sales
--total sales,avg sales,total quantity,
--avg quantity for each distinct product


select 
productid,
sum(totalamount) [sum of sales],
sum(quantity) [total qunatity],
avg(totalamount) [avg amount],
avg(quantity) [avg quantity]
from dbo.sales
group by ProductID
having sum(totalamount) < 700
and sum(quantity) =21

--where vs having

select * from sales
where totalamount>190


select productid,
sum(totalamount) [sum of sales]
from dbo.sales
group by ProductID
having sum(totalamount)<700

select productid,
sum(totalamount) [sum of sales]
from dbo.sales
where totalamount>130
group by ProductID
having sum(totalamount)>500
order by  productid 