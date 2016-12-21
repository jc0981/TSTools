USE [TS_OLTP_PRD5017]
GO


DECLARE @RoleName sysname
set @RoleName = N'TS_Role_BusOff'
IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = @RoleName AND type = 'R')
Begin
	DECLARE @RoleMemberName sysname
	DECLARE Member_Cursor CURSOR FOR
	select [name]
	from sys.database_principals 
	where principal_id in ( 
		select member_principal_id 
		from sys.database_role_members 
		where role_principal_id in (
			select principal_id
			FROM sys.database_principals where [name] = @RoleName  AND type = 'R' ))

	OPEN Member_Cursor;

	FETCH NEXT FROM Member_Cursor
	into @RoleMemberName

	WHILE @@FETCH_STATUS = 0
	BEGIN

		exec sp_droprolemember @rolename=@RoleName, @membername= @RoleMemberName

		FETCH NEXT FROM Member_Cursor
		into @RoleMemberName
	END;

	CLOSE Member_Cursor;
	DEALLOCATE Member_Cursor;
End

GO

/****** Object:  DatabaseRole [TS_Role_BusOff]    Script Date: 07/24/2015 11:24:08 ******/
IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = N'TS_Role_BusOff' AND type = 'R')
DROP ROLE [TS_Role_BusOff]
GO


DECLARE @RoleName sysname
set @RoleName = N'TS_Role_Facility'
IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = @RoleName AND type = 'R')
Begin
	DECLARE @RoleMemberName sysname
	DECLARE Member_Cursor CURSOR FOR
	select [name]
	from sys.database_principals 
	where principal_id in ( 
		select member_principal_id 
		from sys.database_role_members 
		where role_principal_id in (
			select principal_id
			FROM sys.database_principals where [name] = @RoleName  AND type = 'R' ))

	OPEN Member_Cursor;

	FETCH NEXT FROM Member_Cursor
	into @RoleMemberName

	WHILE @@FETCH_STATUS = 0
	BEGIN

		exec sp_droprolemember @rolename=@RoleName, @membername= @RoleMemberName

		FETCH NEXT FROM Member_Cursor
		into @RoleMemberName
	END;

	CLOSE Member_Cursor;
	DEALLOCATE Member_Cursor;
End

GO

/****** Object:  DatabaseRole [TS_Role_Facility]    Script Date: 07/24/2015 11:24:08 ******/
IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = N'TS_Role_Facility' AND type = 'R')
DROP ROLE [TS_Role_Facility]
GO


DECLARE @RoleName sysname
set @RoleName = N'TS_Role_LinkedUser'
IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = @RoleName AND type = 'R')
Begin
	DECLARE @RoleMemberName sysname
	DECLARE Member_Cursor CURSOR FOR
	select [name]
	from sys.database_principals 
	where principal_id in ( 
		select member_principal_id 
		from sys.database_role_members 
		where role_principal_id in (
			select principal_id
			FROM sys.database_principals where [name] = @RoleName  AND type = 'R' ))

	OPEN Member_Cursor;

	FETCH NEXT FROM Member_Cursor
	into @RoleMemberName

	WHILE @@FETCH_STATUS = 0
	BEGIN

		exec sp_droprolemember @rolename=@RoleName, @membername= @RoleMemberName

		FETCH NEXT FROM Member_Cursor
		into @RoleMemberName
	END;

	CLOSE Member_Cursor;
	DEALLOCATE Member_Cursor;
End

GO

/****** Object:  DatabaseRole [TS_Role_LinkedUser]    Script Date: 07/24/2015 11:24:08 ******/
IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = N'TS_Role_LinkedUser' AND type = 'R')
DROP ROLE [TS_Role_LinkedUser]
GO


DECLARE @RoleName sysname
set @RoleName = N'TS_Role_MTSPackages'
IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = @RoleName AND type = 'R')
Begin
	DECLARE @RoleMemberName sysname
	DECLARE Member_Cursor CURSOR FOR
	select [name]
	from sys.database_principals 
	where principal_id in ( 
		select member_principal_id 
		from sys.database_role_members 
		where role_principal_id in (
			select principal_id
			FROM sys.database_principals where [name] = @RoleName  AND type = 'R' ))

	OPEN Member_Cursor;

	FETCH NEXT FROM Member_Cursor
	into @RoleMemberName

	WHILE @@FETCH_STATUS = 0
	BEGIN

		exec sp_droprolemember @rolename=@RoleName, @membername= @RoleMemberName

		FETCH NEXT FROM Member_Cursor
		into @RoleMemberName
	END;

	CLOSE Member_Cursor;
	DEALLOCATE Member_Cursor;
End

GO

/****** Object:  DatabaseRole [TS_Role_MTSPackages]    Script Date: 07/24/2015 11:24:08 ******/
IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = N'TS_Role_MTSPackages' AND type = 'R')
DROP ROLE [TS_Role_MTSPackages]
GO


DECLARE @RoleName sysname
set @RoleName = N'TS_Role_Reporting'
IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = @RoleName AND type = 'R')
Begin
	DECLARE @RoleMemberName sysname
	DECLARE Member_Cursor CURSOR FOR
	select [name]
	from sys.database_principals 
	where principal_id in ( 
		select member_principal_id 
		from sys.database_role_members 
		where role_principal_id in (
			select principal_id
			FROM sys.database_principals where [name] = @RoleName  AND type = 'R' ))

	OPEN Member_Cursor;

	FETCH NEXT FROM Member_Cursor
	into @RoleMemberName

	WHILE @@FETCH_STATUS = 0
	BEGIN

		exec sp_droprolemember @rolename=@RoleName, @membername= @RoleMemberName

		FETCH NEXT FROM Member_Cursor
		into @RoleMemberName
	END;

	CLOSE Member_Cursor;
	DEALLOCATE Member_Cursor;
End

GO

/****** Object:  DatabaseRole [TS_Role_Reporting]    Script Date: 07/24/2015 11:24:08 ******/
IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = N'TS_Role_Reporting' AND type = 'R')
DROP ROLE [TS_Role_Reporting]
GO


DECLARE @RoleName sysname
set @RoleName = N'TS_Role_Services'
IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = @RoleName AND type = 'R')
Begin
	DECLARE @RoleMemberName sysname
	DECLARE Member_Cursor CURSOR FOR
	select [name]
	from sys.database_principals 
	where principal_id in ( 
		select member_principal_id 
		from sys.database_role_members 
		where role_principal_id in (
			select principal_id
			FROM sys.database_principals where [name] = @RoleName  AND type = 'R' ))

	OPEN Member_Cursor;

	FETCH NEXT FROM Member_Cursor
	into @RoleMemberName

	WHILE @@FETCH_STATUS = 0
	BEGIN

		exec sp_droprolemember @rolename=@RoleName, @membername= @RoleMemberName

		FETCH NEXT FROM Member_Cursor
		into @RoleMemberName
	END;

	CLOSE Member_Cursor;
	DEALLOCATE Member_Cursor;
End

GO

/****** Object:  DatabaseRole [TS_Role_Services]    Script Date: 07/24/2015 11:24:08 ******/
IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = N'TS_Role_Services' AND type = 'R')
DROP ROLE [TS_Role_Services]
GO


DECLARE @RoleName sysname
set @RoleName = N'TS_Role_TechAdmin'
IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = @RoleName AND type = 'R')
Begin
	DECLARE @RoleMemberName sysname
	DECLARE Member_Cursor CURSOR FOR
	select [name]
	from sys.database_principals 
	where principal_id in ( 
		select member_principal_id 
		from sys.database_role_members 
		where role_principal_id in (
			select principal_id
			FROM sys.database_principals where [name] = @RoleName  AND type = 'R' ))

	OPEN Member_Cursor;

	FETCH NEXT FROM Member_Cursor
	into @RoleMemberName

	WHILE @@FETCH_STATUS = 0
	BEGIN

		exec sp_droprolemember @rolename=@RoleName, @membername= @RoleMemberName

		FETCH NEXT FROM Member_Cursor
		into @RoleMemberName
	END;

	CLOSE Member_Cursor;
	DEALLOCATE Member_Cursor;
End

GO

/****** Object:  DatabaseRole [TS_Role_TechAdmin]    Script Date: 07/24/2015 11:24:08 ******/
IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = N'TS_Role_TechAdmin' AND type = 'R')
DROP ROLE [TS_Role_TechAdmin]
GO


DECLARE @RoleName sysname
set @RoleName = N'TS_Role_TechSupport'
IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = @RoleName AND type = 'R')
Begin
	DECLARE @RoleMemberName sysname
	DECLARE Member_Cursor CURSOR FOR
	select [name]
	from sys.database_principals 
	where principal_id in ( 
		select member_principal_id 
		from sys.database_role_members 
		where role_principal_id in (
			select principal_id
			FROM sys.database_principals where [name] = @RoleName  AND type = 'R' ))

	OPEN Member_Cursor;

	FETCH NEXT FROM Member_Cursor
	into @RoleMemberName

	WHILE @@FETCH_STATUS = 0
	BEGIN

		exec sp_droprolemember @rolename=@RoleName, @membername= @RoleMemberName

		FETCH NEXT FROM Member_Cursor
		into @RoleMemberName
	END;

	CLOSE Member_Cursor;
	DEALLOCATE Member_Cursor;
End

GO

/****** Object:  DatabaseRole [TS_Role_TechSupport]    Script Date: 07/24/2015 11:24:08 ******/
IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = N'TS_Role_TechSupport' AND type = 'R')
DROP ROLE [TS_Role_TechSupport]
GO


DECLARE @RoleName sysname
set @RoleName = N'TS_Role_UserSupport'
IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = @RoleName AND type = 'R')
Begin
	DECLARE @RoleMemberName sysname
	DECLARE Member_Cursor CURSOR FOR
	select [name]
	from sys.database_principals 
	where principal_id in ( 
		select member_principal_id 
		from sys.database_role_members 
		where role_principal_id in (
			select principal_id
			FROM sys.database_principals where [name] = @RoleName  AND type = 'R' ))

	OPEN Member_Cursor;

	FETCH NEXT FROM Member_Cursor
	into @RoleMemberName

	WHILE @@FETCH_STATUS = 0
	BEGIN

		exec sp_droprolemember @rolename=@RoleName, @membername= @RoleMemberName

		FETCH NEXT FROM Member_Cursor
		into @RoleMemberName
	END;

	CLOSE Member_Cursor;
	DEALLOCATE Member_Cursor;
End

GO

/****** Object:  DatabaseRole [TS_Role_UserSupport]    Script Date: 07/24/2015 11:24:08 ******/
IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = N'TS_Role_UserSupport' AND type = 'R')
DROP ROLE [TS_Role_UserSupport]
GO


DECLARE @RoleName sysname
set @RoleName = N'TS_Role_EntAdmin'
IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = @RoleName AND type = 'R')
Begin
	DECLARE @RoleMemberName sysname
	DECLARE Member_Cursor CURSOR FOR
	select [name]
	from sys.database_principals 
	where principal_id in ( 
		select member_principal_id 
		from sys.database_role_members 
		where role_principal_id in (
			select principal_id
			FROM sys.database_principals where [name] = @RoleName  AND type = 'R' ))

	OPEN Member_Cursor;

	FETCH NEXT FROM Member_Cursor
	into @RoleMemberName

	WHILE @@FETCH_STATUS = 0
	BEGIN

		exec sp_droprolemember @rolename=@RoleName, @membername= @RoleMemberName

		FETCH NEXT FROM Member_Cursor
		into @RoleMemberName
	END;

	CLOSE Member_Cursor;
	DEALLOCATE Member_Cursor;
End

GO

/****** Object:  DatabaseRole [TS_Role_EntAdmin]    Script Date: 08/07/2015 06:38:30 ******/
IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = N'TS_Role_EntAdmin' AND type = 'R')
DROP ROLE [TS_Role_EntAdmin]
GO


DECLARE @RoleName sysname
set @RoleName = N'TS_Role_PriceAdmin'
IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = @RoleName AND type = 'R')
Begin
	DECLARE @RoleMemberName sysname
	DECLARE Member_Cursor CURSOR FOR
	select [name]
	from sys.database_principals 
	where principal_id in ( 
		select member_principal_id 
		from sys.database_role_members 
		where role_principal_id in (
			select principal_id
			FROM sys.database_principals where [name] = @RoleName  AND type = 'R' ))

	OPEN Member_Cursor;

	FETCH NEXT FROM Member_Cursor
	into @RoleMemberName

	WHILE @@FETCH_STATUS = 0
	BEGIN

		exec sp_droprolemember @rolename=@RoleName, @membername= @RoleMemberName

		FETCH NEXT FROM Member_Cursor
		into @RoleMemberName
	END;

	CLOSE Member_Cursor;
	DEALLOCATE Member_Cursor;
End

GO

/****** Object:  DatabaseRole [TS_Role_PriceAdmin]    Script Date: 08/07/2015 06:38:30 ******/
IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = N'TS_Role_PriceAdmin' AND type = 'R')
DROP ROLE [TS_Role_PriceAdmin]
GO


DECLARE @RoleName sysname
set @RoleName = N'TS_Role_Superbill'
IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = @RoleName AND type = 'R')
Begin
	DECLARE @RoleMemberName sysname
	DECLARE Member_Cursor CURSOR FOR
	select [name]
	from sys.database_principals 
	where principal_id in ( 
		select member_principal_id 
		from sys.database_role_members 
		where role_principal_id in (
			select principal_id
			FROM sys.database_principals where [name] = @RoleName  AND type = 'R' ))

	OPEN Member_Cursor;

	FETCH NEXT FROM Member_Cursor
	into @RoleMemberName

	WHILE @@FETCH_STATUS = 0
	BEGIN

		exec sp_droprolemember @rolename=@RoleName, @membername= @RoleMemberName

		FETCH NEXT FROM Member_Cursor
		into @RoleMemberName
	END;

	CLOSE Member_Cursor;
	DEALLOCATE Member_Cursor;
End

GO

/****** Object:  DatabaseRole [TS_Role_Superbill]    Script Date: 08/07/2015 06:38:30 ******/
IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = N'TS_Role_Superbill' AND type = 'R')
DROP ROLE [TS_Role_Superbill]
GO