CREATE TABLE EmployeeAggr
(
    EmpID INT PRIMARY KEY,
    EmpName VARCHAR(50),
    Gender VARCHAR(10),
    Department VARCHAR(30),
    Salary DECIMAL(10,2),
    Age INT,
    City VARCHAR(30)
);

INSERT INTO EmployeeAggr
VALUES
(101,'sona','Male','HR',50000,25,'Chennai'),
(102,'Alice','Female','IT',65000,28,'Bangalore'),
(103,'Bob','Male','IT',45000,24,'Chennai'),
(104,'Dad','Male','Finance',70000,35,'Hyderabad'),
(105,'Sara','Female','HR',55000,27,'Bangalore'),
(106,'Tom','Male','IT',40000,22,'Chennai'),
(107,'Emma','Female','Finance',80000,32,'Mumbai'),
(108,'Coco','Male','Sales',48000,29,'Chennai'),
(109,'Sophia','Female','Sales',52000,31,'Hyderabad'),
(110,'James','Male','HR',60000,30,'Mumbai');

select count(EmpName) as count_of_employee from EmployeeAggr;

--Count employees in each department.
select department,count(*) as 'count' from EmployeeAggr group by department;

--Find the total salary of each department
select department,sum(salary) from EmployeeAggr group by department;

--Find the total salary of employees
--whose salary is greater than 50000, grouped by department
select department, sum(salary) from EmployeeAggr 
where Salary>50000 group by department;


-- Find the highest salary of male employees in each department.
select department, max(salary) from EmployeeAggr
where gender='male' group by department order by salary desc offset 1 rows;

select avg(salary) as 'avg_salary' from EmployeeAggr where department='HR'

--second highest salary

select max(salary) as "secHighest" from EmployeeAggr where salary<(select max(salary) from EmployeeAggr );

--Display departments having more than 2 employees.

    select department, count(*) from EmployeeAggr group by department having count(*)>2;