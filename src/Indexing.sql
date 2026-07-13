CREATE TABLE Employee_ind
(
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(100),
    Email VARCHAR(100),
    Salary DECIMAL(10,2)
);

insert into Employee_ind 
values(1,'sona','sona@gmail.com',100),
(2,'mona','mona@gmail.com',200),
(4,'aona','aona@gmail.com',300),
(3,'bona','bona@gmail.com',400);

select * from Employee_ind;

CREATE INDEX IX_EmployeeName
ON Employee_ind(EmployeeName);

