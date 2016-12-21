select * from vw_CustomersVPNInfo
where corpid = 1850


select * from Env_Corps
where [corp id] = 1850


select * from Environments
where  [hosted type]='SM'
and  envkey = 195

update Environments
set [hosted type]='SM', dnsdomain = 'sourcemed',windomain='sourcemed'
where envkey = 195

update EnvAdminData
set adminuid='ts_kbdist',adminpwd='therapy',kbeditionpath='C$\TherapySource\KB\Corp1850'
where envkey = 195


update servers
set srvname ='ts42db1850prd'
where envkey = 195 and srvtypekey = 1

select * from servers
where envkey = 195 and srvtypekey = 1
