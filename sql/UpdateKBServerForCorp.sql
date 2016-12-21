select *
--update s
--set s.srvname = 'ts42db3653aprd'
from Env_Corps c
join Servers s on s.envkey = c.envkey
where [Corp ID] = 3653