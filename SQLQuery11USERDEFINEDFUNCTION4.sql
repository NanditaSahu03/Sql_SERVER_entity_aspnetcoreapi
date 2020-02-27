
--SELECT * FROM Products

CREATE FUNCTION ufn_GetProductsByCategory(@categoryId int)
RETURNS @Category Table(ProductId CHAR(4),CategoryId int)
AS
BEGIN
  INSERT @Category
  SELECT ProductId,CategoryId FROM Products WHERE CategoryId=@categoryId
  return
END

SELECT * FROM ufn_GetProductsByCategory(1)
