CREATE TABLE Employees
(
     EmployeeId SMALLINT CONSTRAINT pk_EmployeeId PRIMARY KEY IDENTITY,
     Name VARCHAR(100) NOT NULL,
     EmailId VARCHAR(100) CONSTRAINT uq_EmailId UNIQUE NOT NULL,
     Designation VARCHAR(50) NOT NULL,
     ManagerId SMALLINT CONSTRAINT fk_ManagerId 
     REFERENCES Employees(EmployeeId)
)
GO
select * from Employees
INSERT INTO Employees VALUES 
('Mark','mark@quickkart.com', 'CEO',NULL), 
('Peter','peter@quickkart.com','Vice President - Retail', 3), 
('Robert','robert@quickkart.com', 'Senior Vice President', 1), 
('Robin','robin@quickkart.com','Vice President - Digital Media', 3), 
('Roger','roger@quickkart.com','Director - Digital Media', 4), 
('Joseph','joseph@quickkart.com', 'Director - eCommerce', 10),
('Dylan','dylan@quickkart.com','HR Head', 1),
('Wills','wills@quickkart.com','Assistant HR', 7), 
('Jenny','jenny@quickkart.com','Director - Retail', 2),
('Kathy','kathy@quickkart.com','Vice President - eCommerce', 3), 
('Angie','angie@quickkart.com','Marketing Professional - Retail', 9)
GO

SELECT * FROM Employees


--SELECT * FROM Employees order by managerid asc
WITH CTE_EmployeeDetails 
AS(
     SELECT EmployeeId, Name, EmailId, Designation, ManagerId         
     FROM Employees WHERE ManagerId IS NULL
     UNION ALL  
     SELECT e.EmployeeId, e.Name, e.EmailId, e.Designation, e.ManagerId 
     FROM Employees e INNER JOIN CTE_EmployeeDetails ed     
     ON e.ManagerId = ed.EmployeeId
    )

SELECT Name,EmailId,Designation FROM CTE_EmployeeDetails
