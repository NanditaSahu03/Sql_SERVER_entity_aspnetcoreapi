--SELECT * FROM Categories
BEGIN
DECLARE @ProductId CHAR(4)='P123',
@ProductName VARCHAR(50)='OREO',
@CategoryId  TINYINT=2,
@Price NUMERIC(8)=10,
@QuantityAvailable INT=90
	BEGIN TRY
	IF @ProductId IS NULL
	PRINT -1
	IF @ProductName IS NULL
	PRINT -2
	IF @CategoryId IS NULL
	PRINT -3
	IF @Price IS NULL
	PRINT -4
	IF @QuantityAvailable IS NULL
	PRINT -5
	IF SUBSTRING(@ProductId,1,1)<>'P' OR LEN(@ProductId)<4
	PRINT -6
	IF NOT EXISTS(SELECT CategoryId FROM Products where CategoryId=@CategoryId)
	PRINT -7
	IF @Price<=0
	PRINT -8
	IF @QuantityAvailable<=0
	PRINT -9
	INSERT INTO Products(ProductId,ProductName,CategoryId,Price,QuantityAvailable) VALUES(@ProductId,@ProductName,@CategoryId,@Price,@QuantityAvailable)
	PRINT 1
	END TRY
	BEGIN CATCH
	SELECT ERROR_LINE() AS 'ERROR_LINE'
	SELECT ERROR_NUMBER() AS 'ERROR_NUMBER'
	SELECT ERROR_MESSAGE() AS 'ERROR_MESSAGE'
	PRINT -99
	END CATCH
END

SELECT * FROM Products
