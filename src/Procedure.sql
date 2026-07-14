CREATE TABLE Empp
(
    EmpID INT PRIMARY KEY,
    EmpName VARCHAR(50),
    Salary DECIMAL(10,2),
    DeptID INT
);

INSERT INTO Empp
VALUES
(101,'Sona',65000,1),
(102,'Anitha',55000,2),
(103,'Kamali',60000,1),
(104,'Jaya',72000,3),
(105,'Madhu',50000,NULL),
(106,'Muskan',68000,2),
(107,'Vaani',62000,6);

create procedure p1
as 
begin 
	select * from empp;
end;

create procedure p2
@deptid int
as 
begin 
	select * from empp where deptid=@deptid;
end;
exec p2 2;


create procedure p3
@empid int
as
begin 
    if exists (select * from empp where empid=@empid)
        begin 
            select * from empp where empid=@empid
        end
    else
        begin 
            print 'employee not found'
        end
end;

exec p3 101;