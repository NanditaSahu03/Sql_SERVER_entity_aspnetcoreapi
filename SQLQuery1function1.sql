select * from Products

select ProductId,CategoryId,Price,ROW_NUMBER()
OVER(ORDER BY Price DESC) 'ROW NUMBER' FROM Products

select ProductId,CategoryId,Price,RANK()
OVER(ORDER BY Price DESC) 'RANK' FROM Products

select ProductId,CategoryId,Price,ROW_NUMBER()          --DENSE_RANK() IS USED TO GET THE NEXT VALUE WHILE RANK() IS USED FOR INCREMENTAL VALUE
OVER(ORDER BY Price DESC) 'ROW NUMBER',
DENSE_RANK() OVER(ORDER BY Price DESC) 'RANK',
NTILE(5) OVER(ORDER BY Price DESC) 'GROUPS'
FROM Products