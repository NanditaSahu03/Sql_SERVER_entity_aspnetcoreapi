create table ##Cart
(
ProductId int 
)
drop table ##Cart
Insert into ##Cart VALUES(1000);
Insert into ##Cart VALUES(1001);
Insert into ##Cart VALUES(1002);
Insert into ##Cart VALUES(1003);
Insert into ##Cart VALUES(1004);
SELECT * FROM ##CART

--GLOBAL TEMPORARY VARIABLE