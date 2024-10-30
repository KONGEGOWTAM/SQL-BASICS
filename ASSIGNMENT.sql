

--ASSIGNMENT 1 SQL

--Step 1) Create Table
CREATE TABLE EmployeeSales (
    SaleID INT PRIMARY KEY,
    EmployeeID INT,
    Department VARCHAR(50),
    SaleAmount DECIMAL(10, 2),
    SaleDate DATE
);

--Step 2) Insert records into the table
INSERT INTO EmployeeSales (SaleID, EmployeeID, Department, SaleAmount, SaleDate)
VALUES 
(1, 101, 'Electronics', 500.00, '2023-08-01'),
(2, 102, 'Electronics', 300.00, '2023-08-03'),
(3, 101, 'Furniture', 150.00, '2023-08-02'),
(4, 103, 'Electronics', 250.00, '2023-08-04'),
(5, 104, 'Furniture', 200.00, '2023-08-02'),
(6, 101, 'Furniture', 450.00, '2023-08-05'),
(7, 102, 'Electronics', 700.00, '2023-08-05'),
(8, 103, 'Furniture', 100.00, '2023-08-06');

SELECT * FROM EmployeeSales

--1.Write a query to calculate the total sales amount for each department in the EmployeeSales table.
SELECT DEPARTMENT,
SUM(SALEAMOUNT) [SUM OF SALES] FROM EmployeeSales
GROUP BY DEPARTMENT
--2.Write a query to count the number of sales made by each employee.
SELECT EMPLOYEEID,
COUNT(SALEAMOUNT) [ COUNT OF EMP] FROM EmployeeSales
GROUP BY EmployeeID

--3.Write a query to calculate the average sale amount for each department.
SELECT Department,
AVG(SALEAMOUNT) [AVG OF SALEAMOUNT] FROM EmployeeSales
GROUP BY Department
--4.Write a query to find the total sales amount for each employee, but only include employees who have made more than one sale.
SELECT EMPLOYEEID,
COUNT(SALEAMOUNT) [ TOTAL  SALES]
FROM EmployeeSales
GROUP BY EmployeeID
HAVING COUNT (*) > 1
--5.Write a query to find the total sales for each month in 2023.

SELECT 
    MONTH(saledate) AS [MONTH],
    SUM(saleamount) AS total_sales
FROM EmployeeSales
WHERE YEAR(saledate) = 2023
GROUP BY MONTH(saledate)
ORDER BY MONTH(saledate);

--Assignment 2

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName NVARCHAR(50),
    LastName NVARCHAR(50),
    Email NVARCHAR(100) UNIQUE,
    DepartmentID INT,
    HireDate DATE,
    Salary DECIMAL(10, 2)
);

INSERT INTO Employees (EmployeeID, FirstName, LastName, Email, DepartmentID, HireDate, Salary)
VALUES 
(1, 'John', 'Smith', 'john.smith@example.com', 101, '2021-06-15', 75000.00),
(2, 'Jane', 'Doe', 'jane.doe@example.com', 102, '2020-03-10', 85000.00),
(3, 'Michael', 'Johnson', 'michael.johnson@example.com', 101, '2019-11-22', 95000.00),
(4, 'Emily', 'Davis', 'emily.davis@example.com', 103, '2022-01-05', 68000.00),
(5, 'William', 'Brown', 'william.brown@example.com', 102, '2018-07-19', 80000.00);


--1.Write a SQL query to find the names of employees who have a salary higher than the average salary of all employees.

select * from Employees


SELECT FIRSTNAME,LASTNAME,Salary
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);


--2.Write a SQL query to list the employee names and their departments for employees who were hired after the oldest employee in the company.

SELECT FIRSTNAME,LASTNAME, DepartmentID,HireDate
FROM employees
WHERE HireDate > (SELECT MIN(HireDate) FROM employees);


--3.Write a SQL query to find the details of the employee(s) with the highest salary.

SELECT *
FROM employees
WHERE salary = (SELECT MAX(salary) FROM employees);

--4.Write a SQL query to find the names of employees who work in the same department as 'John Smith'.

SELECT FirstName,LastName,departmentid from Employees
WHERE DepartmentID = (SELECT DepartmentID FROM Employees WHERE
FirstName ='JOHN')

--5.Write a SQL query to find the names of employees who do not belong to the department with the highest average salary.

SELECT * FROM Employees WHERE
Salary <>
(select max(salary) [MAX SALARY] from Employees) 


--Assignment 3 

--1.Write a SQL query to find the names of employees whose first names start with the letter 'J'.

select * from Employees
where FirstName like 'j%'

--2.Write a SQL query to find the names of employees whose last names end with the letter 'n'.

select * from Employees
where LastName like '%n'

--3.Write a SQL query to find the email addresses of employees that contain the word "john".

select * from Employees
where EMAIL LIKE 'john%'

--4.Write a SQL query to find the names of employees whose first names have exactly 5 characters.

select * from Employees
where FirstName like '_____'

--5.Write a SQL query to find the names of employees whose last names contain the letter 'a' as the second character.

select * from Employees
where lastname like '_a%'

use [dbo].[Employees]

-- Creating the Employees table
CREATE TABLE Employeesr (
    EmployeeID INT PRIMARY KEY,
    FirstName NVARCHAR(50),
    LastName NVARCHAR(50),
    Email NVARCHAR(100) UNIQUE,
    DepartmentID INT,
    HireDate DATE,
    Salary DECIMAL(10, 2)
);

-- Creating the Departments table
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName NVARCHAR(100)
);

-- Inserting data into the Employees table
INSERT INTO Employeesr (EmployeeID, FirstName, LastName, Email, DepartmentID, HireDate, Salary)
VALUES 
(1, 'John', 'Smith', 'john.smith@example.com', 101, '2021-06-15', 75000.00),
(2, 'Jane', 'Doe', 'jane.doe@example.com', 102, '2020-03-10', 85000.00),
(3, 'Michael', 'Johnson', 'michael.johnson@example.com', 101, '2019-11-22', 95000.00),
(4, 'Emily', 'Davis', 'emily.davis@example.com', 103, '2022-01-05', 68000.00),
(5, 'William', 'Brown', 'william.brown@example.com', 102, '2018-07-19', 80000.00);


-- Inserting data into the Departments table
INSERT INTO Departments (DepartmentID, DepartmentName)
VALUES
(101, 'Human Resources'),
(102, 'Finance'),
(103, 'IT');

select * from Employeesr
select * from  Departments


--1.Write a SQL query to list the names of employees along with the names of the departments they work in.
select FirstName,LastName,DepartmentName from Employeesr [E]
left join
Departments [D]
on
E.DepartmentID = D.DepartmentID


--2.Write a SQL query to list all the departments and the employees working in them, including departments with no employees.

SELECT DEPARTMENTNAME,COUNT(DEPARTMENTNAME) AS [DEPARTMENT] FROM Employeesr [E]
 JOIN
Departments [D]
ON
E.Departmentid = D.DepartmentID
GROUP BY DepartmentName

--3.Write a SQL query to find the names of employees who do not belong to any department (i.e., no matching department ID).

SELECT 
    *
FROM 
    Employeesr [E]
LEFT JOIN 
   Departments [D]
ON 
   E.DepartmentID = D.DepartmentID
WHERE 
    D.DepartmentID IS NULL





--4.Write a SQL query to list the names of employees who work in the same department as 'Jane Doe'.

SELECT FIRSTNAME,LASTNAME,DepartmentName FROM Employeesr
INNER JOIN
Departments
ON
Employeesr .DepartmentID = Departments.DepartmentID
WHERE DepartmentName = 'FINANCE'

--5.Write a SQL query to find the department with the highest total salary paid to its employees.

SELECT TOP DepartmentName,MAX(Salary) [MAX SALARY] FROM Employeesr
INNER JOIN
Departments
ON 
Employeesr.DepartmentID = Departments.DepartmentID
GROUP BY DepartmentName
ORDER BY [MAX SALARY] DESC


--1.Write a SQL query to select all columns and rows from the Employees table.

SELECT * FROM Employeesr

--2.Write a SQL query to find the names and email addresses of all employees who work in the department with DepartmentID = 101.

select E.DepartmentID, E.firstname,E.lastname,E.email,D.DepartmentName FROM Employeesr [E]
inner join
Departments [D]
on 
E.DepartmentID = D.DepartmentID
WHERE E.DepartmentID = 101

--3.Write a SQL query to find the total number of employees in the Employees table.

SELECT COUNT(FirstName) [COUNT] FROM Employeesr

--4.Write a SQL query to find the details of employees who were hired in the year 2020.

SELECT * FROM Employeesr
WHERE YEAR(HireDate) = 2020

--5.Write a SQL query to update the salary of 'Jane Doe' to 90,000.


UPDATE Employeesr
SET SALARY = 90000
WHERE FIRSTNAME = 'JANE' AND LASTNAME = 'DOE';

