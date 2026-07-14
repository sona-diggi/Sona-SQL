CREATE TABLE Dep1
(
    DeptID INT PRIMARY KEY,
    DeptName VARCHAR(30)
);

INSERT INTO Dep1
VALUES
(1,'IT'),
(2,'HR'),
(3,'Finance'),
(4,'Sales'),
(5,'Marketing');

CREATE TABLE Emp1
(
    EmpID INT PRIMARY KEY,
    EmpName VARCHAR(50),
    Salary DECIMAL(10,2),
    DeptID INT
);

INSERT INTO Emp1
VALUES
(101,'Sona',65000,1),
(102,'Anitha',55000,2),
(103,'Kamali',60000,1),
(104,'Jaya',72000,3),
(105,'Madhu',50000,NULL),
(106,'Muskan',68000,2),
(107,'Vaani',62000,6);


--Find employees earning more than the average salary

select empname ,salary from emp1
    where salary>
    (select avg(salary) from emp1)


--Display employees whose salary is equal to the lowest salary.
select empname,salary from emp1 
    where salary =
    (select max(salary) from emp1);

--Display employees working in the same department as Sona
select empname from emp1 
    where deptid=
    (select deptid from emp1 where empname='sona')


    ---------MULTIPLE ROW SUBQUERY---------


    --IN
--Display employees working in departments
--that exist in the Department table.
select empname from emp1
    where deptid in
    (select DeptID from dep1);


--Display employees working in IT or HR
select empname from emp1
    where deptid in 
    (select deptid from Dep1 where deptname in ('it','hr'))

--correlated subquery

--Find employees earning more than
--the average salary of their own department

select a.empname,a.salary,a.deptid
    from Emp1 a where a.salary>
    (
    select avg(b.salary) from Emp1 b where a.deptid=b.DeptID
    );


--Display employees earning more than ANY employee in HR.
select empname,salary from Emp1 where salary > any 
  (   
    select salary from Emp1 where deptid=
    (
    select deptid from Dep1 where Deptname='hr' 
    )
  )

--Display employees earning 
--more than the average salary of their own department
select a.empname,a.salary from Emp1 a 
    where a.salary>
    (
    select avg(b.salary) from Emp1 b
        where a.DeptID=b.DeptID
    );
    
---practice---

--Display the names of departments that do not have any employees.
select d.deptname from Dep1 d where not exists(
select 1 from Emp1 e where e.DeptID=d.deptid
)


--Display the employee name and salary of employees who earn
--more than any employee in the Finance department.
select empname,salary from emp1 where Salary > any
(
  select salary from Emp1 where DeptID=
 (
    select deptid from Dep1 where deptname='finance'
 )
);