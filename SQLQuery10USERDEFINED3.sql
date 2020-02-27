CREATE FUNCTION ufn_FetchProductsByCategory(@CategoryId int)
RETURNS TABLE
AS
RETURN 
 --SINGLE DB OPERATION IN INLINE TABLE FUNCTION
 SELECT * FROM Products WHERE CategoryId=@CategoryId

SELECT * from ufn_FetchProductsByCategory(1)

