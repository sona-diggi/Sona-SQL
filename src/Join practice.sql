CREATE TABLE Depo_practice
(
    DeptID INT PRIMARY KEY,
    DeptName VARCHAR(30),
    Location VARCHAR(30)
);

INSERT INTO Depo_practice
VALUES
(1,'IT','Bangalore'),
(2,'HR','Chennai'),
(3,'Finance','Hyderabad'),
(4,'Sales','Mumbai'),
(5,'Marketing','Pune');

CREATE TABLE Emp_practice
(
    EmpID INT PRIMARY KEY,
    EmpName VARCHAR(50),
    Gender CHAR(1),
    Age INT,
    Salary DECIMAL(10,2),
    DeptID INT,
    ManagerID INT
);

INSERT INTO Emp_practice
VALUES
(101,'Sona','F',22,65000,1,NULL),
(102,'Anitha','F',25,55000,2,101),
(103,'Kamali','F',23,60000,1,101),
(104,'Jaya','F',27,72000,3,102),
(105,'Madhu','F',24,50000,NULL,102),
(106,'Muskan','F',26,68000,2,103),
(107,'Vaani','F',23,62000,6,104),
(108,'Priya','F',29,80000,3,101),
(109,'Rahul','M',30,90000,4,108),
(110,'Karthik','M',28,75000,NULL,108);

--Count employees in each department
select d.deptname,count(e.empid)
    from Depo_practice d left join Emp_practice e   
    on d.DeptID=e.DeptID group by d.Deptname;

--Display departments whose maximum salary is greater than 70000
select d.deptname,max(e.salary)
    from Depo_practice d inner join Emp_practice e 
    on d.DeptID=e.DeptID 
    group by d.DeptName having max(e.salary)>70000

--Count employees under each manager

select m.empname as manager ,count(e.empid) as employee_count 
    from Emp_practice m inner join Emp_practice e
    on e.ManagerID=m.EmpID
    group by m.Empname;

--Find employees without a department
select e.empname 
    from Emp_practice e left join Depo_practice d 
    on e.DeptID=d.DeptID where d.DeptName is null;

--Count employees under each manager
select m.empname as manager,count(e.empid)
    from Emp_practice m left join Emp_practice e 
    on m.EmpID=e.ManagerID group by m.empname;

--Display the employee name, salary, and department name 
--for employee whose salary is greater than 65000.
select e.empname , e.salary,d.deptname from Emp_practice e inner join Depo_practice d 
on e.DeptID=d.DeptID where salary>65000;

--Display all departments along with the number of employees in each department, 
--including departments that have zero employees.

select d.deptname,count(e.empid) as total_emp
    from Depo_practice d left join Emp_practice e 
    on d.DeptID=e.DeptID group by d.Deptname;

--Display the names of employees who do not belong to any department.

select e.empname 
    from Emp_practice e left join Depo_practice d 
    on e.DeptID=d.DeptID where d.DeptName is null;


--Display the manager name and the number of employees
--under each manager, but show only managers 
--who manage at least 2 employees.
select m.empname as manager, count(e.empid) as no_ofemp
    from Emp_practice m  inner join Emp_practice e
    on e.ManagerID=m.EmpID group by m.EmpName having count(e.empid)>1
    ok

--Display the manager name and the number of employees 
--under each manager, 
--but show only managers who manage at least 2 employees.

select e.empname as employee, m.empname as manager 
    from Emp_practice e left join Emp_practice m 
    on e.ManagerID=m.EmpID;

