Create PROCEDURE usp_Register
(@UserName VARCHAR(20),
@UserPassword VARCHAR(20),
@EmailId VARCHAR(50),
@Gender CHAR,
@PhoneNumber NUMERIC(10),
@AddressLine1 VARCHAR(50),
@City VARCHAR(50),
@State VARCHAR(50),
@Country VARCHAR(50),
@PinNumber BIGINT,
@FirstName VARCHAR(20),
@LastName VARCHAR(20)
)
AS 
BEGIN
	BEGIN TRY
	DECLARE @CID INT
	IF @UserName is null
	RETURN -1
	IF @UserPassword IS NULL
	RETURN -2
	IF @EmailId IS NULL
	RETURN -3
	IF @Gender IS NULL
	RETURN -4
	IF @PhoneNumber IS NULL
	RETURN -5
	IF @AddressLine1 IS NULL
	RETURN -6
	IF @City IS NULL
	RETURN -7
	IF @State IS NULL
	RETURN -8
	IF @Country IS NULL
	RETURN -9
	IF @PinNumber IS NULL
	RETURN -10
	IF @FirstName IS NULL
	RETURN -11
	IF @LastName IS NULL
	RETURN -12
	INSERT INTO Credentials VALUES(@UserName,@UserPassword,2,@EmailId)
	SET @CID=IDENT_CURRENT('CREDENTIALS')
	INSERT INTO Customers (Gender,PhoneNumber,AddressLine1,City,[State],Country,PinNumber,CredentialId,FirstName,LastName)
	VALUES(@Gender,@PhoneNumber,@AddressLine1,@City,@State,@Country,@PinNumber,@CID,@FirstName,@LastName)
	RETURN 1
	END TRY
	BEGIN CATCH
	RETURN -99
	END CATCH
END
SELECT * FROM Credentials
select * from  Customers
DECLARE @RESULT INT
EXEC @RESULT=usp_Register 'Nandita_Sahu',Nandita@04,'nanditasahu031@gmail.com','F',7667405302,TELCO,JAMSHEDPUR,JHARKHAND,INDIA,721657,Nandita,Sahu
SELECT @RESULT


CREATE PROCEDURE usp_UpdateCustomerDetails
(
@CustId INT,
@FirstName VARCHAR(50),
@LastName VARCHAR(50),
@ContactNumber NUMERIC(10),
@AddressLine1 VARCHAR(50),
@City VARCHAR(50),
@State VARCHAR(50),
@Country VARCHAR(50),
@PinNumber BIGINT
)
AS 
BEGIN
	BEGIN TRY
	IF LEN(@PinNumber)<>6 
	RETURN -1
	IF @CustId IS NULL
	RETURN -2
	IF @FirstName IS NULL
	RETURN -3
	IF @LastName IS NULL
	RETURN -4
	IF @ContactNumber IS NULL
	RETURN -5
	IF @AddressLine1 IS NULL
	RETURN -6
	IF @City IS NULL
	RETURN -7
	IF @State IS NULL
	RETURN -8
	IF @Country IS NULL
	RETURN -9
	IF @PinNumber IS NULL
	RETURN -10
	UPDATE Customers SET PinNumber=@PinNumber,
	FirstName=@FirstName,
	LastName=@LastName,
	PhoneNumber=@ContactNumber,
	AddressLine1=@AddressLine1,
	City=@City,
	Country=@Country,
	State=@State where CustId=@CustId
	RETURN 1
	END TRY
	BEGIN CATCH
	RETURN -99
	END CATCH 
END
SELECT * FROM Customers
DECLARE @RESULTID INT
EXEC @RESULTID=usp_UpdateCustomerDetails 1000,'Thoma','Edi',12312345,'Baker Road','London','London','UK','987098'
SELECT @RESULTID

CREATE FUNCTION  ufn_CheckExistenceOfUserName(@UserName  VARCHAR(20))
RETURNS BIT
AS 
	BEGIN 
	DECLARE @VALUE BIT
	IF EXISTS(SELECT UserName FROM Credentials where UserName=@UserName )
	SET @VALUE=1
	ELSE
	SET @VALUE=0
	RETURN @VALUE
END
SELECT dbo.ufn_CheckExistenceOfUserName('Thomas_Edison')
select * from Credentials

--select * from Credentials
CREATE FUNCTION ufn_SelectAllLifeInsurancePolicies()
RETURNS TABLE
AS 
RETURN 
SELECT PolicyCategoryId,PolicyCategoryName,Description
FROM PolicyCategories WHERE IsActive=1

SELECT * FROM ufn_SelectAllLifeInsurancePolicies()

select * from  PolicyCategories



CREATE FUNCTION ufn_GetCustomerDetails(@CredentialId INT)
RETURNS TABLE
AS 
RETURN
SELECT CustId,FirstName,LastName,PhoneNumber,City,State 
from Customers where CredentialId=@CredentialId

SELECT * FROM ufn_GetCustomerDetails(2)

SELECT * FROM Customers