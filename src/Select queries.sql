CREATE TABLE Employeez
(
    EmpID INT PRIMARY KEY,
    EmpName VARCHAR(50),
    Salary DECIMAL(10,2),
    DeptID INT
);

INSERT INTO Employeez
VALUES
(101,'sona',50000,1),
(102,'Ana',65000,2),
(103,'Babi',45000,2),
(104,'Dad',70000,3),
(105,'Sam',55000,1),
(106,'Tom',40000,2),
(107,'Sara',80000,3);

INSERT INTO Employeez
VALUES 
(108,'sona',50000,1);

SELECT * FROM Employeez where EmpId>104;

SELECT * FROM Employeez order by EmpName Desc ;


select EmpId from Employeez order by EmpId offset 2 rows;

select EmpId from Employeez 
    order by EmpId 
    offset 2 rows 
    fetch next 2 rows only;

select Distinct EmpName from Employeez;

select * from Employeez where EmpName like 'sona';
select * from Employeez where EmpName like 's___';
select * from Employeez where EmpName like '%a';
select * from Employeez where EmpName like 'a%';    
select * from Employeez where EmpID between 101 and 105;
select * from Employeez where EmpName in ('ana','shek');