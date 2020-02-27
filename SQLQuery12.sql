drop procedure usp_RegisterNewUser


CREATE PROCEDURE usp_RegisterUser
(
	@UserPassword VARCHAR(15),
	@Gender CHAR,
	@EmailId VARCHAR(50),
	@DateOfBirth DATE,
	@Address VARCHAR(200)
)
AS
BEGIN
	DECLARE @RoleId TINYINT
	BEGIN TRY
		IF (LEN(@EmailId)<4 OR LEN(@EmailId)>50 OR (@EmailId IS NULL))
			RETURN -1
		IF (LEN(@UserPassword)<8 OR LEN(@UserPassword)>15 OR (@UserPassword IS NULL))
			RETURN -2
		IF (@Gender<>'F' AND @Gender<>'M' OR (@Gender Is NULL))
			RETURN -3		
		IF (@DateOfBirth>=CAST(GETDATE() AS DATE) OR (@DateOfBirth IS NULL))
			RETURN -4
		IF DATEDIFF(d,@DateOfBirth,GETDATE())<6570
			RETURN -5
		IF (@Address IS NULL)
			RETURN -6
		SELECT @RoleId=RoleId FROM Role WHERE RoleName='Customer'
		INSERT INTO Users VALUES 
		(@EmailId,@UserPassword, @RoleId, @Gender, @DateOfBirth, @Address)
		RETURN 1
	END TRY
	BEGIN CATCH
		RETURN -99
	END CATCH
END
GO