select *
from HT07

select *
from HT06

update ht06
set ht06path = replace (ht06path,'server2','TS42FS1000PRD')


update ht07
set ht07path1= '\\TS42FS1000PRD\reports'

update ht07
set SrvName = replace (SrvName,'server2','TS42DB3132PRD')

select *
from HT07

select *
from HT06