create database employee_details


use employee_details

CREATE TABLE EMPLOYEES
(EMPLOYEEID INT PRIMARY KEY,
FIRSTNAME VARCHAR(50),
LASTNAME VARCHAR(50),
DEPARTMENT VARCHAR(50),
SALARY DECIMAL (10,2),
HIREDATE  DATE
);

INSERT INTO EMPLOYEES (EMPLOYEEID,FIRSTNAME,LASTNAME,DEPARTMENT,SALARY,HIREDATE)
VALUES
(1,'JOHN','DOE','HR',50000.00, '2020-01-15'),
(2,'JANE','SMITH','FINANCE',60000.00, '2022-01-15'),
(3,'ALICE','JOHNSON','IT',44000.00, '2021-01-15'),
(4,'BOB','BROWN','MARKETING',45000.00, '2024-01-15'),
(5,'CHARLIE','DAVIS','PR',60000.00, '2023-01-15')

SELECT * FROM EMPLOYEES

SELECT FIRSTNAME,LASTNAME FROM EMPLOYEES

SELECT * FROM EMPLOYEES
WHERE DEPARTMENT='IT'

SELECT EMPLOYEEID,FIRSTNAME+' '+LASTNAME AS FULLNAME 
FROM EMPLOYEES


INSERT INTO EMPLOYEES (EMPLOYEEID,FIRSTNAME,LASTNAME,DEPARTMENT,SALARY,HIREDATE)
VALUES
(6,'JOHN','DOE','PR',70000.00, '2020-06-6'),
(7,'JANE','SMITH','HR',60000.00, '2022-05-7'),
(8,'ALICE','JOHNSON','DA',54000.00, '2021-07-23'),
(9,'BOB','BROWN','SALES',55000.00, '2024-07-4'),
(10,'CHARLIE','DAVIS','IT',50000.00, '2023-01-26')


SELECT * FROM EMPLOYEES
SELECT * FROM EMPLOYEES 
WHERE DEPARTMENT= 'IT'

SELECT DISTINCT * FROM EMPLOYEES

SELECT DISTINCT DEPARTMENT FROM EMPLOYEES


SELECT * INTO #TEMP1
FROM [dbo].[EMPLOYEES]

select * from #TEMP1

select * from EMPLOYEES
where EMPLOYEEID = 2

select employeeid ,firstname from EMPLOYEES
where EMPLOYEEID = 2

select * from EMPLOYEES
where SALARY>50000

select * from EMPLOYEES
where SALARY<50000

select distinct * from EMPLOYEES
where DEPARTMENT IN ('HR','IT')


select  * from EMPLOYEES
where DEPARTMENT IN ('HR','IT')


SELECT * FROM EMPLOYEES
ORDER BY SALARY DESC




SELECT * FROM EMPLOYEES
ORDER BY HIREDATE 

SELECT * FROM EMPLOYEES
ORDER BY FIRSTNAME ASC,
SALARY DESC

SELECT DEPARTMENT,SALARY FROM EMPLOYEES
ORDER BY DEPARTMENT ASC,
SALARY DESC

SELECT * FROM EMPLOYEES
WHERE DEPARTMENT = 'HR' OR DEPARTMENT = 'IT'


SELECT * FROM DBO.EMPLOYEES
WHERE( DEPARTMENT = 'HR' OR 
DEPARTMENT ='IT')
AND SALARY >50000

SELECT * FROM DBO.EMPLOYEES
WHERE NOT FIRSTNAME = 'JOHN' 
AND NOT SALARY = 60000


SELECT * FROM EMPLOYEES
WHERE SALARY  BETWEEN 40000 AND 50000 

SELECT * FROM EMPLOYEES
WHERE SALARY>60000 

SELECT * FROM EMPLOYEES
WHERE NOT SALARY<60000

SELECT * FROM EMPLOYEES
WHERE SALARY>=60000


SELECT * FROM EMPLOYEES
WHERE DEPARTMENT ='HR' OR DEPARTMENT = 'IT'

SELECT * FROM EMPLOYEES
WHERE DEPARTMENT IN ('HR','IT') AND 
SALARY >50000

SELECT * FROM EMPLOYEES
WHERE DEPARTMENT NOT IN( 'HR','IT')
AND SALARY<50000


INSERT INTO DBO.EMPLOYEES
(EMPLOYEEID,FIRSTNAME,LASTNAME,DEPARTMENT,SALARY,HIREDATE)
VALUES
(13,'RAJ','AMBANI','QA',52000,'2022-04-22')

INSERT INTO DBO.EMPLOYEES
(EMPLOYEEID,FIRSTNAME,LASTNAME)
VALUES (14,'ROHIT','JUJARE')

SELECT * FROM DBO.EMPLOYEES


INSERT INTO DBO.EMPLOYEES
VALUES 
(11,'RAJESH','ADARI','ACCOUNTS',40000,'2022-08-30')

SELECT * FROM DBO.EMPLOYEES

SELECT * FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'EMPLOYEES'

SELECT * FROM DBO.EMPLOYEES

INSERT INTO DBO.EMPLOYEES
VALUES 
(12,'ROHIT','','HR',45000,'2021-07-24')

SELECT * FROM 
DBO.EMPLOYEES
WHERE DEPARTMENT IS NULL

SELECT * FROM DBO.EMPLOYEES
WHERE DEPARTMENT IS NOT NULL

use employee_details

select * from dbo.employees



