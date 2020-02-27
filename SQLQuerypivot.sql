select Product,DATEPART(YEAR,DateOfPurchase) as 'year' from PurchaseDetails

--select * from PurchaseDetails

SELECT * INTO #Purchase 
from(select Product,DATEPART(YEAR,DateOfPurchase) as 'year' from PurchaseDetails)AS q
PIVOT
( 
COUNT(Product)
FOR YEAR IN ([2013],[2014],[2015])
)as pvt
drop table #Purchase
SELECT * from #Purchase 



SELECT * FROM #SalesDetails
UNPIVOT(
ProductId FOR
[Year] IN ([2013],[2014],[2015])
) AS


SELECT * FROM #SalesDetails