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