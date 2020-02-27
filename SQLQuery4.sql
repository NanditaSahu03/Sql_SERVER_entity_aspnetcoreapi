
drop table L1075
create table L1075
(
EmployeeId INT PRIMARY KEY IDENTITY(1000,1),
EmployeeName VARCHAR(50),
DOJ Date not null

)


insert into L1075 values('nandita sahu','2020-02-11')
insert into L1075 values('monika sahu','2020-02-10')
insert into L1075 values('shibu sahu','2020-01-10')
insert into L1075 values('sweta sahu','2020-02-20')
insert into L1075 values('abhishek kumar lalu','2020-02-20')

SET Identity_Insert L1075 ON 
INSERT INTO L1075(EmployeeId,EmployeeName,DOJ) VALUES(7000,'harshitha','2020-12-03')
SET Identity_Insert L1075 OFF 
INSERT INTO L1075 VALUES('harsh','2020-12-03')
 select  * from L1075
 select @@IDENTITY