

EXECUTE master.dbo.xp_sqlmaint N'-PlanName  "Daily DB Maintenance Plan" -S SMTSGOLD04 -Rpt "c:\Log\Daily Maintenance DB Backups.txt" -DelTxtRpt 2DAYS -WriteHistory   -BkUpMedia DISK -BkUpDB "g:\SQLDATA_2005\Backup"  -CrBkSubDir -BkExt "BAK"'

USE msdb ;
GO

EXEC dbo.sp_stop_job
    N'Transaction Log Backup' ;
GO


USE TS_Central_PRD00 ;
GO

DBCC SHRINKFILE(TS_Central_PRD00_Log01)
BACKUP LOG TS_Central_PRD00 WITH TRUNCATE_ONLY
DBCC SHRINKFILE(TS_Central_PRD00_Log01)


use master;

go



EXECUTE master.dbo.xp_sqlmaint N'-PlanName  "Daily DB Maintenance Plan" -S SMTSGOLD04 -Rpt "c:\Log\Daily Maintenance DB Backups.txt" -DelTxtRpt 2DAYS -WriteHistory   -BkUpMedia DISK -BkUpDB "g:\SQLDATA_2005\Backup"  -CrBkSubDir -BkExt "BAK"'


EXEC sp_dba_foreachdb_inplan ' exec sp_dba_PostMaint_2000 @dbname = ''?''', 'Daily DB Maintenance Plan'