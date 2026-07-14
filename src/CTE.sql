CREATE TABLE Emp2
(
    EmpID INT PRIMARY KEY,
    EmpName VARCHAR(50),
    Salary DECIMAL(10,2),
    DeptID INT
);

INSERT INTO Emp2
VALUES
(101,'Sona',65000,1),
(102,'Anitha',55000,2),
(103,'Kamali',60000,1),
(104,'Jaya',72000,3),
(105,'Madhu',50000,NULL),
(106,'Muskan',68000,2),
(107,'Vaani',62000,6);

CREATE TABLE Dep2
(
    DeptID INT PRIMARY KEY,
    DeptName VARCHAR(30)
);

INSERT INTO Dep2
VALUES
(1,'IT'),
(2,'HR'),
(3,'Finance'),
(4,'Sales'),
(5,'Marketing');

--------------------------------------------------
---Create a CTE that stores
---all employees from the Emp1 table and display all records.

with empview as
(
select * from emp2
)
select *  from empview;

---Create a CTE that stores employees earning 
---more than 60000 and display their names and salaries.
with empsal as
( 
select * from emp2 where salary>60000
)
select * from empsal;



--Create a CTE that stores employees belonging to the IT department 
--and display all their details.
with Itemp as
(
select * from emp2 where deptid=
 (
 select deptid from dep2 where deptname='it')
)
select * from Itemp;
