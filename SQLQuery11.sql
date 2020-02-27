USE [QuickKartDBsql]
GO

/****** Object:  StoredProcedure [dbo].[usp_InsertPurchaseDetails]    Script Date: 2/26/2020 9:44:28 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_InsertPurchaseDetails]
(
	@EmailId VARCHAR(50),
	@ProductId CHAR(4),
	@QuantityPurchased INT,
	@PurchaseId BIGINT OUTPUT
)
AS
BEGIN
	SET @PurchaseId=0	
		BEGIN TRY
			IF (@EmailId IS NULL)
				RETURN -1
			IF NOT EXISTS (SELECT @EmailId FROM Users WHERE EmailId=@EmailId)
				RETURN -2
			IF (@ProductId IS NULL)
				RETURN -3
			IF NOT EXISTS (SELECT ProductId FROM Products WHERE ProductId=@ProductId)
				RETURN -4
			IF ((@QuantityPurchased<=0) OR (@QuantityPurchased IS NULL))
				RETURN -5
					INSERT INTO PurchaseDetails VALUES (@EmailId, @ProductId, @QuantityPurchased, DEFAULT)
			SELECT @PurchaseId=IDENT_CURRENT('PurchaseDetails')
			UPDATE Products SET QuantityAvailable=QuantityAvailable-@QuantityPurchased WHERE ProductId=@ProductId			
			RETURN 1
		END TRY
		BEGIN CATCH
			SET @PurchaseId=0			
			RETURN -99
		END CATCH
	END
GO

select * from PurchaseDetails
