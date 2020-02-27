SELECT * FROM PurchaseDetails


select TOP 10 Product,SUM(QuantityPurchased) from PurchaseDetails 
GROUP BY Product ORDER BY SUM(QuantityPurchased) DESC


select TOP 10 WITH TIES Product,SUM(QuantityPurchased) from PurchaseDetails 
GROUP BY Product ORDER BY SUM(QuantityPurchased) DESC


select TOP 50 PERCENT  Product,SUM(QuantityPurchased) from PurchaseDetails 
GROUP BY Product ORDER BY SUM(QuantityPurchased) DESC
