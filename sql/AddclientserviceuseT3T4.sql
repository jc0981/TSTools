

IF NOT EXISTS(SELECT * FROM sys.syslogins WHERE name = 'SOURCEMED\TS_ClientServicesTier3') 
begin

CREATE LOGIN [SOURCEMED\TS_ClientServicesTier3] FROM WINDOWS
WITH DEFAULT_DATABASE = master;

end



GO
 


IF NOT EXISTS(SELECT * FROM sys.syslogins WHERE name = 'SOURCEMED\TS_ClientServicesTier4') 
begin

CREATE LOGIN [SOURCEMED\TS_ClientServicesTier4] FROM WINDOWS
WITH DEFAULT_DATABASE = master;

end



GO
 


EXEC master..sp_addsrvrolemember @loginame = N'sourcemed\TS_ClientServicesTier3', @rolename = N'sysadmin'


go



EXEC master..sp_addsrvrolemember @loginame = N'sourcemed\TS_ClientServicesTier4', @rolename = N'sysadmin'


go