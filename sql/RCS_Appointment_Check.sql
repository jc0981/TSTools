DECLARE @CorpID int
	, @AcctNumber varchar(10)
	, @Appointment date = GETDATE()
	
/* EDIT ONLY THE NEXT THREE LINES */	
SET @CorpID = 3462
SET @AcctNumber = 94065
SET @Appointment = '2016-04-21 10:00:00.000'	
/* DO NOT EDIT ANYTHING BELOW HERE */
	
SELECT 
	pt15.CorpID AS 'CorpId'
	, pt10.PT10NameF + ' ' + pt10.PT10NameL as 'Patient Name'
	, pta.Account as 'Account #'
	, CONVERT(varchar(10),pt15.PT15InsDat, 101) + ' ' + RIGHT(CONVERT(varchar,pt15.PT15InsDat,100),7) as 'Appointment Insert Date'
	, at11.AT11Name as 'Clinic Name'
	--, pt15.*
FROM PT15 pt15
JOIN PT11 pt11 ON pt11.CaseKey = pt15.CaseKey AND pt11.CorpID = pt15.CorpID
JOIN PT10 pt10 ON pt10.PatientKey = pt11.PatientKey AND pt10.CorpID = pt11.CorpID
JOIN PT_Acct pta ON pta.PatientKey = pt11.PatientKey AND pta.CorpID = pt11.CorpID
JOIN AT11 at11 ON at11.ClinicKey = pt15.ClinicKey AND at11.CorpID = pt15.CorpID
WHERE
	pt15.CorpID = @CorpID
	AND
	pta.Account = @AcctNumber
	AND
	pt15.PT15ApptDat >= @Appointment