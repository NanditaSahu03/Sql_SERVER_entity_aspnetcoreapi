CREATE SEQUENCE Employee_Sequence
as int 


MINVALUE 1
START WITH 2
CYCLE
INCREMENT BY 2
MAXVALUE 10

--alter sequence Employee_Sequence

--MINVALUE 1
--CYCLE

DROP sequence Employee_Sequence


select next value for Employee_Sequence


select * from sys.sequences where name='Employee_Sequence'

select next value for Employee_Sequence

--drop sequence Employee_Sequence


CREATE TABLE Employee_India
(
EmployeeId INT,
EmployeeName varchar(50)
)


CREATE TABLE Employee_Germany
(
EmployeeId INT,
EmployeeName varchar(50)
)
select * from Employee_Germany
select * from Employee_India

drop table Employee_Germany

drop table Employee_India



insert into Employee_India values(NEXT VALUE FOR Employee_Sequence ,'John')
insert into Employee_India values(NEXT VALUE FOR Employee_Sequence ,'Jack')
insert into Employee_Germany values(NEXT VALUE FOR Employee_Sequence ,'Jack')
insert into Employee_Germany values(NEXT VALUE FOR Employee_Sequence ,'Jom')
insert into Employee_Germany values(NEXT VALUE FOR Employee_Sequence ,'Jim')