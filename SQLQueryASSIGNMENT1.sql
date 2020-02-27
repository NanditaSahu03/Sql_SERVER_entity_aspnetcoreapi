CREATE DATABASE InSyst

CREATE TABLE Roles
(
[RoleId] int primary key  identity,
[RoleName] VARCHAR(50) not null unique
)
CREATE TABLE Credentials
(
[CredentialId] int primary key identity,
[UserName] varchar(20) not null,
[UserPassword] varchar(20) not null,
check (UserName<> UserPassword),
[RoleId] int references Roles(RoleId),
[EmailId] varchar(50) 
)
Create table BranchDetails
(
[BranchId] int identity(1000,1),
[BranchName] varchar(50) not null unique,
[District] varchar(50) not null,
[State] varchar(50) not null,
[Country] varchar(50) not null,
[BranchManagerId] int references Credentials(CredentialId)
)

create table Customers
(
[CustId] int identity(1000,1),
[Gender] char(1) not null,
[PhoneNumber] NUMERIC(10) NOT NULL,
[AddressLine1] varchar(50) not null,
[City] varchar(50) not null,
[State] varchar(50) not null,
[Country] varchar(50) not null,
[PinNumber] bigint not null,
[CredentialId] int references Credentials(CredentialId),
[FirstName] varchar(20),
[LastName] varchar(20)
)
select * from Roles
--DROP TABLE Roles
--DROP TABLE Credentials
--DROP TABLE BranchDetails
--DROP TABLE Customers


SET IDENTITY_INSERT [Roles] ON 
GO
INSERT [Roles] ([RoleId], [RoleName]) VALUES (1, N'BranchManager')
INSERT [Roles] ([RoleId], [RoleName]) VALUES (2, N'Customer')
SET IDENTITY_INSERT [Roles] OFF
GO

SET IDENTITY_INSERT [Credentials] ON 
GO
INSERT [Credentials] ([CredentialId], [UserName], [UserPassword], [RoleId], [EmailId]) VALUES (1, N'Eric_Hector', N'Insyst@123', 1, N'Eric_Hector@Insyst.com.com')
INSERT [Credentials] ([CredentialId], [UserName], [UserPassword], [RoleId], [EmailId]) VALUES (2, N'Thomas_Edison', N'Insyst@123', 2, N'Thomas_Edison@gmail.com')
INSERT [Credentials] ([CredentialId], [UserName], [UserPassword], [RoleId], [EmailId]) VALUES (3, N'Albert_Styene', N'Insyst@123', 2, N'Albert_Styene@gmail.com')
INSERT [Credentials] ([CredentialId], [UserName], [UserPassword], [RoleId], [EmailId]) VALUES (4, N'Kevin_Pitersen', N'Insyst@123', 2, N'Kevin_Pitersen@gmail.com')
INSERT [Credentials] ([CredentialId], [UserName], [UserPassword], [RoleId], [EmailId]) VALUES (5, N'Henna_Brown', N'Insyst@123', 2, N'Henna_Brown@gmail.com')
INSERT [Credentials] ([CredentialId], [UserName], [UserPassword], [RoleId], [EmailId]) VALUES (6, N'Marget_Brown', N'Insyst@1234', 2, N'Marget_Brown@gmail.com')
SET IDENTITY_INSERT [Credentials] OFF
GO

select * from Credentials


SET IDENTITY_INSERT [BranchDetails] ON 
GO
INSERT [BranchDetails] ([BranchId], [BranchName], [District], [State], [Country], [BranchManagerId]) VALUES (1000, N'Infosys', N'Mysore', N'Karnataka', N'India', 1)
INSERT [BranchDetails] ([BranchId], [BranchName], [District], [State], [Country], [BranchManagerId]) VALUES (1001, N'Choultry', N'Mysore', N'Karnataka', N'India', NULL)
INSERT [BranchDetails] ([BranchId], [BranchName], [District], [State], [Country], [BranchManagerId]) VALUES (1002, N'Electronic City', N'Bangalore', N'Karnataka', N'India', NULL)
SET IDENTITY_INSERT [BranchDetails] OFF
GO

select * from BranchDetails

SET IDENTITY_INSERT [Customers] ON 
GO
INSERT [Customers] ([CustId], [Gender], [PhoneNumber], [AddressLine1], [City], [State], [Country], [PinNumber], [CredentialId], [FirstName], [LastName]) VALUES (1000, N'M', CAST(1231231231 AS Numeric(10, 0)), N'Baker Street', N'London', N'London', N'UK', 987091, 2, N'Thomas', N'Edison')
INSERT [Customers] ([CustId], [Gender], [PhoneNumber], [AddressLine1], [City], [State], [Country], [PinNumber], [CredentialId], [FirstName], [LastName]) VALUES (1001, N'M', CAST(8050658872 AS Numeric(10, 0)), N'Rich Street', N'Bangalore', N'Karnataka', N'India', 560054, 4, N'Kevin', N'Pitersen')
INSERT [Customers] ([CustId], [Gender], [PhoneNumber], [AddressLine1], [City], [State], [Country], [PinNumber], [CredentialId], [FirstName], [LastName]) VALUES (1002, N'F', CAST(7272727272 AS Numeric(10, 0)), N'Hebbal', N'Mysore', N'Karnataka', N'India', 570096, 6, N'Margaret', N'Brown')
INSERT [Customers] ([CustId], [Gender], [PhoneNumber], [AddressLine1], [City], [State], [Country], [PinNumber], [CredentialId], [FirstName], [LastName]) VALUES (1003, N'F', CAST(7445678956 AS Numeric(10, 0)), N'Hebbal 3rd stage ', N'Bangalore', N'Karnataka', N'India', 560021, 5, N'Henna', N'Brown')
INSERT [Customers] ([CustId], [Gender], [PhoneNumber], [AddressLine1], [City], [State], [Country], [PinNumber], [CredentialId], [FirstName], [LastName]) VALUES (1004, N'M', CAST(6578456756 AS Numeric(10, 0)), N'Electronic city', N'Mysore', N'Karnataka', N'India', 560034, 3, N'Albert', N'Steyne')
SET IDENTITY_INSERT [Customers] OFF
GO
select * from Customers