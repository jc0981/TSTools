USE [TS_OLTP_PRD5017]
GO

/****** Object:  Schema [linked_user]    Script Date: 07/24/2015 11:22:56 ******/
IF  EXISTS (SELECT * FROM sys.schemas WHERE name = N'linked_user')
DROP SCHEMA [linked_user]
GO

/****** Object:  Schema [TS_BusOffMgmt]    Script Date: 07/24/2015 11:22:56 ******/
IF  EXISTS (SELECT * FROM sys.schemas WHERE name = N'TS_BusOffMgmt')
DROP SCHEMA [TS_BusOffMgmt]
GO

/****** Object:  Schema [TS_BusOffStaff]    Script Date: 07/24/2015 11:22:56 ******/
IF  EXISTS (SELECT * FROM sys.schemas WHERE name = N'TS_BusOffStaff')
DROP SCHEMA [TS_BusOffStaff]
GO

/****** Object:  Schema [TS_Clinicians]    Script Date: 07/24/2015 11:22:56 ******/
IF  EXISTS (SELECT * FROM sys.schemas WHERE name = N'TS_Clinicians')
DROP SCHEMA [TS_Clinicians]
GO

/****** Object:  Schema [TS_FacilityMgmt]    Script Date: 07/24/2015 11:22:56 ******/
IF  EXISTS (SELECT * FROM sys.schemas WHERE name = N'TS_FacilityMgmt')
DROP SCHEMA [TS_FacilityMgmt]
GO

/****** Object:  Schema [TS_FacilityStaff]    Script Date: 07/24/2015 11:22:56 ******/
IF  EXISTS (SELECT * FROM sys.schemas WHERE name = N'TS_FacilityStaff')
DROP SCHEMA [TS_FacilityStaff]
GO

/****** Object:  Schema [TS_MTSPackages]    Script Date: 07/24/2015 11:22:56 ******/
IF  EXISTS (SELECT * FROM sys.schemas WHERE name = N'TS_MTSPackages')
DROP SCHEMA [TS_MTSPackages]
GO

/****** Object:  Schema [TS_Reports]    Script Date: 07/24/2015 11:22:56 ******/
IF  EXISTS (SELECT * FROM sys.schemas WHERE name = N'TS_Reports')
DROP SCHEMA [TS_Reports]
GO

/****** Object:  Schema [TS_Role_BusOff]    Script Date: 07/24/2015 11:22:56 ******/
IF  EXISTS (SELECT * FROM sys.schemas WHERE name = N'TS_Role_BusOff')
DROP SCHEMA [TS_Role_BusOff]
GO

/****** Object:  Schema [TS_Role_Facility]    Script Date: 07/24/2015 11:22:56 ******/
IF  EXISTS (SELECT * FROM sys.schemas WHERE name = N'TS_Role_Facility')
DROP SCHEMA [TS_Role_Facility]
GO

/****** Object:  Schema [TS_Role_LinkedUser]    Script Date: 07/24/2015 11:22:56 ******/
IF  EXISTS (SELECT * FROM sys.schemas WHERE name = N'TS_Role_LinkedUser')
DROP SCHEMA [TS_Role_LinkedUser]
GO

/****** Object:  Schema [TS_Role_MTSPackages]    Script Date: 07/24/2015 11:22:56 ******/
IF  EXISTS (SELECT * FROM sys.schemas WHERE name = N'TS_Role_MTSPackages')
DROP SCHEMA [TS_Role_MTSPackages]
GO

/****** Object:  Schema [TS_Role_Reporting]    Script Date: 07/24/2015 11:22:56 ******/
IF  EXISTS (SELECT * FROM sys.schemas WHERE name = N'TS_Role_Reporting')
DROP SCHEMA [TS_Role_Reporting]
GO

/****** Object:  Schema [TS_Role_Services]    Script Date: 07/24/2015 11:22:56 ******/
IF  EXISTS (SELECT * FROM sys.schemas WHERE name = N'TS_Role_Services')
DROP SCHEMA [TS_Role_Services]
GO

/****** Object:  Schema [TS_Role_TechAdmin]    Script Date: 07/24/2015 11:22:56 ******/
IF  EXISTS (SELECT * FROM sys.schemas WHERE name = N'TS_Role_TechAdmin')
DROP SCHEMA [TS_Role_TechAdmin]
GO

/****** Object:  Schema [TS_Role_TechSupport]    Script Date: 07/24/2015 11:22:56 ******/
IF  EXISTS (SELECT * FROM sys.schemas WHERE name = N'TS_Role_TechSupport')
DROP SCHEMA [TS_Role_TechSupport]
GO

/****** Object:  Schema [TS_Role_UserSupport]    Script Date: 07/24/2015 11:22:56 ******/
IF  EXISTS (SELECT * FROM sys.schemas WHERE name = N'TS_Role_UserSupport')
DROP SCHEMA [TS_Role_UserSupport]
GO

/****** Object:  Schema [TS_Services]    Script Date: 07/24/2015 11:22:56 ******/
IF  EXISTS (SELECT * FROM sys.schemas WHERE name = N'TS_Services')
DROP SCHEMA [TS_Services]
GO

/****** Object:  Schema [TS_TechAdmin]    Script Date: 07/24/2015 11:22:56 ******/
IF  EXISTS (SELECT * FROM sys.schemas WHERE name = N'TS_TechAdmin')
DROP SCHEMA [TS_TechAdmin]
GO

/****** Object:  Schema [TS_TechSupport]    Script Date: 07/24/2015 11:22:56 ******/
IF  EXISTS (SELECT * FROM sys.schemas WHERE name = N'TS_TechSupport')
DROP SCHEMA [TS_TechSupport]
GO

/****** Object:  Schema [TS_TmpClinicians]    Script Date: 07/24/2015 11:22:56 ******/
IF  EXISTS (SELECT * FROM sys.schemas WHERE name = N'TS_TmpClinicians')
DROP SCHEMA [TS_TmpClinicians]
GO

/****** Object:  Schema [TS_UserSupport]    Script Date: 07/24/2015 11:22:56 ******/
IF  EXISTS (SELECT * FROM sys.schemas WHERE name = N'TS_UserSupport')
DROP SCHEMA [TS_UserSupport]
GO

/****** Object:  Schema [Local_BusOffMgmt]    Script Date: 08/07/2015 06:37:17 ******/
IF  EXISTS (SELECT * FROM sys.schemas WHERE name = N'Local_BusOffMgmt')
DROP SCHEMA [Local_BusOffMgmt]
GO

/****** Object:  Schema [Local_BusOffStaff]    Script Date: 08/07/2015 06:37:17 ******/
IF  EXISTS (SELECT * FROM sys.schemas WHERE name = N'Local_BusOffStaff')
DROP SCHEMA [Local_BusOffStaff]
GO

/****** Object:  Schema [Local_Clinicians]    Script Date: 08/07/2015 06:37:17 ******/
IF  EXISTS (SELECT * FROM sys.schemas WHERE name = N'Local_Clinicians')
DROP SCHEMA [Local_Clinicians]
GO

/****** Object:  Schema [Local_EntAdmin]    Script Date: 08/07/2015 06:37:17 ******/
IF  EXISTS (SELECT * FROM sys.schemas WHERE name = N'Local_EntAdmin')
DROP SCHEMA [Local_EntAdmin]
GO

/****** Object:  Schema [Local_FacilityMgmt]    Script Date: 08/07/2015 06:37:17 ******/
IF  EXISTS (SELECT * FROM sys.schemas WHERE name = N'Local_FacilityMgmt')
DROP SCHEMA [Local_FacilityMgmt]
GO

/****** Object:  Schema [Local_FacilityStaff]    Script Date: 08/07/2015 06:37:17 ******/
IF  EXISTS (SELECT * FROM sys.schemas WHERE name = N'Local_FacilityStaff')
DROP SCHEMA [Local_FacilityStaff]
GO

/****** Object:  Schema [Local_FacilityUser]    Script Date: 08/07/2015 06:37:17 ******/
IF  EXISTS (SELECT * FROM sys.schemas WHERE name = N'Local_FacilityUser')
DROP SCHEMA [Local_FacilityUser]
GO

/****** Object:  Schema [Local_MTSPackages]    Script Date: 08/07/2015 06:37:17 ******/
IF  EXISTS (SELECT * FROM sys.schemas WHERE name = N'Local_MTSPackages')
DROP SCHEMA [Local_MTSPackages]
GO

/****** Object:  Schema [Local_PriceAdmin]    Script Date: 08/07/2015 06:37:17 ******/
IF  EXISTS (SELECT * FROM sys.schemas WHERE name = N'Local_PriceAdmin')
DROP SCHEMA [Local_PriceAdmin]
GO

/****** Object:  Schema [Local_Services]    Script Date: 08/07/2015 06:37:17 ******/
IF  EXISTS (SELECT * FROM sys.schemas WHERE name = N'Local_Services')
DROP SCHEMA [Local_Services]
GO

/****** Object:  Schema [Local_Superbill]    Script Date: 08/07/2015 06:37:17 ******/
IF  EXISTS (SELECT * FROM sys.schemas WHERE name = N'Local_Superbill')
DROP SCHEMA [Local_Superbill]
GO

/****** Object:  Schema [Local_TechAdmin]    Script Date: 08/07/2015 06:37:17 ******/
IF  EXISTS (SELECT * FROM sys.schemas WHERE name = N'Local_TechAdmin')
DROP SCHEMA [Local_TechAdmin]
GO

/****** Object:  Schema [Local_TechSupport]    Script Date: 08/07/2015 06:37:17 ******/
IF  EXISTS (SELECT * FROM sys.schemas WHERE name = N'Local_TechSupport')
DROP SCHEMA [Local_TechSupport]
GO

/****** Object:  Schema [Local_TmpClinicians]    Script Date: 08/07/2015 06:37:17 ******/
IF  EXISTS (SELECT * FROM sys.schemas WHERE name = N'Local_TmpClinicians')
DROP SCHEMA [Local_TmpClinicians]
GO

/****** Object:  Schema [Local_UserSupport]    Script Date: 08/07/2015 06:37:17 ******/
IF  EXISTS (SELECT * FROM sys.schemas WHERE name = N'Local_UserSupport')
DROP SCHEMA [Local_UserSupport]
GO

/****** Object:  Schema [TS_Role_EntAdmin]    Script Date: 08/07/2015 06:37:17 ******/
IF  EXISTS (SELECT * FROM sys.schemas WHERE name = N'TS_Role_EntAdmin')
DROP SCHEMA [TS_Role_EntAdmin]
GO

/****** Object:  Schema [TS_Role_PriceAdmin]    Script Date: 08/07/2015 06:37:17 ******/
IF  EXISTS (SELECT * FROM sys.schemas WHERE name = N'TS_Role_PriceAdmin')
DROP SCHEMA [TS_Role_PriceAdmin]
GO

/****** Object:  Schema [TS_Role_Superbill]    Script Date: 08/07/2015 06:37:17 ******/
IF  EXISTS (SELECT * FROM sys.schemas WHERE name = N'TS_Role_Superbill')
DROP SCHEMA [TS_Role_Superbill]
GO
