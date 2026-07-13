create table constraint_practice(
e_id int primary key,
e_name varchar(10) not null,
e_age int check (e_age>0),
e_email varchar(20) unique,
ph_no bigint unique, salary decimal default 10000.00,
joining_date date default getdate()
);

insert into constraint_practice(
e_id,e_name,e_age,e_email,ph_no
)
values(1,'sona',21,'sona2gmail.com',0838402402),
	  (2,'sona1',22,'sona12gmail.com',1838402402),
	  (3,'sona2',23,'sona223gmail.com',2838402402),
	  (4,'sona3',24,'sona2000gmail.com',5838402402);


select * from constraint_practice;