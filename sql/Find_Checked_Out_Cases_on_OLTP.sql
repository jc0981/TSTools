/*-----------------------------------
Script to pull checked out cases by CORP and CO Status
*
* Why? 		Pre-upgrade check where all cases should be checked in.
* Run Against? 	OLTP DB
*
*-------------------------------*/


DECLARE	@CorpID     INT
DECLARE @pt11CODat  datetime

Select  @CorpID    =  	7909,
	@PT11CODat = 	'2006-12-18'

---------------------------------------

Select PT11ChgID, PT11COID, PT11CODat, PT11CIDat
from   PT11 
where  PT11CODat >= @PT11CODat  
  and  corpID     = @CorpID
  and  PT11CO     = 1
 order by PT11ChgID, PT11CODat    
   




