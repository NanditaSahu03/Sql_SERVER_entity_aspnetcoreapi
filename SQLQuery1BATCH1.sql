BEGIN
DECLARE @number1 INT =10,@number2 INT =10,@result INT
IF(@number1>@number2)
SET @result=@number1-@number2
ELSE IF (@number2>@number1)
SET @result=@number2-@number1
ELSE 
SET @result=0
--PRINT 'HI'
--PRINT 'HELLO'
PRINT @result
PRINT 'HI GUYS WE ARE STUDYING BATCH' --BUSINESS LOGIC
END