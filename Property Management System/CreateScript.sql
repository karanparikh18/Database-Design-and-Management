USE [master]
GO
/****** Object:  Database [PropertyManagement]    Script Date: 11/23/2019 8:36:42 PM ******/
CREATE DATABASE [PropertyManagement]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PropertyManagement', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\PropertyManagement.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PropertyManagement_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\PropertyManagement_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [PropertyManagement] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PropertyManagement].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PropertyManagement] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PropertyManagement] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PropertyManagement] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PropertyManagement] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PropertyManagement] SET ARITHABORT OFF 
GO
ALTER DATABASE [PropertyManagement] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PropertyManagement] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PropertyManagement] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PropertyManagement] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PropertyManagement] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PropertyManagement] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PropertyManagement] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PropertyManagement] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PropertyManagement] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PropertyManagement] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PropertyManagement] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PropertyManagement] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PropertyManagement] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PropertyManagement] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PropertyManagement] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PropertyManagement] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PropertyManagement] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PropertyManagement] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [PropertyManagement] SET  MULTI_USER 
GO
ALTER DATABASE [PropertyManagement] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PropertyManagement] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PropertyManagement] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PropertyManagement] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [PropertyManagement] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'PropertyManagement', N'ON'
GO
ALTER DATABASE [PropertyManagement] SET QUERY_STORE = OFF
GO
USE [PropertyManagement]
GO
/****** Object:  UserDefinedFunction [dbo].[CheckCreditEligibilityCrieteria]    Script Date: 11/23/2019 8:36:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Function [dbo].[CheckCreditEligibilityCrieteria](@a int)
returns char(3)
AS
Begin
Declare @check char(3)
Select @check =case when @a>700
      Then 'YES'
	  Else 'NO'
End
return @check
End
GO
/****** Object:  UserDefinedFunction [dbo].[getRank]    Script Date: 11/23/2019 8:36:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[getRank] (@unitID int)

returns int

as

BEGIN

       declare @rankCal int

       select @rankCal =

       (select case

       when sum(DistanceID) = 5 then 1

       when sum(DistanceID) = 6 then 2

       when sum(DistanceID) = 7 then 3

       when sum(DistanceID) = 8 then 4

       else 5

       end as CRank

       from UnitScore us group by UnitID having us.UnitID = @unitID )

        

       return @rankCal

END
GO
/****** Object:  Table [dbo].[Property]    Script Date: 11/23/2019 8:36:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Property](
	[PropID] [int] IDENTITY(100,1) NOT NULL,
	[PropName] [varchar](30) NULL,
	[PropAddress1] [varchar](30) NULL,
	[PropAddress2] [varchar](30) NULL,
	[PropCity] [varchar](30) NULL,
	[PropState] [varchar](30) NULL,
	[Pin] [int] NULL,
	[PropMgrID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PropID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PropertyManager]    Script Date: 11/23/2019 8:36:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PropertyManager](
	[PropMgrID] [int] IDENTITY(1000,1) NOT NULL,
	[PMgrName] [varchar](30) NULL,
	[PMgrLocation] [varchar](30) NULL,
	[PMgrEmail] [varchar](30) NULL,
	[PMgrContact] [numeric](10, 0) NULL,
PRIMARY KEY CLUSTERED 
(
	[PropMgrID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Unit]    Script Date: 11/23/2019 8:36:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Unit](
	[UnitID] [int] IDENTITY(100,1) NOT NULL,
	[UArea] [int] NULL,
	[ULevel] [int] NULL,
	[UBedroom] [int] NULL,
	[UPerMonthRent] [int] NULL,
	[UnitTypeID] [int] NOT NULL,
	[PropID] [int] NOT NULL,
	[UnitCode] [varchar](20) NULL,
	[DateCreated] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[UnitID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UnitType]    Script Date: 11/23/2019 8:36:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UnitType](
	[UnitTypeID] [int] IDENTITY(1,1) NOT NULL,
	[UnitTypeDesc] [varchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[UnitTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[propertyinfo]    Script Date: 11/23/2019 8:36:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[propertyinfo] as 
Select pm.PMgrName, pm.PMgrLocation,p.propname, p.PropAddress1, p.PropAddress2, p.PropCity, p.PropState, u.UArea, ut.UnitTypeDesc, u.UBedroom, u.UPerMonthRent
from propertymanager as pm join property as p on pm.PropMgrID=p.PropMgrID
join unit as u on p.propid=u.propid 
join UnitType as ut on u.UnitTypeID=ut.UnitTypeID;
GO
/****** Object:  Table [dbo].[UnitScore]    Script Date: 11/23/2019 8:36:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UnitScore](
	[UnitScoreID] [int] IDENTITY(1,1) NOT NULL,
	[UnitID] [int] NOT NULL,
	[FacilityID] [int] NOT NULL,
	[DistanceID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UnitScoreID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[UnitRank]    Script Date: 11/23/2019 8:36:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[UnitRank] as 
select distinct(UnitID), dbo.getRank(UnitID) as Rank
from UnitScore group by UnitID
GO
/****** Object:  Table [dbo].[Payment]    Script Date: 11/23/2019 8:36:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payment](
	[PaymentID] [int] IDENTITY(1000,1) NOT NULL,
	[Tenant_ID] [int] NOT NULL,
	[PaymentDate] [date] NULL,
	[PaymentAmount] [float] NULL,
	[PTransferMode] [varchar](30) NULL,
	[UnitID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PaymentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tenant]    Script Date: 11/23/2019 8:36:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tenant](
	[Tenant_ID] [int] IDENTITY(100,1) NOT NULL,
	[TenantName] [varchar](30) NULL,
	[TenantContact] [numeric](10, 0) NULL,
	[TenantEmail] [varchar](30) NULL,
	[TenantDeposit] [float] NULL,
	[TenantCode] [varchar](20) NULL,
	[TenantCreditCardNumber] [varchar](30) NULL,
	[TenantCreditCardNumber_encrypt] [varbinary](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[Tenant_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UnitAllocation]    Script Date: 11/23/2019 8:36:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UnitAllocation](
	[StartDate] [date] NULL,
	[EndDate] [date] NULL,
	[Tenant_ID] [int] NOT NULL,
	[UnitID] [int] NOT NULL,
	[UnitAllocationID] [int] IDENTITY(1,1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UnitAllocationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[TenantTerm]    Script Date: 11/23/2019 8:36:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[TenantTerm] as   
select t.TenantName, t.TenantContact, t.TenantDeposit, u.UnitCode,ua.StartDate, ua.EndDate from tenant as t   
join payment as p on t.Tenant_ID=p.Tenant_ID  
join unitallocation as ua on t.Tenant_ID=ua.Tenant_ID  
join unit as u on ua.UnitID=u.UnitID  
join property as po on u.PropID=po.PropID
Group by tenantname,tenantcontact,TenantDeposit,u.UnitCode,startdate,EndDate
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 11/23/2019 8:36:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[CustomerID] [int] IDENTITY(100,1) NOT NULL,
	[CustomerName] [varchar](30) NULL,
	[CustomerContact] [numeric](10, 0) NULL,
	[CustomerEmail] [varchar](30) NULL,
	[PreferredLocation] [varchar](30) NULL,
	[PreferredPrice] [int] NULL,
	[PreferredUnit] [varchar](30) NULL,
	[PropMgrID] [int] NOT NULL,
	[CreditEligibility] [varchar](3) NULL,
PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Distance]    Script Date: 11/23/2019 8:36:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Distance](
	[DistanceID] [int] IDENTITY(1,1) NOT NULL,
	[DistDesc] [varchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[DistanceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Facilities]    Script Date: 11/23/2019 8:36:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Facilities](
	[FacilityID] [int] IDENTITY(1,1) NOT NULL,
	[FacilityName] [varchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[FacilityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Maintenance]    Script Date: 11/23/2019 8:36:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Maintenance](
	[MaintenanceID] [int] IDENTITY(1,1) NOT NULL,
	[MaintenanceType] [varchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaintenanceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MaintenanceCost]    Script Date: 11/23/2019 8:36:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MaintenanceCost](
	[MaintenanceID] [int] NOT NULL,
	[CostperHour] [float] NULL,
	[VendorID] [int] NULL,
	[MaintenanceCostID] [int] IDENTITY(1,1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaintenanceCostID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PaymentRecords]    Script Date: 11/23/2019 8:36:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentRecords](
	[PaymentRecoredID] [int] IDENTITY(1,1) NOT NULL,
	[Tenant_ID] [int] NULL,
	[TenantName] [varchar](30) NULL,
	[Unit] [int] NULL,
	[UnitCode] [varchar](30) NULL,
	[PaymentDate] [datetime] NULL,
	[PaymentAmount] [float] NULL,
	[ActionDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[PaymentRecoredID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vendor]    Script Date: 11/23/2019 8:36:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vendor](
	[VendorID] [int] IDENTITY(100,1) NOT NULL,
	[VendorName] [varchar](30) NULL,
	[VAddress1] [varchar](30) NULL,
	[VAddress2] [varchar](30) NULL,
	[VCity] [varchar](30) NULL,
	[VState] [varchar](30) NULL,
	[VPin] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[VendorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WorksOn]    Script Date: 11/23/2019 8:36:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WorksOn](
	[UnitID] [int] NOT NULL,
	[VendorID] [int] NOT NULL,
	[ContractStartDate] [date] NULL,
	[ContractEndDate] [date] NULL,
	[WorksOnID] [int] IDENTITY(1,1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[WorksOnID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Index [MaintenanceCostVendor_IND]    Script Date: 11/23/2019 8:36:42 PM ******/
CREATE NONCLUSTERED INDEX [MaintenanceCostVendor_IND] ON [dbo].[MaintenanceCost]
(
	[VendorID] ASC,
	[MaintenanceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [Tenant_Unit_IND]    Script Date: 11/23/2019 8:36:42 PM ******/
CREATE NONCLUSTERED INDEX [Tenant_Unit_IND] ON [dbo].[Payment]
(
	[Tenant_ID] ASC,
	[UnitID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [PropertyID_IND]    Script Date: 11/23/2019 8:36:42 PM ******/
CREATE NONCLUSTERED INDEX [PropertyID_IND] ON [dbo].[Property]
(
	[PropName] ASC,
	[PropMgrID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [TenantDeposit_IND]    Script Date: 11/23/2019 8:36:42 PM ******/
CREATE NONCLUSTERED INDEX [TenantDeposit_IND] ON [dbo].[Tenant]
(
	[TenantDeposit] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UnitPropId_IND]    Script Date: 11/23/2019 8:36:42 PM ******/
CREATE NONCLUSTERED INDEX [UnitPropId_IND] ON [dbo].[Unit]
(
	[PropID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [enddt_IND]    Script Date: 11/23/2019 8:36:42 PM ******/
CREATE NONCLUSTERED INDEX [enddt_IND] ON [dbo].[UnitAllocation]
(
	[EndDate] ASC,
	[UnitID] ASC,
	[Tenant_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UnitVendor_workson_IND]    Script Date: 11/23/2019 8:36:42 PM ******/
CREATE NONCLUSTERED INDEX [UnitVendor_workson_IND] ON [dbo].[WorksOn]
(
	[UnitID] ASC,
	[VendorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD FOREIGN KEY([PropMgrID])
REFERENCES [dbo].[PropertyManager] ([PropMgrID])
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD FOREIGN KEY([PropMgrID])
REFERENCES [dbo].[PropertyManager] ([PropMgrID])
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD FOREIGN KEY([PropMgrID])
REFERENCES [dbo].[PropertyManager] ([PropMgrID])
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD FOREIGN KEY([PropMgrID])
REFERENCES [dbo].[PropertyManager] ([PropMgrID])
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD FOREIGN KEY([PropMgrID])
REFERENCES [dbo].[PropertyManager] ([PropMgrID])
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD FOREIGN KEY([PropMgrID])
REFERENCES [dbo].[PropertyManager] ([PropMgrID])
GO
ALTER TABLE [dbo].[MaintenanceCost]  WITH CHECK ADD FOREIGN KEY([MaintenanceID])
REFERENCES [dbo].[Maintenance] ([MaintenanceID])
GO
ALTER TABLE [dbo].[MaintenanceCost]  WITH CHECK ADD FOREIGN KEY([MaintenanceID])
REFERENCES [dbo].[Maintenance] ([MaintenanceID])
GO
ALTER TABLE [dbo].[MaintenanceCost]  WITH CHECK ADD FOREIGN KEY([MaintenanceID])
REFERENCES [dbo].[Maintenance] ([MaintenanceID])
GO
ALTER TABLE [dbo].[MaintenanceCost]  WITH CHECK ADD FOREIGN KEY([MaintenanceID])
REFERENCES [dbo].[Maintenance] ([MaintenanceID])
GO
ALTER TABLE [dbo].[MaintenanceCost]  WITH CHECK ADD FOREIGN KEY([MaintenanceID])
REFERENCES [dbo].[Maintenance] ([MaintenanceID])
GO
ALTER TABLE [dbo].[MaintenanceCost]  WITH CHECK ADD FOREIGN KEY([MaintenanceID])
REFERENCES [dbo].[Maintenance] ([MaintenanceID])
GO
ALTER TABLE [dbo].[MaintenanceCost]  WITH CHECK ADD FOREIGN KEY([VendorID])
REFERENCES [dbo].[Vendor] ([VendorID])
GO
ALTER TABLE [dbo].[MaintenanceCost]  WITH CHECK ADD FOREIGN KEY([VendorID])
REFERENCES [dbo].[Vendor] ([VendorID])
GO
ALTER TABLE [dbo].[MaintenanceCost]  WITH CHECK ADD FOREIGN KEY([VendorID])
REFERENCES [dbo].[Vendor] ([VendorID])
GO
ALTER TABLE [dbo].[MaintenanceCost]  WITH CHECK ADD FOREIGN KEY([VendorID])
REFERENCES [dbo].[Vendor] ([VendorID])
GO
ALTER TABLE [dbo].[MaintenanceCost]  WITH CHECK ADD FOREIGN KEY([VendorID])
REFERENCES [dbo].[Vendor] ([VendorID])
GO
ALTER TABLE [dbo].[MaintenanceCost]  WITH CHECK ADD FOREIGN KEY([VendorID])
REFERENCES [dbo].[Vendor] ([VendorID])
GO
ALTER TABLE [dbo].[Payment]  WITH CHECK ADD FOREIGN KEY([Tenant_ID])
REFERENCES [dbo].[Tenant] ([Tenant_ID])
GO
ALTER TABLE [dbo].[Payment]  WITH CHECK ADD FOREIGN KEY([Tenant_ID])
REFERENCES [dbo].[Tenant] ([Tenant_ID])
GO
ALTER TABLE [dbo].[Payment]  WITH CHECK ADD FOREIGN KEY([Tenant_ID])
REFERENCES [dbo].[Tenant] ([Tenant_ID])
GO
ALTER TABLE [dbo].[Payment]  WITH CHECK ADD FOREIGN KEY([Tenant_ID])
REFERENCES [dbo].[Tenant] ([Tenant_ID])
GO
ALTER TABLE [dbo].[Payment]  WITH CHECK ADD FOREIGN KEY([Tenant_ID])
REFERENCES [dbo].[Tenant] ([Tenant_ID])
GO
ALTER TABLE [dbo].[Payment]  WITH CHECK ADD FOREIGN KEY([Tenant_ID])
REFERENCES [dbo].[Tenant] ([Tenant_ID])
GO
ALTER TABLE [dbo].[Payment]  WITH CHECK ADD FOREIGN KEY([UnitID])
REFERENCES [dbo].[Unit] ([UnitID])
GO
ALTER TABLE [dbo].[Payment]  WITH CHECK ADD FOREIGN KEY([UnitID])
REFERENCES [dbo].[Unit] ([UnitID])
GO
ALTER TABLE [dbo].[Payment]  WITH CHECK ADD FOREIGN KEY([UnitID])
REFERENCES [dbo].[Unit] ([UnitID])
GO
ALTER TABLE [dbo].[Payment]  WITH CHECK ADD FOREIGN KEY([UnitID])
REFERENCES [dbo].[Unit] ([UnitID])
GO
ALTER TABLE [dbo].[Payment]  WITH CHECK ADD FOREIGN KEY([UnitID])
REFERENCES [dbo].[Unit] ([UnitID])
GO
ALTER TABLE [dbo].[Payment]  WITH CHECK ADD FOREIGN KEY([UnitID])
REFERENCES [dbo].[Unit] ([UnitID])
GO
ALTER TABLE [dbo].[Property]  WITH CHECK ADD FOREIGN KEY([PropMgrID])
REFERENCES [dbo].[PropertyManager] ([PropMgrID])
GO
ALTER TABLE [dbo].[Property]  WITH CHECK ADD FOREIGN KEY([PropMgrID])
REFERENCES [dbo].[PropertyManager] ([PropMgrID])
GO
ALTER TABLE [dbo].[Property]  WITH CHECK ADD FOREIGN KEY([PropMgrID])
REFERENCES [dbo].[PropertyManager] ([PropMgrID])
GO
ALTER TABLE [dbo].[Property]  WITH CHECK ADD FOREIGN KEY([PropMgrID])
REFERENCES [dbo].[PropertyManager] ([PropMgrID])
GO
ALTER TABLE [dbo].[Property]  WITH CHECK ADD FOREIGN KEY([PropMgrID])
REFERENCES [dbo].[PropertyManager] ([PropMgrID])
GO
ALTER TABLE [dbo].[Property]  WITH CHECK ADD FOREIGN KEY([PropMgrID])
REFERENCES [dbo].[PropertyManager] ([PropMgrID])
GO
ALTER TABLE [dbo].[Unit]  WITH CHECK ADD FOREIGN KEY([PropID])
REFERENCES [dbo].[Property] ([PropID])
GO
ALTER TABLE [dbo].[Unit]  WITH CHECK ADD FOREIGN KEY([PropID])
REFERENCES [dbo].[Property] ([PropID])
GO
ALTER TABLE [dbo].[Unit]  WITH CHECK ADD FOREIGN KEY([PropID])
REFERENCES [dbo].[Property] ([PropID])
GO
ALTER TABLE [dbo].[Unit]  WITH CHECK ADD FOREIGN KEY([PropID])
REFERENCES [dbo].[Property] ([PropID])
GO
ALTER TABLE [dbo].[Unit]  WITH CHECK ADD FOREIGN KEY([PropID])
REFERENCES [dbo].[Property] ([PropID])
GO
ALTER TABLE [dbo].[Unit]  WITH CHECK ADD FOREIGN KEY([PropID])
REFERENCES [dbo].[Property] ([PropID])
GO
ALTER TABLE [dbo].[Unit]  WITH CHECK ADD FOREIGN KEY([UnitTypeID])
REFERENCES [dbo].[UnitType] ([UnitTypeID])
GO
ALTER TABLE [dbo].[Unit]  WITH CHECK ADD FOREIGN KEY([UnitTypeID])
REFERENCES [dbo].[UnitType] ([UnitTypeID])
GO
ALTER TABLE [dbo].[Unit]  WITH CHECK ADD FOREIGN KEY([UnitTypeID])
REFERENCES [dbo].[UnitType] ([UnitTypeID])
GO
ALTER TABLE [dbo].[Unit]  WITH CHECK ADD FOREIGN KEY([UnitTypeID])
REFERENCES [dbo].[UnitType] ([UnitTypeID])
GO
ALTER TABLE [dbo].[Unit]  WITH CHECK ADD FOREIGN KEY([UnitTypeID])
REFERENCES [dbo].[UnitType] ([UnitTypeID])
GO
ALTER TABLE [dbo].[Unit]  WITH CHECK ADD FOREIGN KEY([UnitTypeID])
REFERENCES [dbo].[UnitType] ([UnitTypeID])
GO
ALTER TABLE [dbo].[UnitAllocation]  WITH CHECK ADD FOREIGN KEY([Tenant_ID])
REFERENCES [dbo].[Tenant] ([Tenant_ID])
GO
ALTER TABLE [dbo].[UnitAllocation]  WITH CHECK ADD FOREIGN KEY([Tenant_ID])
REFERENCES [dbo].[Tenant] ([Tenant_ID])
GO
ALTER TABLE [dbo].[UnitAllocation]  WITH CHECK ADD FOREIGN KEY([Tenant_ID])
REFERENCES [dbo].[Tenant] ([Tenant_ID])
GO
ALTER TABLE [dbo].[UnitAllocation]  WITH CHECK ADD FOREIGN KEY([Tenant_ID])
REFERENCES [dbo].[Tenant] ([Tenant_ID])
GO
ALTER TABLE [dbo].[UnitAllocation]  WITH CHECK ADD FOREIGN KEY([Tenant_ID])
REFERENCES [dbo].[Tenant] ([Tenant_ID])
GO
ALTER TABLE [dbo].[UnitAllocation]  WITH CHECK ADD FOREIGN KEY([Tenant_ID])
REFERENCES [dbo].[Tenant] ([Tenant_ID])
GO
ALTER TABLE [dbo].[UnitAllocation]  WITH CHECK ADD FOREIGN KEY([UnitID])
REFERENCES [dbo].[Unit] ([UnitID])
GO
ALTER TABLE [dbo].[UnitAllocation]  WITH CHECK ADD FOREIGN KEY([UnitID])
REFERENCES [dbo].[Unit] ([UnitID])
GO
ALTER TABLE [dbo].[UnitAllocation]  WITH CHECK ADD FOREIGN KEY([UnitID])
REFERENCES [dbo].[Unit] ([UnitID])
GO
ALTER TABLE [dbo].[UnitAllocation]  WITH CHECK ADD FOREIGN KEY([UnitID])
REFERENCES [dbo].[Unit] ([UnitID])
GO
ALTER TABLE [dbo].[UnitAllocation]  WITH CHECK ADD FOREIGN KEY([UnitID])
REFERENCES [dbo].[Unit] ([UnitID])
GO
ALTER TABLE [dbo].[UnitAllocation]  WITH CHECK ADD FOREIGN KEY([UnitID])
REFERENCES [dbo].[Unit] ([UnitID])
GO
ALTER TABLE [dbo].[UnitScore]  WITH CHECK ADD FOREIGN KEY([DistanceID])
REFERENCES [dbo].[Distance] ([DistanceID])
GO
ALTER TABLE [dbo].[UnitScore]  WITH CHECK ADD FOREIGN KEY([FacilityID])
REFERENCES [dbo].[Facilities] ([FacilityID])
GO
ALTER TABLE [dbo].[UnitScore]  WITH CHECK ADD FOREIGN KEY([UnitID])
REFERENCES [dbo].[Unit] ([UnitID])
GO
ALTER TABLE [dbo].[WorksOn]  WITH CHECK ADD FOREIGN KEY([UnitID])
REFERENCES [dbo].[Unit] ([UnitID])
GO
ALTER TABLE [dbo].[WorksOn]  WITH CHECK ADD FOREIGN KEY([UnitID])
REFERENCES [dbo].[Unit] ([UnitID])
GO
ALTER TABLE [dbo].[WorksOn]  WITH CHECK ADD FOREIGN KEY([UnitID])
REFERENCES [dbo].[Unit] ([UnitID])
GO
ALTER TABLE [dbo].[WorksOn]  WITH CHECK ADD FOREIGN KEY([UnitID])
REFERENCES [dbo].[Unit] ([UnitID])
GO
ALTER TABLE [dbo].[WorksOn]  WITH CHECK ADD FOREIGN KEY([UnitID])
REFERENCES [dbo].[Unit] ([UnitID])
GO
ALTER TABLE [dbo].[WorksOn]  WITH CHECK ADD FOREIGN KEY([UnitID])
REFERENCES [dbo].[Unit] ([UnitID])
GO
ALTER TABLE [dbo].[WorksOn]  WITH CHECK ADD FOREIGN KEY([VendorID])
REFERENCES [dbo].[Vendor] ([VendorID])
GO
ALTER TABLE [dbo].[WorksOn]  WITH CHECK ADD FOREIGN KEY([VendorID])
REFERENCES [dbo].[Vendor] ([VendorID])
GO
ALTER TABLE [dbo].[WorksOn]  WITH CHECK ADD FOREIGN KEY([VendorID])
REFERENCES [dbo].[Vendor] ([VendorID])
GO
ALTER TABLE [dbo].[WorksOn]  WITH CHECK ADD FOREIGN KEY([VendorID])
REFERENCES [dbo].[Vendor] ([VendorID])
GO
ALTER TABLE [dbo].[WorksOn]  WITH CHECK ADD FOREIGN KEY([VendorID])
REFERENCES [dbo].[Vendor] ([VendorID])
GO
ALTER TABLE [dbo].[WorksOn]  WITH CHECK ADD FOREIGN KEY([VendorID])
REFERENCES [dbo].[Vendor] ([VendorID])
GO
ALTER TABLE [dbo].[Distance]  WITH CHECK ADD CHECK  (([DistDesc]='More than 1 mile' OR [DistDesc]='0-1 miles' OR [DistDesc]='In House'))
GO
ALTER TABLE [dbo].[Facilities]  WITH CHECK ADD CHECK  (([FacilityName]='TStation' OR [FacilityName]='Hospital' OR [FacilityName]='School' OR [FacilityName]='ATM' OR [FacilityName]='Market' OR [FacilityName]='Laundry'))
GO
ALTER TABLE [dbo].[Facilities]  WITH CHECK ADD CHECK  (([FacilityName]='TStation' OR [FacilityName]='Hospital' OR [FacilityName]='School' OR [FacilityName]='ATM' OR [FacilityName]='Market' OR [FacilityName]='Laundry'))
GO
ALTER TABLE [dbo].[Facilities]  WITH CHECK ADD CHECK  (([FacilityName]='TStation' OR [FacilityName]='Hospital' OR [FacilityName]='School' OR [FacilityName]='ATM' OR [FacilityName]='Market' OR [FacilityName]='Laundry'))
GO
ALTER TABLE [dbo].[Facilities]  WITH CHECK ADD CHECK  (([FacilityName]='TStation' OR [FacilityName]='Hospital' OR [FacilityName]='School' OR [FacilityName]='ATM' OR [FacilityName]='Market' OR [FacilityName]='Laundry'))
GO
ALTER TABLE [dbo].[Facilities]  WITH CHECK ADD CHECK  (([FacilityName]='TStation' OR [FacilityName]='Hospital' OR [FacilityName]='School' OR [FacilityName]='ATM' OR [FacilityName]='Market' OR [FacilityName]='Laundry'))
GO
ALTER TABLE [dbo].[Facilities]  WITH CHECK ADD CHECK  (([FacilityName]='TStation' OR [FacilityName]='Hospital' OR [FacilityName]='School' OR [FacilityName]='ATM' OR [FacilityName]='Market' OR [FacilityName]='Laundry'))
GO
ALTER TABLE [dbo].[Payment]  WITH CHECK ADD CHECK  (([PTransferMode]='Cash' OR [PTransferMode]='Cheque' OR [PTransferMode]='Online'))
GO
ALTER TABLE [dbo].[Payment]  WITH CHECK ADD CHECK  (([PTransferMode]='Cash' OR [PTransferMode]='Cheque' OR [PTransferMode]='Online'))
GO
ALTER TABLE [dbo].[Payment]  WITH CHECK ADD CHECK  (([PTransferMode]='Cash' OR [PTransferMode]='Cheque' OR [PTransferMode]='Online'))
GO
ALTER TABLE [dbo].[Payment]  WITH CHECK ADD CHECK  (([PTransferMode]='Cash' OR [PTransferMode]='Cheque' OR [PTransferMode]='Online'))
GO
ALTER TABLE [dbo].[Payment]  WITH CHECK ADD CHECK  (([PTransferMode]='Cash' OR [PTransferMode]='Cheque' OR [PTransferMode]='Online'))
GO
ALTER TABLE [dbo].[Payment]  WITH CHECK ADD CHECK  (([PTransferMode]='Cash' OR [PTransferMode]='Cheque' OR [PTransferMode]='Online'))
GO
ALTER TABLE [dbo].[UnitType]  WITH CHECK ADD  CONSTRAINT [CHK_UnitTypeDesc] CHECK  (([UnitTypeDesc]='Commercial' OR [UnitTypeDesc]='Residential'))
GO
ALTER TABLE [dbo].[UnitType] CHECK CONSTRAINT [CHK_UnitTypeDesc]
GO
/****** Object:  StoredProcedure [dbo].[CalculateRank]    Script Date: 11/23/2019 8:36:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


Create procedure [dbo].[CalculateRank] @unitID int,
@Rank int OUTPUT
AS
BEGIN
	declare @rankCal int
	select @Rank =
	(select case 
	when sum(DistanceID) = 5 then 1
	when sum(DistanceID) = 6 then 2
	when sum(DistanceID) = 7 then 3
	when sum(DistanceID) = 8 then 4
	else 5
	end as CRank
	from UnitScore us group by UnitID having us.UnitID = @unitID )
	 
	return @Rank
END
GO
/****** Object:  StoredProcedure [dbo].[CalculateRentIncrease]    Script Date: 11/23/2019 8:36:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[CalculateRentIncrease] @u int,@dt DateTime,
@rent int Output
As
Begin
Select @rent =
UPerMonthRent*(power(1.100,DATEDIFF(Year,DateCreated,@dt)))
from Unit
where unitID=@u
END
GO
/****** Object:  StoredProcedure [dbo].[VacantUnits]    Script Date: 11/23/2019 8:36:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[VacantUnits] @a Datetime
As
Begin
Select u.UnitCode,ua.UnitID,ua.EndDate,A.maxdt,A.UnitID
From Unit u
Inner Join UnitAllocation ua
on u.UnitID=ua.UnitID
Inner Join 
(
Select UnitID,max(EndDate) maxdt
from UnitAllocation
Group by UnitID
)A
on ua.UnitID=A.UnitID
where
A.maxdt<=@a
End
GO
/****** Object:  StoredProcedure [dbo].[VendorInformation]    Script Date: 11/23/2019 8:36:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[VendorInformation] @vendorID int as
BEGIN
	select v.VendorID, v.VendorName, w.UnitID as WorkingOnUnit, w.ContractStartDate,
	w.ContractEndDate
	from Vendor v join WorksOn w
	on v.VendorID = w.VendorID
	where v.VendorID = @vendorID

END
GO
USE [master]
GO
ALTER DATABASE [PropertyManagement] SET  READ_WRITE 
GO
