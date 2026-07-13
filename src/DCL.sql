create login sonaSlogin with password='sona@123';
create user sona for login sonaSlogin;
create user pooja for login sonaSlogin;


create user vijilakshmi for login sonaSlogin;


grant select on Employee to sona;
grant update on Employee to pooja;

revoke update on Employee from pooja;

CREATE DATABASE COMPANYDB;

CREATE TABLE Employee
(
    EmpID INT PRIMARY KEY,
    EmpName VARCHAR(50),
    Salary DECIMAL(10,2)
);