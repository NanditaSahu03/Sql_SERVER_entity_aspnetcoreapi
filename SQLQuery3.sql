create database PurchaseDB



select * from sys.sysaltfiles


SELECT name,filename from sys.sysaltfiles



create table CardDetails
(
[CardNumber] Numeric(16) CONSTRAINT pk_CardNumber PRIMARY KEY,
[NameOnCard] VARCHAR(40) NOT NULL,
[CardType] char(6) NOT NULL CONSTRAINT chk_CardType check(CardType in('V','M','A')),
[CVVNumber] NUMERIC(3) NOT NULL,
[ExpiryDate] DATE NOT NULL CONSTRAINT chk_ExpiryDate check(ExpiryDate>=GETDATE()),
[Balance] DECIMAL(10,2) CONSTRAINT chk_Balance check(Balance>=0)
)








INSERT INTO CardDetails(CardNumber,NameOnCard,CardType,CVVNumber,ExpiryDate,Balance) 
VALUES(1146665296881890,'Manuel','M',137,'2025-03-18',7282.00) 
INSERT INTO CardDetails(CardNumber,NameOnCard,CardType,CVVNumber,ExpiryDate,Balance) 
VALUES(1164283045453550,'Renate Messner','V',133,'2028-01-08',14538.00) 
INSERT INTO CardDetails(CardNumber,NameOnCard,CardType,CVVNumber,ExpiryDate,Balance) 
VALUES(1164916976389880,'Rita','M',588,'2025-07-28',18570.00) 
INSERT CardDetails(CardNumber,NameOnCard,CardType,CVVNumber,ExpiryDate,Balance) 
VALUES (1172583365804160,'McKenna','V',777,'2028-04-05',7972.00), 
       (1190676541467400, 'Brown','V',390,'2029-09-10',9049.00), 
       (1201253053391160, 'Patricia','M',501,'2029-06-24',19092.00)

select * from CardDetails


