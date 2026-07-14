CREATE TABLE Emp3
(
    EmpID INT PRIMARY KEY,
    EmpName VARCHAR(50),
    Salary DECIMAL(10,2),
    DeptID INT
);

INSERT INTO Emp3
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

CREATE VIEW empv as
    select * from Emp3;

select * from empv;

create view v11 as 
    select * from Emp3 where salary >60000;

alter view v11 as
select empname from emp3 where salary>60000;

select * from v11;

drop view v11;