create table EMPLOYEE (
	EMPLOYEE_ID int PRIMARY KEY NOT NULL,
    FIRST_NAME varchar(255),
	LAST_NAME varchar(255),
    SALARY int,
    JOINING_DATE date,	
    DEPARTMENT varchar(255),
    MANAGER_ID int
);

insert into EMPLOYEE values (1, 'John', 'Abraham', 1000000, '1987-06-01', 'Banking', NULL);
insert into EMPLOYEE values (2, 'Michael', 'Clarke', 800000, '1987-07-02', 'Insurance', 1);
insert into EMPLOYEE values (3, 'Roy', 'Thomas', 700000, '1999-05-03', 'Banking', 1);
insert into EMPLOYEE values (4, 'Tom', 'Jose', 600000, '1990-06-02', 'Insurance', 2);
insert into EMPLOYEE values (5, 'Jerry', 'Pinto', 650000, '1985-06-02', 'Insurance', 3);
insert into EMPLOYEE values (6, 'Philip', 'Mathew', 750000, '1990-10-20', 'Services', 3);
insert into EMPLOYEE values (7, 'TestName1', '123', 650000, '1991-11-21', 'Services', 2);
insert into EMPLOYEE values (8, 'TestName2', 'Lname%', 600000, '1992-12-22', 'Insurance', 2);

create table INCENTIVE (
	EMPLOYEE_REF_ID int, 
    INCENTIVE_DATE date,
    INCENTIVE_AMOUNT int,
    FOREIGN KEY (EMPLOYEE_REF_ID) references EMPLOYEE(EMPLOYEE_ID)
);
insert into INCENTIVE values (1, '2013-02-01', 5000);
insert into INCENTIVE values (2, '2013-02-01', 3000);
insert into INCENTIVE values (3, '2013-02-01', 4000);
insert into INCENTIVE values (1, '2013-01-13', 4500);
insert into INCENTIVE values (2, '2013-01-13', 3500);
select * from EMPLOYEE;
select * from INCENTIVE;

SELECT DATEDIFF(i.INCENTIVE_DATE, e.JOINING_DATE) as datediff FROM EMPLOYEE e JOIN INCENTIVE i ON e.EMPLOYEE_ID = i.EMPLOYEE_REF_ID;
SELECT e.FIRST_NAME, i.INCENTIVE_AMOUNT FROM EMPLOYEE e JOIN INCENTIVE i ON e.EMPLOYEE_ID = i.EMPLOYEE_REF_ID where i.INCENTIVE_AMOUNT > 3000;
SELECT e.FIRST_NAME, i.INCENTIVE_AMOUNT FROM EMPLOYEE e LEFT JOIN INCENTIVE i ON e.EMPLOYEE_ID = i.EMPLOYEE_REF_ID;
SELECT e.FIRST_NAME as manager_name, m.FIRST_NAME as employee FROM EMPLOYEE e JOIN EMPLOYEE m ON m.MANAGER_ID = e.EMPLOYEE_ID;

 