CREATE Table ChildCareerPolicies
(
[QuoteId]int primary key IDENTITY(1,1),
[InsuredID] INT REFERENCES Customers(CustId) not null,
[BeneficiaryName] varchar(50) not null,
[BeneficiaryDOB] DATE not null,
[PremiumMode] varchar(20) not null,
[RebateMode] varchar(20) not null,
[SumAssured] MONEY NOT NULL,
[Term] numeric(18)not null,
[PremiumAmount] money not null,
[PercentageRebate] decimal(18,2) not null,
[PremiumModeBasedRebate] money not null,
[TermEndBasedRebate] Money not null,
[TotalAmount] money not null,
[EffectiveDate] date not null,
[ExpiryDate] date not null,
[NomineeName] varchar(50) not null,
[NomineeRelation] varchar(10) not null,
[BranchId] int references BranchDetails(BranchId) not null,
[ClaimsTaken] int not null default 0,
[Status] int not null default 0,
[Comment] varchar(500) default null
)

CREATE Table Policies
(
[PolicyId] int primary key identity,
[PolicyType] varchar(50) not null unique
)



CREATE Table PolicyCategories
(
[PolicyType] varchar(50) references Policies(PolicyType),
[PolicyCategoryId] varchar(10) unique,
[PolicyCategoryName] varchar(50),
[Description] varchar(100),
[IsActive] BIT CHECK([IsActive] IN (0,1))
)

CREATE Table PolicyStatus
(
[ApprovalId] int primary key identity,
[QuoteId] int not null,
[CustId] int references Customers(CustId) not null,
[BranchId] int references BranchDetails(BranchId) not null,
[Status] varchar(8) not null,
check(Status in('Paid','Approved','Rejected')),
[Comment] varchar(200) 
)
CREATE TABLE TransactionDetails
(
[TransactionId] int identity(1,1),
[CustId] int not null,
[QuoteId]int not null,
[TransactionDate] date default getdate() not null,
[TransactionTime] time default convert(time,getdate())not null,
[Amount] money not null
)
SELECT * FROM Policies
SELECT * FROM PolicyCategories
SET IDENTITY_INSERT Policies ON
GO
INSERT [Policies] ([PolicyId], [PolicyType]) VALUES (1, 'General Insurance')
INSERT [Policies] ([PolicyId], [PolicyType]) VALUES (2, 'Life Insurance')
SET IDENTITY_INSERT [Policies] OFF
GO

INSERT [PolicyCategories] ([PolicyType], [PolicyCategoryId], [PolicyCategoryName], [Description], [IsActive]) VALUES (N'General Insurance', N'G1', N'Health', N'Protection for Customers Health', 1)
INSERT [PolicyCategories] ([PolicyType], [PolicyCategoryId], [PolicyCategoryName], [Description], [IsActive]) VALUES (N'Life Insurance', N'L1', N'Child Plan', N'Protection for Customers Life', 1)
INSERT [PolicyCategories] ([PolicyType], [PolicyCategoryId], [PolicyCategoryName], [Description], [IsActive]) VALUES (N'Life Insurance', N'L2', N'Whole Life', N'Provides protection for your children', 1)
INSERT [PolicyCategories] ([PolicyType], [PolicyCategoryId], [PolicyCategoryName], [Description], [IsActive]) VALUES (N'Life Insurance', N'L3', N'TermiCare', N'Provides protection for a specific term', 1)
GO
SET IDENTITY_INSERT [ChildCareerPolicies] On
INSERT [ChildCareerPolicies] ([QuoteId], [InsuredId], [BeneficiaryName], [BeneficiaryDOB], [PremiumMode], [RebateMode], [SumAssured], [Term], [PremiumAmount], [PercentageRebate], [PremiumModeBasedRebate], [TermEndBasedRebate], [TotalAmount], [EffectiveDate], [ExpiryDate], [NomineeName], [NomineeRelation], [BranchId], [ClaimsTaken], [Status], [Comment]) VALUES (N'CCP1001', 1000, N'Cristo', CAST(0x6F2C0B00 AS Date), N'Yearly', N'Yearly', 100000.0000, CAST(15 AS Numeric(18, 0)), 4000.0000, CAST(2.00 AS Decimal(18, 2)), 80.0000, 0.0000, 101200.0000, CAST(0xC83A0B00 AS Date), CAST(0x363C0B00 AS Date), N'Ann', N'Mother', 1000, 0, Default, NULL)
INSERT [ChildCareerPolicies] ([QuoteId], [InsuredId], [BeneficiaryName], [BeneficiaryDOB], [PremiumMode], [RebateMode], [SumAssured], [Term], [PremiumAmount], [PercentageRebate], [PremiumModeBasedRebate], [TermEndBasedRebate], [TotalAmount], [EffectiveDate], [ExpiryDate], [NomineeName], [NomineeRelation], [BranchId], [ClaimsTaken], [Status], [Comment]) VALUES (N'CCP1002', 1001, N'Cristo', CAST(0xBB3A0B00 AS Date), N'Half-Yearly', N'Half-Yearly', 100000.0000, CAST(15 AS Numeric(18, 0)), 2100.0000, CAST(1.00 AS Decimal(18, 2)), 21.0000, 0.0000, 100315.0000, CAST(0xC63A0B00 AS Date), CAST(0x2D500B00 AS Date), N'Issac', N'Guardian', 1000, 0, DEFAULT, NULL)
INSERT [ChildCareerPolicies] ([QuoteId], [InsuredId], [BeneficiaryName], [BeneficiaryDOB], [PremiumMode], [RebateMode], [SumAssured], [Term], [PremiumAmount], [PercentageRebate], [PremiumModeBasedRebate], [TermEndBasedRebate], [TotalAmount], [EffectiveDate], [ExpiryDate], [NomineeName], [NomineeRelation], [BranchId], [ClaimsTaken], [Status], [Comment]) VALUES (N'CCP1003', 1002, N'Steve', CAST(0xAB300B00 AS Date), N'Half-Yearly', N'Half-Yearly', 500000.0000, CAST(10 AS Numeric(18, 0)), 3000.0000, CAST(1.00 AS Decimal(18, 2)), 30.0000, 10000.0000, 510300.0000, CAST(0xC53A0B00 AS Date), CAST(0x0B490B00 AS Date), N'Henna', N'Mother', 1002, 0, 1, N'Approved')
INSERT [ChildCareerPolicies] ([QuoteId], [InsuredId], [BeneficiaryName], [BeneficiaryDOB], [PremiumMode], [RebateMode], [SumAssured], [Term], [PremiumAmount], [PercentageRebate], [PremiumModeBasedRebate], [TermEndBasedRebate], [TotalAmount], [EffectiveDate], [ExpiryDate], [NomineeName], [NomineeRelation], [BranchId], [ClaimsTaken], [Status], [Comment]) VALUES (N'CCP1004', 1003, N'Joe', CAST(0xAB300B00 AS Date), N'Half-Yearly', N'Half-Yearly', 500000.0000, CAST(10 AS Numeric(18, 0)), 3000.0000, CAST(1.00 AS Decimal(18, 2)), 30.0000, 10000.0000, 510300.0000, CAST(0xC53A0B00 AS Date), CAST(0x0B490B00 AS Date), N'Margret', N'Mother', 1002, 0, 1, N'Approved')
INSERT [ChildCareerPolicies] ([QuoteId], [InsuredId], [BeneficiaryName], [BeneficiaryDOB], [PremiumMode], [RebateMode], [SumAssured], [Term], [PremiumAmount], [PercentageRebate], [PremiumModeBasedRebate], [TermEndBasedRebate], [TotalAmount], [EffectiveDate], [ExpiryDate], [NomineeName], [NomineeRelation], [BranchId], [ClaimsTaken], [Status], [Comment]) VALUES (N'CCP1005', 1004, N'Albert', CAST(0xAB300B00 AS Date), N'Half-Yearly', N'Half-Yearly', 500000.0000, CAST(10 AS Numeric(18, 0)), 3000.0000, CAST(1.00 AS Decimal(18, 2)), 30.0000, 10000.0000, 510300.0000, CAST(0xC53A0B00 AS Date), CAST(0x0B490B00 AS Date), N'Kevin', N'Father', 1002, 0, 1, N'Approved')
GO
SET IDENTITY_INSERT [ChildCareerPolicies] Off


SET IDENTITY_INSERT [PolicyStatus] ON
GO
INSERT [PolicyStatus] ([ApprovalId], [QuoteId], [CustId], [BranchId], [Status], [Comment]) VALUES (1, N'CCP1003', 1002, 1000, N'Approved', 'Submitted all documents')
INSERT [PolicyStatus] ([ApprovalId], [QuoteId], [CustId], [BranchId], [Status], [Comment]) VALUES (2, N'CCP1004', 1003, 1000, N'Approved', NULL)
INSERT [PolicyStatus] ([ApprovalId], [QuoteId], [CustId], [BranchId], [Status], [Comment]) VALUES (3, N'CCP1005', 1004 ,1000, N'Paid', NULL)
SET IDENTITY_INSERT [PolicyStatus] OFF
GO

SET IDENTITY_INSERT[TransactionDetails] ON
INSERT [TransactionDetails] ([CustId], [QuoteId], [Transactiondate], [Transactiontime], [Amount]) VALUES (1002, N'CCP1002', CAST(0xCA3A0B00 AS Date), CAST(0x0770161C6F520000 AS Time), 2000.0000)
INSERT [TransactionDetails] ([CustId], [QuoteId], [Transactiondate], [Transactiontime], [Amount]) VALUES (1003,N'CCP1003', CAST(0xCA3A0B00 AS Date), CAST(0x07F0C5F046530000 AS Time), 2500.0000)
INSERT [TransactionDetails] ([CustId], [QuoteId], [Transactiondate], [Transactiontime], [Amount]) VALUES (1004,N'CCP1004', CAST(0xCA3A0B00 AS Date), CAST(0x07F0C5F046530000 AS Time), 3000.0000)
SET IDENTITY_INSERT[TransactionDetails] OFF
GO


DROP TABLE Policies
DROP TABLE TransactionDetails
DROP TABLE ChildCareerPolicies
DROP TABLE PolicyStatus
DROP TABLE PolicyCategories
DROP TABLE PolicyStatus
