CREATE NONCLUSTERED INDEX idx_ProductId_Products on Products(ProductId)
CREATE NONCLUSTERED INDEX idx_EmailId_PurchaseDetails on PurchaseDetails(EmailId)
CREATE NONCLUSTERED INDEX idx_DateOfPurchase_PurchaseDetails on PurchaseDetails(DateOfPurchase)
CREATE NONCLUSTERED INDEX idx_CardNumber on CardDetails(CardNumber)
CREATE NONCLUSTERED INDEX idx_EmailId_Users on Users(EmailId)
CREATE NONCLUSTERED INDEX idx_RoleId_Users on Users(RoleId)