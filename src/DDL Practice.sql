create table department(
Dept_id int primary key,dept_name varchar(20)
);

create table employee(
empid int,
emp_name varchar(20),
age int,
salary decimal(10,2),
dept_id int);

EXEC sp_help 'dbo.employee';

--ALTER

alter table employee add phno bigint; 
alter table employee alter column phno int;
alter table employee drop column phno;

select * from employee;

exec sp_rename 'employee' , 'employees'
exec sp_rename 'employee.empid' ,'emp_id', 'column' 

alter table employee add primary key(empid); 
exec sp_rename 'employees','employee'


create table t1(id int identity(1,1),name varchar(20));
insert into t1 values('a'),('b'),('v');
select * from t1;