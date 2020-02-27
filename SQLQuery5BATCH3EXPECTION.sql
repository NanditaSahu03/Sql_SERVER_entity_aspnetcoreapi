BEGIN TRY
DECLARE @Value1 int=599,@Value2 int=0
IF(@Value2=0)
   THROW 55000,'VALUE2 IS 0',1
ELSE 
   SELECT @Value1/@Value2
END TRY


BEGIN CATCH
SELECT ERROR_LINE() AS 'LINE NUMBER',
       ERROR_MESSAGE() AS 'ERROR MESSAGE',
	   ERROR_NUMBER() AS 'ERROR NUMBER',
	   ERROR_STATE() AS 'ERROR STATE',
	   ERROR_SEVERITY() AS 'ERROR SEVERITY'
PRINT 'ZERO DIVISION ERROR'
END CATCH