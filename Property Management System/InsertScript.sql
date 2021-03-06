USE [PropertyManagement]
GO
SET IDENTITY_INSERT [dbo].[Distance] ON 

INSERT [dbo].[Distance] ([DistanceID], [DistDesc]) VALUES (1, N'In House')
INSERT [dbo].[Distance] ([DistanceID], [DistDesc]) VALUES (2, N'0-1 miles')
INSERT [dbo].[Distance] ([DistanceID], [DistDesc]) VALUES (3, N'More than 1 mile')
SET IDENTITY_INSERT [dbo].[Distance] OFF
SET IDENTITY_INSERT [dbo].[Facilities] ON 

INSERT [dbo].[Facilities] ([FacilityID], [FacilityName]) VALUES (1, N'Laundry')
INSERT [dbo].[Facilities] ([FacilityID], [FacilityName]) VALUES (2, N'Market')
INSERT [dbo].[Facilities] ([FacilityID], [FacilityName]) VALUES (3, N'ATM')
SET IDENTITY_INSERT [dbo].[Facilities] OFF
SET IDENTITY_INSERT [dbo].[PropertyManager] ON 

INSERT [dbo].[PropertyManager] ([PropMgrID], [PMgrName], [PMgrLocation], [PMgrEmail], [PMgrContact]) VALUES (1001, N'Robin', N'MassAve', N'Robin@realestate.com', CAST(5686856777 AS Numeric(10, 0)))
INSERT [dbo].[PropertyManager] ([PropMgrID], [PMgrName], [PMgrLocation], [PMgrEmail], [PMgrContact]) VALUES (1002, N'Drew', N'Copley', N'Drew@realestate.com', CAST(5645777877 AS Numeric(10, 0)))
SET IDENTITY_INSERT [dbo].[PropertyManager] OFF
SET IDENTITY_INSERT [dbo].[Property] ON 

INSERT [dbo].[Property] ([PropID], [PropName], [PropAddress1], [PropAddress2], [PropCity], [PropState], [Pin], [PropMgrID]) VALUES (100, N'Prudential Tower', N'Mass Ave', N'', N'Cambridge', N'MA', 2199, 1001)
INSERT [dbo].[Property] ([PropID], [PropName], [PropAddress1], [PropAddress2], [PropCity], [PropState], [Pin], [PropMgrID]) VALUES (101, N'Millennium Tower', N'DownTown Crossing', N'', N'Boston', N'MA', 2199, 1001)
INSERT [dbo].[Property] ([PropID], [PropName], [PropAddress1], [PropAddress2], [PropCity], [PropState], [Pin], [PropMgrID]) VALUES (102, N'One Financial Center', N'Financial District', N'', N'Boston', N'MA', 2199, 1002)
INSERT [dbo].[Property] ([PropID], [PropName], [PropAddress1], [PropAddress2], [PropCity], [PropState], [Pin], [PropMgrID]) VALUES (103, N'500 Bolyston', N'222 Berkeley', N'', N'Boston', N'MA', 4325, 1002)
INSERT [dbo].[Property] ([PropID], [PropName], [PropAddress1], [PropAddress2], [PropCity], [PropState], [Pin], [PropMgrID]) VALUES (104, N'4 Copley Place Tower', N'100 Copley Place', N'', N'Cambridge', N'MA', 4355, 1001)
INSERT [dbo].[Property] ([PropID], [PropName], [PropAddress1], [PropAddress2], [PropCity], [PropState], [Pin], [PropMgrID]) VALUES (105, N'State Tower', N'101 State Street', N'', N'Boston', N'MA', 4888, 1001)
INSERT [dbo].[Property] ([PropID], [PropName], [PropAddress1], [PropAddress2], [PropCity], [PropState], [Pin], [PropMgrID]) VALUES (106, N'Light View Apartments', N'792 Columbus Ave', N'', N'Cambridge', N'MA', 4888, 1002)
INSERT [dbo].[Property] ([PropID], [PropName], [PropAddress1], [PropAddress2], [PropCity], [PropState], [Pin], [PropMgrID]) VALUES (107, N'Hynes Convention Center', N'900 Bolyston', N'', N'Boston', N'MA', 4329, 1002)
INSERT [dbo].[Property] ([PropID], [PropName], [PropAddress1], [PropAddress2], [PropCity], [PropState], [Pin], [PropMgrID]) VALUES (108, N'John Hancock Tower', N'200 Calendron Street', N'', N'Cambridge', N'MA', 4625, 1001)
INSERT [dbo].[Property] ([PropID], [PropName], [PropAddress1], [PropAddress2], [PropCity], [PropState], [Pin], [PropMgrID]) VALUES (109, N'Dana Research Centre', N'346 Huntington', N'', N'Boston', N'MA', 4395, 1002)
SET IDENTITY_INSERT [dbo].[Property] OFF
SET IDENTITY_INSERT [dbo].[UnitType] ON 

INSERT [dbo].[UnitType] ([UnitTypeID], [UnitTypeDesc]) VALUES (1, N'Commercial')
INSERT [dbo].[UnitType] ([UnitTypeID], [UnitTypeDesc]) VALUES (2, N'Residential')
SET IDENTITY_INSERT [dbo].[UnitType] OFF
SET IDENTITY_INSERT [dbo].[Unit] ON 

INSERT [dbo].[Unit] ([UnitID], [UArea], [ULevel], [UBedroom], [UPerMonthRent], [UnitTypeID], [PropID], [UnitCode], [DateCreated]) VALUES (110, 2000, 4, 0, 800, 1, 100, N'U4', CAST(N'2018-08-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Unit] ([UnitID], [UArea], [ULevel], [UBedroom], [UPerMonthRent], [UnitTypeID], [PropID], [UnitCode], [DateCreated]) VALUES (111, 5000, 6, 0, 1000, 1, 100, N'U6', CAST(N'2018-08-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Unit] ([UnitID], [UArea], [ULevel], [UBedroom], [UPerMonthRent], [UnitTypeID], [PropID], [UnitCode], [DateCreated]) VALUES (112, 7000, 2, 0, 1200, 1, 102, N'U2', CAST(N'2016-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Unit] ([UnitID], [UArea], [ULevel], [UBedroom], [UPerMonthRent], [UnitTypeID], [PropID], [UnitCode], [DateCreated]) VALUES (113, 8000, 6, 0, 1400, 1, 101, N'U12', CAST(N'2014-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Unit] ([UnitID], [UArea], [ULevel], [UBedroom], [UPerMonthRent], [UnitTypeID], [PropID], [UnitCode], [DateCreated]) VALUES (114, 4000, 5, 0, 1500, 1, 101, N'U13', CAST(N'2016-09-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Unit] ([UnitID], [UArea], [ULevel], [UBedroom], [UPerMonthRent], [UnitTypeID], [PropID], [UnitCode], [DateCreated]) VALUES (115, 1200, 3, 3, 3300, 2, 106, N'U792', CAST(N'2016-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Unit] ([UnitID], [UArea], [ULevel], [UBedroom], [UPerMonthRent], [UnitTypeID], [PropID], [UnitCode], [DateCreated]) VALUES (116, 2000, 2, 3, 3600, 2, 106, N'U793', CAST(N'2016-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Unit] ([UnitID], [UArea], [ULevel], [UBedroom], [UPerMonthRent], [UnitTypeID], [PropID], [UnitCode], [DateCreated]) VALUES (117, 1900, 7, 0, 3700, 1, 103, N'U222', CAST(N'2015-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Unit] ([UnitID], [UArea], [ULevel], [UBedroom], [UPerMonthRent], [UnitTypeID], [PropID], [UnitCode], [DateCreated]) VALUES (118, 3000, 4, 0, 8000, 1, 105, N'U101', CAST(N'2014-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Unit] ([UnitID], [UArea], [ULevel], [UBedroom], [UPerMonthRent], [UnitTypeID], [PropID], [UnitCode], [DateCreated]) VALUES (119, 700, 6, 0, 4700, 1, 108, N'U200', CAST(N'2014-01-01T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Unit] OFF
SET IDENTITY_INSERT [dbo].[UnitScore] ON 

INSERT [dbo].[UnitScore] ([UnitScoreID], [UnitID], [FacilityID], [DistanceID]) VALUES (2, 110, 1, 1)
INSERT [dbo].[UnitScore] ([UnitScoreID], [UnitID], [FacilityID], [DistanceID]) VALUES (3, 110, 2, 2)
INSERT [dbo].[UnitScore] ([UnitScoreID], [UnitID], [FacilityID], [DistanceID]) VALUES (4, 110, 3, 3)
INSERT [dbo].[UnitScore] ([UnitScoreID], [UnitID], [FacilityID], [DistanceID]) VALUES (5, 111, 1, 1)
INSERT [dbo].[UnitScore] ([UnitScoreID], [UnitID], [FacilityID], [DistanceID]) VALUES (6, 111, 2, 2)
INSERT [dbo].[UnitScore] ([UnitScoreID], [UnitID], [FacilityID], [DistanceID]) VALUES (7, 111, 3, 2)
INSERT [dbo].[UnitScore] ([UnitScoreID], [UnitID], [FacilityID], [DistanceID]) VALUES (8, 112, 1, 1)
INSERT [dbo].[UnitScore] ([UnitScoreID], [UnitID], [FacilityID], [DistanceID]) VALUES (9, 112, 2, 2)
INSERT [dbo].[UnitScore] ([UnitScoreID], [UnitID], [FacilityID], [DistanceID]) VALUES (10, 112, 3, 3)
INSERT [dbo].[UnitScore] ([UnitScoreID], [UnitID], [FacilityID], [DistanceID]) VALUES (11, 113, 1, 3)
INSERT [dbo].[UnitScore] ([UnitScoreID], [UnitID], [FacilityID], [DistanceID]) VALUES (12, 113, 2, 3)
INSERT [dbo].[UnitScore] ([UnitScoreID], [UnitID], [FacilityID], [DistanceID]) VALUES (13, 113, 3, 3)
INSERT [dbo].[UnitScore] ([UnitScoreID], [UnitID], [FacilityID], [DistanceID]) VALUES (14, 113, 1, 1)
INSERT [dbo].[UnitScore] ([UnitScoreID], [UnitID], [FacilityID], [DistanceID]) VALUES (15, 113, 2, 3)
INSERT [dbo].[UnitScore] ([UnitScoreID], [UnitID], [FacilityID], [DistanceID]) VALUES (16, 113, 3, 3)
SET IDENTITY_INSERT [dbo].[UnitScore] OFF
SET IDENTITY_INSERT [dbo].[Maintenance] ON 

INSERT [dbo].[Maintenance] ([MaintenanceID], [MaintenanceType]) VALUES (1, N'Preventive')
INSERT [dbo].[Maintenance] ([MaintenanceID], [MaintenanceType]) VALUES (2, N'Predictive')
INSERT [dbo].[Maintenance] ([MaintenanceID], [MaintenanceType]) VALUES (3, N'Condition-Based')
SET IDENTITY_INSERT [dbo].[Maintenance] OFF
SET IDENTITY_INSERT [dbo].[Vendor] ON 

INSERT [dbo].[Vendor] ([VendorID], [VendorName], [VAddress1], [VAddress2], [VCity], [VState], [VPin]) VALUES (100, N'Ran', N'Tremont St', N'', N'Boston', N'MA', 2120)
INSERT [dbo].[Vendor] ([VendorID], [VendorName], [VAddress1], [VAddress2], [VCity], [VState], [VPin]) VALUES (101, N'Joseph', N'Peterborough', N'', N'Boston', N'MA', 2115)
INSERT [dbo].[Vendor] ([VendorID], [VendorName], [VAddress1], [VAddress2], [VCity], [VState], [VPin]) VALUES (102, N'Rey', N'123 St', N'', N'New York', N'NY', 2234)
SET IDENTITY_INSERT [dbo].[Vendor] OFF
SET IDENTITY_INSERT [dbo].[MaintenanceCost] ON 

INSERT [dbo].[MaintenanceCost] ([MaintenanceID], [CostperHour], [VendorID], [MaintenanceCostID]) VALUES (1, 10.5, 100, 1)
INSERT [dbo].[MaintenanceCost] ([MaintenanceID], [CostperHour], [VendorID], [MaintenanceCostID]) VALUES (2, 12, 101, 2)
INSERT [dbo].[MaintenanceCost] ([MaintenanceID], [CostperHour], [VendorID], [MaintenanceCostID]) VALUES (3, 15, 102, 3)
INSERT [dbo].[MaintenanceCost] ([MaintenanceID], [CostperHour], [VendorID], [MaintenanceCostID]) VALUES (1, 11, 102, 4)
SET IDENTITY_INSERT [dbo].[MaintenanceCost] OFF
SET IDENTITY_INSERT [dbo].[Customer] ON 

INSERT [dbo].[Customer] ([CustomerID], [CustomerName], [CustomerContact], [CustomerEmail], [PreferredLocation], [PreferredPrice], [PreferredUnit], [PropMgrID], [CreditEligibility]) VALUES (102, N'Hood', CAST(6777777677 AS Numeric(10, 0)), N'Hood@husky.neu.edu', N'MassAve', 1200, N'U6', 1001, N'Yes')
INSERT [dbo].[Customer] ([CustomerID], [CustomerName], [CustomerContact], [CustomerEmail], [PreferredLocation], [PreferredPrice], [PreferredUnit], [PropMgrID], [CreditEligibility]) VALUES (103, N'Josh', CAST(6777777677 AS Numeric(10, 0)), N'Josh@husky.neu.edu', N'BackBay', 1800, N'U2', 1001, N'NO ')
SET IDENTITY_INSERT [dbo].[Customer] OFF
SET IDENTITY_INSERT [dbo].[Tenant] ON 

INSERT [dbo].[Tenant] ([Tenant_ID], [TenantName], [TenantContact], [TenantEmail], [TenantDeposit], [TenantCode], [TenantCreditCardNumber], [TenantCreditCardNumber_encrypt]) VALUES (100, N'Hood', CAST(6777777677 AS Numeric(10, 0)), N'Hood@husky.neu.edu', 700.56, N't000001', N'876-768-7000', 0x00D346F1E52FCC4D92E643523A0E484101000000B6207B916FF02AF13F55C58B7A3E913936EAE3ED62D73CEED108E0804766ECCEA2EA69AB9538FD86DC4606AD7CFD9F20)
INSERT [dbo].[Tenant] ([Tenant_ID], [TenantName], [TenantContact], [TenantEmail], [TenantDeposit], [TenantCode], [TenantCreditCardNumber], [TenantCreditCardNumber_encrypt]) VALUES (101, N'Andrew', CAST(9777887677 AS Numeric(10, 0)), N'Andrew@husky.neu.edu', 800.76, N't000002', N'876-770-7000', 0x00D346F1E52FCC4D92E643523A0E484101000000E662D35FD0A79870A2F99316FB8ABB53A5940F50D0991E7AADEB0EB94E0B1F8943E94E2AA3A095C024B443E22FAFC495)
INSERT [dbo].[Tenant] ([Tenant_ID], [TenantName], [TenantContact], [TenantEmail], [TenantDeposit], [TenantCode], [TenantCreditCardNumber], [TenantCreditCardNumber_encrypt]) VALUES (102, N'Sachin', CAST(9776227677 AS Numeric(10, 0)), N'Sachin@husky.neu.edu', 1000.76, N't000003', N'876-773-7000', 0x00D346F1E52FCC4D92E643523A0E484101000000C9E5A3521F5E165BD7CEE0F371124356781D49BFB92CEEBC951BFB9608BAFF50BB06FE0FC1DBA37CCF121DD3652DAD09)
INSERT [dbo].[Tenant] ([Tenant_ID], [TenantName], [TenantContact], [TenantEmail], [TenantDeposit], [TenantCode], [TenantCreditCardNumber], [TenantCreditCardNumber_encrypt]) VALUES (103, N'Jake', CAST(8347645382 AS Numeric(10, 0)), N'Jake@husky.neu.edu', 699, N't000004', N'876-775-7000', 0x00D346F1E52FCC4D92E643523A0E4841010000005A094FC304DF156F97579F0D6810CC51398BDC048076B11918F4E3C8CEEA01CC53696F66DE0AF62AC21019A1FA502AE2)
INSERT [dbo].[Tenant] ([Tenant_ID], [TenantName], [TenantContact], [TenantEmail], [TenantDeposit], [TenantCode], [TenantCreditCardNumber], [TenantCreditCardNumber_encrypt]) VALUES (104, N'John', CAST(8348885382 AS Numeric(10, 0)), N'John@husky.neu.edu', 699, N't000005', N'876-779-7000', 0x00D346F1E52FCC4D92E643523A0E484101000000EC8A4A557501A26D7DF26D8A72C851BE5DE5727E52FE8A3ABCD223E28E0E654EBF1FA5019FB4CEA659E9D6EB052586B2)
INSERT [dbo].[Tenant] ([Tenant_ID], [TenantName], [TenantContact], [TenantEmail], [TenantDeposit], [TenantCode], [TenantCreditCardNumber], [TenantCreditCardNumber_encrypt]) VALUES (105, N'Harry', CAST(8654796544 AS Numeric(10, 0)), N'Harry@gmail.com', 800, N't000006', N'876-780-7000', 0x00F9EBD42C56654E83E22C561DA38BAD02000000CE28BCEB5285D69E7B35F7302B2D9925EA552517E107A3BE672E25F2146734F187AED5C5011965A30052B7D248EE4643)
INSERT [dbo].[Tenant] ([Tenant_ID], [TenantName], [TenantContact], [TenantEmail], [TenantDeposit], [TenantCode], [TenantCreditCardNumber], [TenantCreditCardNumber_encrypt]) VALUES (106, N'Karan', CAST(6039305884 AS Numeric(10, 0)), N'Karan@husky.neu.edu', 900, N't000007', N'876-781-7000', 0x00F9EBD42C56654E83E22C561DA38BAD020000001AEDB48936C6F99A1E078F0AA978AC556A3EFAA8567F64329CE69D1C7840CBC139C823541815D1E977255B4F8EF45512)
INSERT [dbo].[Tenant] ([Tenant_ID], [TenantName], [TenantContact], [TenantEmail], [TenantDeposit], [TenantCode], [TenantCreditCardNumber], [TenantCreditCardNumber_encrypt]) VALUES (107, N'Vasundhara', CAST(8578003377 AS Numeric(10, 0)), N'Vasundhara@husky.neu.edu', 1000, N't000008', N'876-783-7000', 0x00F9EBD42C56654E83E22C561DA38BAD02000000D6DC1CAC08A2CA0BCBAE704C374B194ECAE30E2D1BE7F232C6CDF73EEFAE64FC4799F1D6924A719C61EC040ED411372C)
INSERT [dbo].[Tenant] ([Tenant_ID], [TenantName], [TenantContact], [TenantEmail], [TenantDeposit], [TenantCode], [TenantCreditCardNumber], [TenantCreditCardNumber_encrypt]) VALUES (108, N'SiyuTu', CAST(8578009977 AS Numeric(10, 0)), N'Siyutu@husky.neu.edu', 900, N't000009', N'876-783-7001', 0x00F9EBD42C56654E83E22C561DA38BAD02000000E1AC21251EF8873470AF2896089C90EFE136C61AAE5B63DB4E0194851562CD47489BF84EC0189C65D39A594ECE6C0A45)
INSERT [dbo].[Tenant] ([Tenant_ID], [TenantName], [TenantContact], [TenantEmail], [TenantDeposit], [TenantCode], [TenantCreditCardNumber], [TenantCreditCardNumber_encrypt]) VALUES (109, N'XinYe', CAST(8579009977 AS Numeric(10, 0)), N'XinYe@husky.neu.edu', 500, N't000010', N'876-789-7001', 0x00F9EBD42C56654E83E22C561DA38BAD02000000E734AEA4F736AF279002B05E061F3D910DFA8F9042E0165018F03854EDD649286CD3A70219FB371F524A14339B02C73E)
SET IDENTITY_INSERT [dbo].[Tenant] OFF
SET IDENTITY_INSERT [dbo].[UnitAllocation] ON 

INSERT [dbo].[UnitAllocation] ([StartDate], [EndDate], [Tenant_ID], [UnitID], [UnitAllocationID]) VALUES (CAST(N'2019-01-01' AS Date), CAST(N'2020-12-31' AS Date), 100, 111, 1)
INSERT [dbo].[UnitAllocation] ([StartDate], [EndDate], [Tenant_ID], [UnitID], [UnitAllocationID]) VALUES (CAST(N'2019-01-01' AS Date), CAST(N'2019-12-31' AS Date), 100, 110, 2)
INSERT [dbo].[UnitAllocation] ([StartDate], [EndDate], [Tenant_ID], [UnitID], [UnitAllocationID]) VALUES (CAST(N'2016-01-01' AS Date), CAST(N'2019-12-31' AS Date), 102, 113, 3)
INSERT [dbo].[UnitAllocation] ([StartDate], [EndDate], [Tenant_ID], [UnitID], [UnitAllocationID]) VALUES (CAST(N'2017-01-01' AS Date), CAST(N'2019-08-31' AS Date), 101, 112, 4)
INSERT [dbo].[UnitAllocation] ([StartDate], [EndDate], [Tenant_ID], [UnitID], [UnitAllocationID]) VALUES (CAST(N'2015-01-01' AS Date), CAST(N'2015-12-01' AS Date), 103, 113, 5)
INSERT [dbo].[UnitAllocation] ([StartDate], [EndDate], [Tenant_ID], [UnitID], [UnitAllocationID]) VALUES (CAST(N'2017-01-01' AS Date), CAST(N'2018-07-31' AS Date), 104, 114, 6)
INSERT [dbo].[UnitAllocation] ([StartDate], [EndDate], [Tenant_ID], [UnitID], [UnitAllocationID]) VALUES (CAST(N'2015-08-01' AS Date), CAST(N'2019-12-31' AS Date), 105, 117, 8)
INSERT [dbo].[UnitAllocation] ([StartDate], [EndDate], [Tenant_ID], [UnitID], [UnitAllocationID]) VALUES (CAST(N'2016-03-01' AS Date), CAST(N'2019-12-31' AS Date), 106, 115, 9)
INSERT [dbo].[UnitAllocation] ([StartDate], [EndDate], [Tenant_ID], [UnitID], [UnitAllocationID]) VALUES (CAST(N'2015-01-01' AS Date), CAST(N'2019-12-31' AS Date), 107, 118, 10)
INSERT [dbo].[UnitAllocation] ([StartDate], [EndDate], [Tenant_ID], [UnitID], [UnitAllocationID]) VALUES (CAST(N'2015-01-01' AS Date), CAST(N'2019-12-31' AS Date), 108, 119, 11)
SET IDENTITY_INSERT [dbo].[UnitAllocation] OFF
SET IDENTITY_INSERT [dbo].[Payment] ON 

INSERT [dbo].[Payment] ([PaymentID], [Tenant_ID], [PaymentDate], [PaymentAmount], [PTransferMode], [UnitID]) VALUES (1010, 100, CAST(N'2019-01-09' AS Date), 1000, N'cash', 111)
INSERT [dbo].[Payment] ([PaymentID], [Tenant_ID], [PaymentDate], [PaymentAmount], [PTransferMode], [UnitID]) VALUES (1011, 100, CAST(N'2019-02-06' AS Date), 1000, N'cash', 111)
INSERT [dbo].[Payment] ([PaymentID], [Tenant_ID], [PaymentDate], [PaymentAmount], [PTransferMode], [UnitID]) VALUES (1012, 100, CAST(N'2019-03-05' AS Date), 1000, N'cash', 111)
INSERT [dbo].[Payment] ([PaymentID], [Tenant_ID], [PaymentDate], [PaymentAmount], [PTransferMode], [UnitID]) VALUES (1013, 100, CAST(N'2019-04-05' AS Date), 1000, N'cash', 111)
INSERT [dbo].[Payment] ([PaymentID], [Tenant_ID], [PaymentDate], [PaymentAmount], [PTransferMode], [UnitID]) VALUES (1014, 101, CAST(N'2019-01-05' AS Date), 1200, N'online', 112)
INSERT [dbo].[Payment] ([PaymentID], [Tenant_ID], [PaymentDate], [PaymentAmount], [PTransferMode], [UnitID]) VALUES (1015, 101, CAST(N'2019-01-05' AS Date), 1200, N'cash', 112)
INSERT [dbo].[Payment] ([PaymentID], [Tenant_ID], [PaymentDate], [PaymentAmount], [PTransferMode], [UnitID]) VALUES (1016, 101, CAST(N'2019-02-06' AS Date), 1200, N'cash', 112)
INSERT [dbo].[Payment] ([PaymentID], [Tenant_ID], [PaymentDate], [PaymentAmount], [PTransferMode], [UnitID]) VALUES (1017, 101, CAST(N'2019-03-05' AS Date), 1200, N'online', 112)
INSERT [dbo].[Payment] ([PaymentID], [Tenant_ID], [PaymentDate], [PaymentAmount], [PTransferMode], [UnitID]) VALUES (1018, 101, CAST(N'2019-06-05' AS Date), 1200, N'online', 112)
INSERT [dbo].[Payment] ([PaymentID], [Tenant_ID], [PaymentDate], [PaymentAmount], [PTransferMode], [UnitID]) VALUES (1019, 101, CAST(N'2019-07-05' AS Date), 1200, N'online', 112)
INSERT [dbo].[Payment] ([PaymentID], [Tenant_ID], [PaymentDate], [PaymentAmount], [PTransferMode], [UnitID]) VALUES (1020, 101, CAST(N'2019-08-09' AS Date), 1200, N'online', 112)
INSERT [dbo].[Payment] ([PaymentID], [Tenant_ID], [PaymentDate], [PaymentAmount], [PTransferMode], [UnitID]) VALUES (1021, 104, CAST(N'2017-01-01' AS Date), 1500, N'cash', 114)
INSERT [dbo].[Payment] ([PaymentID], [Tenant_ID], [PaymentDate], [PaymentAmount], [PTransferMode], [UnitID]) VALUES (1022, 104, CAST(N'2017-02-05' AS Date), 1500, N'cash', 114)
INSERT [dbo].[Payment] ([PaymentID], [Tenant_ID], [PaymentDate], [PaymentAmount], [PTransferMode], [UnitID]) VALUES (1023, 104, CAST(N'2017-03-04' AS Date), 1500, N'cash', 114)
INSERT [dbo].[Payment] ([PaymentID], [Tenant_ID], [PaymentDate], [PaymentAmount], [PTransferMode], [UnitID]) VALUES (1024, 104, CAST(N'2017-04-01' AS Date), 1500, N'online', 114)
INSERT [dbo].[Payment] ([PaymentID], [Tenant_ID], [PaymentDate], [PaymentAmount], [PTransferMode], [UnitID]) VALUES (1025, 104, CAST(N'2017-05-06' AS Date), 1500, N'cash', 114)
INSERT [dbo].[Payment] ([PaymentID], [Tenant_ID], [PaymentDate], [PaymentAmount], [PTransferMode], [UnitID]) VALUES (1026, 104, CAST(N'2017-06-01' AS Date), 1500, N'cash', 114)
INSERT [dbo].[Payment] ([PaymentID], [Tenant_ID], [PaymentDate], [PaymentAmount], [PTransferMode], [UnitID]) VALUES (1027, 104, CAST(N'2017-07-01' AS Date), 1500, N'cash', 114)
INSERT [dbo].[Payment] ([PaymentID], [Tenant_ID], [PaymentDate], [PaymentAmount], [PTransferMode], [UnitID]) VALUES (1028, 104, CAST(N'2017-08-01' AS Date), 1500, N'cash', 114)
INSERT [dbo].[Payment] ([PaymentID], [Tenant_ID], [PaymentDate], [PaymentAmount], [PTransferMode], [UnitID]) VALUES (1029, 104, CAST(N'2017-09-01' AS Date), 1500, N'cash', 114)
INSERT [dbo].[Payment] ([PaymentID], [Tenant_ID], [PaymentDate], [PaymentAmount], [PTransferMode], [UnitID]) VALUES (1030, 104, CAST(N'2017-10-01' AS Date), 1500, N'cash', 114)
INSERT [dbo].[Payment] ([PaymentID], [Tenant_ID], [PaymentDate], [PaymentAmount], [PTransferMode], [UnitID]) VALUES (1040, 105, CAST(N'2018-01-11' AS Date), 1500, N'cash', 117)
INSERT [dbo].[Payment] ([PaymentID], [Tenant_ID], [PaymentDate], [PaymentAmount], [PTransferMode], [UnitID]) VALUES (1041, 105, CAST(N'2018-02-05' AS Date), 1500, N'cash', 117)
INSERT [dbo].[Payment] ([PaymentID], [Tenant_ID], [PaymentDate], [PaymentAmount], [PTransferMode], [UnitID]) VALUES (1042, 105, CAST(N'2018-03-04' AS Date), 1500, N'cash', 117)
INSERT [dbo].[Payment] ([PaymentID], [Tenant_ID], [PaymentDate], [PaymentAmount], [PTransferMode], [UnitID]) VALUES (1043, 105, CAST(N'2018-04-01' AS Date), 1500, N'online', 117)
INSERT [dbo].[Payment] ([PaymentID], [Tenant_ID], [PaymentDate], [PaymentAmount], [PTransferMode], [UnitID]) VALUES (1044, 105, CAST(N'2018-05-06' AS Date), 1500, N'online', 117)
INSERT [dbo].[Payment] ([PaymentID], [Tenant_ID], [PaymentDate], [PaymentAmount], [PTransferMode], [UnitID]) VALUES (1045, 105, CAST(N'2018-06-01' AS Date), 1500, N'cash', 117)
INSERT [dbo].[Payment] ([PaymentID], [Tenant_ID], [PaymentDate], [PaymentAmount], [PTransferMode], [UnitID]) VALUES (1046, 105, CAST(N'2018-07-03' AS Date), 1500, N'online', 117)
INSERT [dbo].[Payment] ([PaymentID], [Tenant_ID], [PaymentDate], [PaymentAmount], [PTransferMode], [UnitID]) VALUES (1047, 105, CAST(N'2018-08-02' AS Date), 1500, N'cash', 117)
INSERT [dbo].[Payment] ([PaymentID], [Tenant_ID], [PaymentDate], [PaymentAmount], [PTransferMode], [UnitID]) VALUES (1048, 105, CAST(N'2018-09-01' AS Date), 1500, N'cash', 117)
INSERT [dbo].[Payment] ([PaymentID], [Tenant_ID], [PaymentDate], [PaymentAmount], [PTransferMode], [UnitID]) VALUES (1049, 105, CAST(N'2018-10-01' AS Date), 1500, N'cash', 117)
INSERT [dbo].[Payment] ([PaymentID], [Tenant_ID], [PaymentDate], [PaymentAmount], [PTransferMode], [UnitID]) VALUES (1059, 101, CAST(N'2017-01-01' AS Date), 1200, N'cash', 112)
INSERT [dbo].[Payment] ([PaymentID], [Tenant_ID], [PaymentDate], [PaymentAmount], [PTransferMode], [UnitID]) VALUES (1060, 101, CAST(N'2017-02-02' AS Date), 1200, N'cash', 112)
INSERT [dbo].[Payment] ([PaymentID], [Tenant_ID], [PaymentDate], [PaymentAmount], [PTransferMode], [UnitID]) VALUES (1061, 101, CAST(N'2017-03-02' AS Date), 1200, N'cash', 112)
INSERT [dbo].[Payment] ([PaymentID], [Tenant_ID], [PaymentDate], [PaymentAmount], [PTransferMode], [UnitID]) VALUES (1062, 101, CAST(N'2017-04-02' AS Date), 1200, N'cash', 112)
INSERT [dbo].[Payment] ([PaymentID], [Tenant_ID], [PaymentDate], [PaymentAmount], [PTransferMode], [UnitID]) VALUES (1063, 101, CAST(N'2017-05-06' AS Date), 1200, N'cash', 112)
INSERT [dbo].[Payment] ([PaymentID], [Tenant_ID], [PaymentDate], [PaymentAmount], [PTransferMode], [UnitID]) VALUES (1064, 101, CAST(N'2017-07-02' AS Date), 1200, N'cash', 112)
INSERT [dbo].[Payment] ([PaymentID], [Tenant_ID], [PaymentDate], [PaymentAmount], [PTransferMode], [UnitID]) VALUES (1065, 101, CAST(N'2017-08-02' AS Date), 1200, N'cash', 112)
INSERT [dbo].[Payment] ([PaymentID], [Tenant_ID], [PaymentDate], [PaymentAmount], [PTransferMode], [UnitID]) VALUES (1066, 101, CAST(N'2017-09-02' AS Date), 1200, N'cash', 112)
INSERT [dbo].[Payment] ([PaymentID], [Tenant_ID], [PaymentDate], [PaymentAmount], [PTransferMode], [UnitID]) VALUES (1067, 101, CAST(N'2017-10-02' AS Date), 1200, N'cash', 112)
SET IDENTITY_INSERT [dbo].[Payment] OFF
SET IDENTITY_INSERT [dbo].[WorksOn] ON 

INSERT [dbo].[WorksOn] ([UnitID], [VendorID], [ContractStartDate], [ContractEndDate], [WorksOnID]) VALUES (110, 100, CAST(N'2018-01-05' AS Date), CAST(N'2019-01-05' AS Date), 2)
INSERT [dbo].[WorksOn] ([UnitID], [VendorID], [ContractStartDate], [ContractEndDate], [WorksOnID]) VALUES (111, 100, CAST(N'2018-03-05' AS Date), CAST(N'2019-03-05' AS Date), 3)
INSERT [dbo].[WorksOn] ([UnitID], [VendorID], [ContractStartDate], [ContractEndDate], [WorksOnID]) VALUES (112, 101, CAST(N'2018-02-02' AS Date), CAST(N'2020-02-02' AS Date), 4)
INSERT [dbo].[WorksOn] ([UnitID], [VendorID], [ContractStartDate], [ContractEndDate], [WorksOnID]) VALUES (112, 102, CAST(N'2018-09-08' AS Date), CAST(N'2021-09-08' AS Date), 5)
SET IDENTITY_INSERT [dbo].[WorksOn] OFF

