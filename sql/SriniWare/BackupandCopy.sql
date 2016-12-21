
-- Change CORP  7904 tO REAL CORP

-- Change ENVID PRD0038 TO APPROPRIATE ENV


EXEC xp_cmdshell 'rmdir F:\SQLData_Therapy\BackUp\TS_HCAL_PRD0038  /Q /S  ';

go 


EXEC xp_cmdshell 'rmdir F:\SQLData_Therapy\BackUp\TS_RPT_PRD0038   /Q /S  ';

go 


EXEC xp_cmdshell 'rmdir F:\SQLData_Therapy\BackUp\TS_OLTP_PRD0038   /Q /S  ';

go 



EXEC xp_cmdshell 'rmdir F:\SQLData_Rehabtoolkit\Backup\RT_6679  /Q /S  ';

go 



EXEC xp_cmdshell 'rmdir F:\SQLData_Rehabtoolkit\Backup\Training_6679  /Q /S  ';

go 



EXEC xp_cmdshell 'del  \\ts42db6679aprd\f$\DBackups\*.*  /Q /S  ';

go


EXECUTE master.dbo.xp_sqlmaint N'-PlanName  "Daily DB Maintenance Plan" -S TS42DB7904PRD\Therapy -Rpt "D:\SQLData_Therapy\SQLLogs\Daily Maintenance DB Backups.txt" -DelTxtRpt 2DAYS -WriteHistory  -VrfyBackup -BkUpMedia DISK -BkUpDB "F:\SQLData_Therapy\BackUp"  -CrBkSubDir -BkExt "BAK"'

EXECUTE   master.Dbo.xp_sqlmaint   '-S TS42DB7904PRD\REHABTOOLKIT -D RT_6679 -DelTxtRpt 2DAYS -WriteHistory  -VrfyBackup -BkUpMedia DISK -BkUpDB "F:\SQLData_Rehabtoolkit\Backup"  -CrBkSubDir -BkExt "BAK"'

EXECUTE   master.Dbo.xp_sqlmaint   '-S TS42DB7904PRD\REHABTOOLKIT -D Training_6679 -DelTxtRpt 2DAYS -WriteHistory  -VrfyBackup -BkUpMedia DISK -BkUpDB "F:\SQLData_Rehabtoolkit\Backup"  -CrBkSubDir -BkExt "BAK"'

EXECUTE   master.Dbo.xp_sqlmaint   '-S TS42DB7904PRD\PRD0038 -D ADV_6679 -DelTxtRpt 2DAYS -WriteHistory  -VrfyBackup -BkUpMedia DISK -BkUpDB "F:\SQLData_PRD0038\Backup"  -CrBkSubDir -BkExt "BAK"'



EXEC xp_cmdshell 'robocopy F:\SQLData_Therapy\BackUp\TS_OLTP_PRD0038  \\ts42db6679aprd\f$\DBackups *.bak'

EXEC xp_cmdshell 'robocopy F:\SQLData_Therapy\BackUp\TS_RPT_PRD0038  \\ts42db6679aprd\f$\DBackups *.bak'

EXEC xp_cmdshell 'robocopy F:\SQLData_Therapy\BackUp\TS_HCAL_PRD0038  \\ts42db6679aprd\f$\DBackups *.bak'


EXEC xp_cmdshell 'robocopy F:\SQLData_Rehabtoolkit\BackUp\RT_6679  \\ts42db6679aprd\f$\DBackups *.bak'

EXEC xp_cmdshell 'robocopy F:\SQLData_Rehabtoolkit\BackUp\Training_6679  \\ts42db6679aprd\f$\DBackups *.bak'

EXEC xp_cmdshell 'robocopy F:\SQLData_PRD0038\BackUp\ADV_6679  \\ts42db6679aprd\f$\DBackups *.bak'