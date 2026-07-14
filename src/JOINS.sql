CREATE TABLE Dep
(
    DeptID INT PRIMARY KEY,
    DeptName VARCHAR(30)
);

INSERT INTO Dep
VALUES
(1,'IT'),
(2,'HR'),
(3,'Finance'),
(4,'Sales'),
(5,'Marketing');

CREATE TABLE Empl
(
    EmpID INT PRIMARY KEY,
    EmpName VARCHAR(50),
    Salary DECIMAL(10,2),
    DeptID INT
);

INSERT INTO Empl
VALUES
(101,'Sona',65000,1),
(102,'Anitha',55000,2),
(103,'Kamali',60000,1),
(104,'Jaya',72000,3),
(105,'Madhu',50000,NULL),
(106,'Muskan',68000,2),
(107,'Vaani',62000,6);

--------------INNER JOIN--------------------

select e.empname ,d.deptname 
    from empl e inner join dep d   
    on e.deptid=d.deptid;

--Display all employee details along with department name
select e.* ,d.deptname
    from empl e inner join dep d   
    on e.deptid=d.deptid

--Display employees working in the IT department
select e.empname ,d.deptname 
    from empl e inner join dep d 
    on e.deptid=d.deptid 
    where d.deptname='IT';

--Display employees earning more than 60000
select d.deptname,count(*) as employee_count
    from empl e inner join dep d    
    on e.deptid=d.deptid
    group by d.deptname

--------------LEFT JOIN--------------
--Find employees without a department
select e.empname    
    from empl e left join dep d on e.deptid=d.deptid
    where d.deptname is null;

--Count employees in each department
select d.deptname,count(E.EMPID) 
    from dep d left join empl e     
    on e.deptid=d.deptid 
    group by d.deptname;

-------------RIGHT JOIN----------------
SELECT *
FROM Empl E
RIGHT JOIN Dep D
ON E.DeptID =D.DeptID;


---------FULL OUTER JOIN-------------
select e.empname, D.deptname   
    from empl e full outer join dep d on e.deptid=d.deptid

--------CROSS JOIN--------------
CREATE TABLE Size
(
    SizeID INT PRIMARY KEY,
    SizeName VARCHAR(10)
);

INSERT INTO Size
VALUES
(1,'S'),
(2,'M'),
(3,'L'),
(4,'XL');

CREATE TABLE Color
(
    ColorID INT PRIMARY KEY,
    ColorName VARCHAR(20)
);

INSERT INTO Color
VALUES
(1,'Red'),
(2,'Blue'),
(3,'Black');

SELECT *
FROM Size
CROSS JOIN Color;


------SELF JOIN

CREATE TABLE Employe
(
    EmpID INT PRIMARY KEY,
    EmpName VARCHAR(50),
    ManagerID INT
);

INSERT INTO Employe
VALUES
(101,'Sona',NULL),
(102,'Anitha',101),
(103,'Kamali',101),
(104,'Jaya',102),
(105,'Madhu',102),
(106,'Muskan',103),
(107,'Vaani',104);

select e.empname as employee, m.empname as manager
    from employe e inner join employe m
    on e.managerid=m.empid;