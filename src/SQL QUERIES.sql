CREATE TABLE Emp
(
    EmpID INT PRIMARY KEY,
    EmpName VARCHAR(50),
    Gender CHAR(1),
    Age INT,
    Department VARCHAR(30),
    Salary DECIMAL(10,2),
    City VARCHAR(30),
    JoiningDate DATE
);

INSERT INTO Emp
VALUES
(101,'Sona','F',22,'IT',65000,'Hosur','2024-01-15'),
(102,'Anitha','F',25,'HR',55000,'Chennai','2023-06-10'),
(103,'Kamali','F',23,'Finance',60000,'Bangalore','2022-08-20'),
(104,'Jaya','F',27,'IT',72000,'Coimbatore','2021-03-18'),
(105,'Dharshini','F',24,'Sales',50000,'Salem','2024-02-01'),
(106,'Muskan','F',26,'HR',68000,'Hyderabad','2022-11-12'),
(107,'Madhu','F',28,'Finance',75000,'Madurai','2020-09-25'),
(108,'Vaani','F',23,'IT',62000,'Trichy','2023-07-05');

select * from emp where age <>23;

--Count employees in each department and sort by highest count.
select Department , count(*) from emp 
    group by department order by count(*) desc;

-- Find the highest salary in each city and sort from highest to lowest.
select city,max(salary) from emp group by city order by max(salary) desc;

--Count employees by city and gender.
select city,gender,count(*) from emp group by city,gender ;


--Display departments having more than 2 employees
select department ,count(*) from emp group by department having count(*)>2;

select department ,avg(salary) from emp 
    group by department having avg(salary) between 60000 and 70000;


------------UPDATE ----------------


--Update the salary of employee with EmpID = 101 to 70000.
update emp set salary=7000 where empid=101

--Increase the salary of all IT employees by 5000.
update emp set salary=salary+5000 where department='it'

--Increase the salary of all HR employees by 10%.
update emp set salary=salary*1.10 where department='HR';

--Increase salary by 15% for employees aged above 25.
update emp set salary=salary*1.10 where age>25;


---TRANSACTIONS FOR SAFETY------

BEGIN TRANSACTION;

delete from emp where department='hr';
select * from emp;
rollback;

--Add a new column.
alter table emp add mobno varchar(50);

--ALTER COLUMN (Modify Data Type)
alter table emp
    alter column mobno bigint;

--DROP COLUMN
alter table emp drop column mobno;

--Rename a Column
EXEC sp_rename 'Emp.EmpName', 'EmployeeName', 'COLUMN';

--practice
alter table emp add designation varchar(50);

alter table emp
    alter column designation varchar(100);

alter table emp drop column designation;

alter table emp add pincode int;

---Add PRIMARY KEY
ALTER TABLE Emp
ADD PRIMARY KEY(EmpID);