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