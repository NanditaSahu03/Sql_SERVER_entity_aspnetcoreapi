SELECT * FROM Products

CREATE TABLE Stocks
(
[ProductId] CHAR(4),
[ProductName] VARCHAR(50),
[CategoryId] TINYINT,
[Price] NUMERIC(8),
[QuantityOrdered] INT
)
select * from Stocks
INSERT INTO Stocks VALUES('P156','Clever sticks',7,400.00,10)
INSERT INTO Stocks VALUES('P158','Swim suit',6,700.00,100)

MERGE Products as [Target] 
USING Stocks as [Source]
ON [Target].ProductId=[Source].ProductId
WHEN MATCHED THEN 
UPDATE SET QuantityAvailable= QuantityAvailable+[Source].QuantityOrdered
WHEN NOT MATCHED THEN 
INSERT VALUES(Source.ProductId,Source.ProductName,Source.CategoryId,Source.Price,Source.QuantityOrdered);