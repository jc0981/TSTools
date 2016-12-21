USE [TS_OLTP_PRD5017]
GO

/****** Object:  User [linked_user]    Script Date: 07/24/2015 11:21:35 ******/
IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = N'linked_user')
DROP USER [linked_user]
GO

/****** Object:  User [TS_BusOffMgmt]    Script Date: 07/24/2015 11:21:35 ******/
IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = N'TS_BusOffMgmt')
DROP USER [TS_BusOffMgmt]
GO

/****** Object:  User [TS_BusOffStaff]    Script Date: 07/24/2015 11:21:35 ******/
IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = N'TS_BusOffStaff')
DROP USER [TS_BusOffStaff]
GO

/****** Object:  User [TS_Clinicians]    Script Date: 07/24/2015 11:21:35 ******/
IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = N'TS_Clinicians')
DROP USER [TS_Clinicians]
GO

/****** Object:  User [TS_FacilityMgmt]    Script Date: 07/24/2015 11:21:35 ******/
IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = N'TS_FacilityMgmt')
DROP USER [TS_FacilityMgmt]
GO

/****** Object:  User [TS_FacilityStaff]    Script Date: 07/24/2015 11:21:35 ******/
IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = N'TS_FacilityStaff')
DROP USER [TS_FacilityStaff]
GO

/****** Object:  User [TS_MTSPackages]    Script Date: 07/24/2015 11:21:35 ******/
IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = N'TS_MTSPackages')
DROP USER [TS_MTSPackages]
GO

/****** Object:  User [TS_Reports]    Script Date: 07/24/2015 11:21:35 ******/
IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = N'TS_Reports')
DROP USER [TS_Reports]
GO

/****** Object:  User [TS_Services]    Script Date: 07/24/2015 11:21:35 ******/
IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = N'TS_Services')
DROP USER [TS_Services]
GO

/****** Object:  User [TS_TechAdmin]    Script Date: 07/24/2015 11:21:35 ******/
IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = N'TS_TechAdmin')
DROP USER [TS_TechAdmin]
GO

/****** Object:  User [TS_TechSupport]    Script Date: 07/24/2015 11:21:35 ******/
IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = N'TS_TechSupport')
DROP USER [TS_TechSupport]
GO

/****** Object:  User [TS_TmpClinicians]    Script Date: 07/24/2015 11:21:35 ******/
IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = N'TS_TmpClinicians')
DROP USER [TS_TmpClinicians]
GO

/****** Object:  User [TS_UserSupport]    Script Date: 07/24/2015 11:21:35 ******/
IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = N'TS_UserSupport')
DROP USER [TS_UserSupport]
GO

/****** Object:  User [Local_BusOffMgmt]    Script Date: 08/07/2015 06:39:44 ******/
IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = N'Local_BusOffMgmt')
DROP USER [Local_BusOffMgmt]
GO

/****** Object:  User [Local_BusOffStaff]    Script Date: 08/07/2015 06:39:44 ******/
IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = N'Local_BusOffStaff')
DROP USER [Local_BusOffStaff]
GO

/****** Object:  User [Local_Clinicians]    Script Date: 08/07/2015 06:39:44 ******/
IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = N'Local_Clinicians')
DROP USER [Local_Clinicians]
GO

/****** Object:  User [Local_EntAdmin]    Script Date: 08/07/2015 06:39:44 ******/
IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = N'Local_EntAdmin')
DROP USER [Local_EntAdmin]
GO

/****** Object:  User [Local_FacilityMgmt]    Script Date: 08/07/2015 06:39:44 ******/
IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = N'Local_FacilityMgmt')
DROP USER [Local_FacilityMgmt]
GO

/****** Object:  User [Local_FacilityStaff]    Script Date: 08/07/2015 06:39:44 ******/
IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = N'Local_FacilityStaff')
DROP USER [Local_FacilityStaff]
GO

/****** Object:  User [Local_FacilityUser]    Script Date: 08/07/2015 06:39:44 ******/
IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = N'Local_FacilityUser')
DROP USER [Local_FacilityUser]
GO

/****** Object:  User [Local_MTSPackages]    Script Date: 08/07/2015 06:39:44 ******/
IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = N'Local_MTSPackages')
DROP USER [Local_MTSPackages]
GO

/****** Object:  User [Local_PriceAdmin]    Script Date: 08/07/2015 06:39:44 ******/
IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = N'Local_PriceAdmin')
DROP USER [Local_PriceAdmin]
GO

/****** Object:  User [Local_Services]    Script Date: 08/07/2015 06:39:44 ******/
IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = N'Local_Services')
DROP USER [Local_Services]
GO

/****** Object:  User [Local_Superbill]    Script Date: 08/07/2015 06:39:44 ******/
IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = N'Local_Superbill')
DROP USER [Local_Superbill]
GO

/****** Object:  User [Local_TechAdmin]    Script Date: 08/07/2015 06:39:44 ******/
IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = N'Local_TechAdmin')
DROP USER [Local_TechAdmin]
GO

/****** Object:  User [Local_TechSupport]    Script Date: 08/07/2015 06:39:44 ******/
IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = N'Local_TechSupport')
DROP USER [Local_TechSupport]
GO

/****** Object:  User [Local_TmpClinicians]    Script Date: 08/07/2015 06:39:44 ******/
IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = N'Local_TmpClinicians')
DROP USER [Local_TmpClinicians]
GO

/****** Object:  User [Local_UserSupport]    Script Date: 08/07/2015 06:39:44 ******/
IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = N'Local_UserSupport')
DROP USER [Local_UserSupport]
GO



