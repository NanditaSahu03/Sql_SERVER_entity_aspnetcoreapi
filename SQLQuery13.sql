USE [QuickKartDBsql]
GO

/****** Object:  StoredProcedure [dbo].[usp_RegisterNewUser]    Script Date: 2/26/2020 3:32:45 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

Create PROCEDURE [dbo].[usp_RegisterNewUser]
(@UserPassword VARCHAR(20),
@Gender CHAR,
@EmailId VARCHAR(50),
@DateOfBirth date,
@Address VARCHAR(50),
@RoleId int
)
AS 
BEGIN
	BEGIN TRY
	DECLARE @CID INT
	IF @UserPassword IS NULL
	RETURN -2
	IF @EmailId IS NULL
	RETURN -3
	IF @Gender IS NULL
	RETURN -4
	IF @DateOfBirth IS NULL
	RETURN -5
	IF @Address IS NULL
	RETURN -6
	IF @RoleId IS NULL
	RETURN -7
	INSERT INTO Users values(@EmailId,@UserPassword,@RoleId,@Gender,@DateOfBirth,@Address)
	RETURN 1
	END TRY
	BEGIN CATCH
	RETURN -99
	END CATCH
END
GO

drop procedure usp_RegisterNewUser


