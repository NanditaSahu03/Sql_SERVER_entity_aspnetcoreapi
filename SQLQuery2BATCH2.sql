BEGIN
DECLARE @number1 INT =90,@number2 INT =10,@result INT
SET @result=
CASE
WHEN @number1>@number2
THEN @number1-@number2
WHEN @number2>@number1
THEN @number2-@number1
WHEN @number2=@number1
THEN 0
END
PRINT 'THIS IS A BATCH SYNTAX OF CASE STATEMENT'
PRINT @result
END
