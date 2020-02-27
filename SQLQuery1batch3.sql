--SELECT * FROM Products
BEGIN
BEGIN TRY
DECLARE @Price Numeric(8),@Balance Decimal(10,2),@Amount Numeric(8),
        @QuantityPurchased int=1,@QuantityAvailable int,
		@ProductId Char(4)='P157',@CardNumber Numeric(16)='2122490035590690',
		@EmailId Varchar(50)='Margaret@gmail.com'

IF NOT EXISTS(SELECT * FROM Products where ProductId=@ProductId)
BEGIN 
PRINT 'PRODUCT ID IS NOT VALID'
RETURN
END
IF NOT EXISTS(SELECT * FROM  CardDetails where  CardNumber=@CardNumber)
BEGIN
PRINT 'CARD NUMBER IS NOT VALID'
RETURN
END
IF NOT EXISTS(SELECT * FROM  Users where  EmailId=@EmailId)
BEGIN
PRINT 'Email id is not valid'
RETURN
END
IF @QuantityPurchased<=0
BEGIN
PRINT 'QUANTITY PURCHASED IS LESS THAN 0'
RETURN 
END
select @Price=Price from Products where ProductId=@ProductId
select @Balance=Balance from CardDetails where CardNumber=@CardNumber
SET @Amount=@Price*@QuantityPurchased
IF (@Balance>=@Amount)
BEGIN 
UPDATE CardDetails SET Balance=Balance-@Amount where CardNumber=@CardNumber
UPDATE Products SET QuantityAvailable=QuantityAvailable-@QuantityPurchased WHERE ProductId=@ProductId
INSERT INTO PurchaseDetails values(@EmailId,@ProductId,@QuantityPurchased,Default)
PRINT 'THE DETAILS ARE MATCHED..'
END
ELSE
PRINT 'THE DETAILS ARE NOT MATCHED ...PLEASE VERIFY'
END TRY
BEGIN CATCH
PRINT 'UNSUCCESSFUL OPERATION'
SELECT ERROR_LINE() AS 'LINE NUMBER',
       ERROR_MESSAGE() AS 'ERROR MESSAGE',
	   ERROR_NUMBER() AS 'ERROR NUMBER',
	   ERROR_STATE() AS 'ERROR STATE',
	   ERROR_SEVERITY() AS 'ERROR SEVERITY'
END CATCH
END