--https://ola.hallengren.com/

--Ryan suggestion for daily job to recycle error logs to manageable sizes.

USE [master]
GO
--configure sql logs to keep 30 files
EXEC xp_instance_regwrite N'HKEY_LOCAL_MACHINE', N'Software\Microsoft\MSSQLServer\MSSQLServer', N'NumErrorLogs', REG_DWORD, 30
GO

EXEC msdb.dbo.sp_cycle_errorlog
GO
EXEC msdb.dbo.sp_cycle_agent_errorlog
GO



-- Ryan suggestion for msdb trans log and autogrowth

USE [msdb]
GO
DBCC SHRINKFILE (N'MSDBLog' , 0)
GO


USE [master]
GO
ALTER DATABASE [msdb] MODIFY FILE ( NAME = N'MSDBLog', SIZE = 2097152KB , MAXSIZE = UNLIMITED, FILEGROWTH = 10240KB )
GO


