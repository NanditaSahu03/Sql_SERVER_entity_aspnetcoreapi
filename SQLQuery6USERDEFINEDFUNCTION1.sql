ALTER FUNCTION ufn_AdditionOfNumbers(@num1 int,@num2 int)
RETURNS VARCHAR(50)
BEGIN
DECLARE @RESULT INT
SET @RESULT=@num1+@num2
--PRINT 'HELLO GUYS WE ARE STUDYING FUNCTION USER DEFINED '
RETURN @RESULT --COMPULSORY TO RETURN A VALUE IN SCALAR FUNCTION WHICH IS NOT COMPULSORY IN STORED PROCEDURE 
END

SELECT dbo.ufn_AdditionOfNumbers(10,20)
DECLARE @VALUE1 INT=10,@VALUE2 INT =80
SELECT dbo.ufn_AdditionOfNumbers(@VALUE1,@VALUE2)