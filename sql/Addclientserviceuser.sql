

IF NOT EXISTS(SELECT * FROM sys.syslogins WHERE name = 'SOURCEMED\Ts_Clientservicesadmin') 
begin

CREATE LOGIN [SOURCEMED\Ts_Clientservicesadmin] FROM WINDOWS
WITH DEFAULT_DATABASE = master;

end


GO




IF NOT EXISTS(SELECT * FROM sys.syslogins  WHERE name = 'SOURCEMED\Ts_Clientservicesadmin2') 
begin

CREATE LOGIN [SOURCEMED\Ts_Clientservicesadmin2] FROM WINDOWS
WITH DEFAULT_DATABASE = master;

end 

GO