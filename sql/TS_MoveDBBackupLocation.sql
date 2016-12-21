--Move DB Backup Drives

-- Update master.dbo.Customer_installParms

	update Customer_InstallParms
	Set ParmValue = REPLACE(ParmValue,'G:\','E:\')
	where ParmValue like '%BACKUP%'

-- Change SQL Jobs
	USE [msdb]
	GO 
    select j.name,jst.step_id,jst.step_name, jst.command--,jst.*
--    update jst
--	set jst.command = REPLACE(jst.command,'G:\','E:\')
	--into dbo.jctempjobstbl
	from dbo.sysjobs j
	join dbo.sysjobsteps jst on j.job_id = jst.job_id
	where jst.command like '%\SQLData_Therapy\BACKUP%'

-- Delete OLTP, RPT, and HCAL Folders in old location i.e. E:\SQLData_Therapy\Backups\TS_OLTP_IVY01	  	  

--Run Backup Step of Weekly Maintenance and Daily Maintenance SQL Jobs