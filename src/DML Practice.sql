CREATE TABLE dmlDept
(
    DeptID INT PRIMARY KEY,
    DeptName VARCHAR(50)
);

CREATE TABLE EmployeeDml
(
    EmpID INT PRIMARY KEY,
    EmpName VARCHAR(50),
    Salary DECIMAL(10,2),
    DeptID INT,
    FOREIGN KEY (DeptID) REFERENCES dmlDept(DeptID)
);

INSERT INTO dmlDept
VALUES (1, 'HR');

INSERT INTO dmlDept
VALUES
(2, 'IT'),
(3, 'Finance'),
(4, 'Sales');

update dmlDept set DeptName= 'HR' where DeptID=2;

select * from dmlDept;

update dmlDept set DeptName=DeptName+'s';


