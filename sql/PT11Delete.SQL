/****** Object:  Stored Procedure dbo.PT11Delete    Script Date: 11/30/95 4:56:56 PM ******/
if exists (select * from sysobjects where id = object_id('dbo.PT11Delete') and sysstat & 0xf = 4)
    drop procedure dbo.PT11Delete
GO

/***************************************************************************
 * Proc Name:   PT11Delete
 *
 * Description: Delete a case.
 *
 * Parameters:  @MachineID      varchar(30) calling machine (pen computer) name
 *              @UserID         varchar(30) network user ID
 *              @CaseTStamp     binary(8)   case timestamp 
 *              @CaseKey        int     the case to be deleted
 *
 * Returns:     Nothing.
 *
 * Called By:   Pen app - Patient Processing   
 *
 * Functional database: OLTP
 *
 * Modifications:
 * ????           Original.
 * 1996Mar07 MPS  Removed call to stored procedure PT30Delete
 * 97/11/25  DGW  Added return parameter @RetCode, added header
 *                and removed @Call_By_SP! Did some cleanup!
 * 2001-03-05 DMB Modified for Pen32 Patient Processing.
 * 02/29/02  KK   Added CorpID for FEAT065
 * 2002-05-03 ACW Re-arranged Userid to second parameter.
 * 2002-10-03 WWU SCR 3326. Raise error if the case has copay info.
 * 2003-05-15 WWU SCR 4110.
 * 2003-05-21 WWU Updated for FEAT116.
 * 2003-10-28 WWU Updated for FEAT030 - delete PT22.
 * 2004-01-28 WWU SCR4744 - delete patient accounts in PT_Acct before deleting
 *                          the patient.   
 * 2004-12-22 CH  SCR5835 - Added to delete the external appointment keys associated with the Case.
 * 2008-10-24 MLI MQC 672 - Added delete from PT_CaseVersion for the case.
 * 2015-04-29 SWH TPL-3964 - Added delete from PT29 when deleting case and patient.
 ***************************************************************************/
GO

CREATE PROCEDURE PT11Delete
    @CorpID     int,
    -- "Standard" parameters
    @UserID         varchar(100),    
    @MachineID      varchar(30),
    @CaseTStamp     binary(8),

    -- PT11Delete parameters
    @CaseKey int = NULL

AS

DECLARE @RowCount   INT, 
        @Error      INT,
        @PatientKey INT,
        @PT11TS     BINARY(8),
        @PT10TS     BINARY(8),
        @PT11CO     BIT


DECLARE @RetCode INT

EXEC @RetCode = dbo.ValidateUser @CorpID, @UserID
IF @RetCode <> 1 
BEGIN
    RAISERROR(51300,16,1)
    RETURN
END

IF EXISTS (SELECT 1 FROM PT18 WHERE CorpID = @CorpID and CaseKey = @CaseKey)
BEGIN
    RAISERROR(50438,16,1)   -- You cannot delete this case because there is copay information associated with it
    RETURN
END

-- -----------------------------------------------
-- Get key case and patient data
-- -----------------------------------------------
SELECT @PatientKey = PT11.PatientKey
  FROM PT11 WITH (UPDLOCK,ROWLOCK)                -- I'll be back! 
 INNER JOIN PT10 ON PT10.CorpID = PT11.CorpID
   AND PT10.PatientKey = PT11.PatientKey
 WHERE PT11.CorpID = @CorpID
   AND CaseKey = @CaseKey

-------------------------------------------------------
-- SCR #4110: IF it is the last case of the patient
-- and there are Authorization or Disclosure associated
-- with the patient, can not delete the case.
-------------------------------------------------------
IF (SELECT COUNT(*) FROM PT11 WHERE CorpID = @CorpID AND PatientKey = @PatientKey) = 1
AND (EXISTS (SELECT 1 FROM PT_PHI_Authorization WHERE CorpID = @CorpID AND PatientKey = @PatientKey)
 OR EXISTS (SELECT 1 FROM PT_PHI_Disclosure WHERE CorpID = @CorpID AND PatientKey = @PatientKey))
BEGIN
    RAISERROR(50446,16,1)   -- You cannot delete the last case of this patient because there is Authorization/Disclosure info. associated with it.
    RETURN    
END

-- -----------------------------------------------
-- Delete the case and its associated data up to PT25.
-- RI will raise an error if there are any notes (PT30-PT90)
-- associated with the case.
-- -----------------------------------------------
DELETE PT25 WHERE CorpID = @CorpID and CaseKey = @CaseKey
DELETE PT22 WHERE CorpID = @CorpID and CaseKey = @CaseKey        -- FEAT030
DELETE PT20 WHERE CorpID = @CorpID and CaseKey = @CaseKey
DELETE PT17 WHERE CorpID = @CorpID and CaseKey = @CaseKey
DELETE IFPT_PT15 WHERE CorpID = @CorpID and CaseKey = @CaseKey  -- SCR 5835
DELETE PT14 WHERE CorpID = @CorpID and CaseKey = @CaseKey   -- SCR 5782
DELETE PT15 WHERE CorpID = @CorpID and CaseKey = @CaseKey
DELETE PT13 WHERE CorpID = @CorpID and CaseKey = @CaseKey
DELETE IFPT_PT11 WHERE CorpID = @CorpID and CaseKey = @CaseKey   -- FEAT116
-- ----------------------------------------------------------------
-- Delete entry from PT_CaseVersion if it exists for this case
-- ----------------------------------------------------------------
IF EXISTS (SELECT *
           FROM   PT_CaseVersion
           WHERE  CorpID = @CorpID
           AND CaseKey = @CaseKey)
BEGIN
    DELETE PT_CaseVersion WHERE CorpID = @CorpID and CaseKey = @CaseKey
END

DELETE PT11 WHERE CorpID = @CorpID and CaseKey = @CaseKey AND PT11TStamp = @CaseTStamp

SELECT @Error = @@ERROR, @Rowcount = @@ROWCOUNT
IF @Error <> 0
  GOTO ErrorHandler

IF @Rowcount = 0
BEGIN
    IF EXISTS (SELECT *
               FROM   PT11
               WHERE  CorpID = @CorpID
        AND CaseKey = @CaseKey
               AND    PT11TStamp <> @CaseTStamp)        
        RAISERROR (50412,16,1)    -- case timestamp changed
    ELSE
        RAISERROR (50410,16,1)    -- action did not change any data (e.g. case deleted)
    RETURN
END

-- --------------------------------------------------------------------------
-- Delete PT_PHI_Notice, IFPT_PT10 and the patient if there are no more cases
-- --------------------------------------------------------------------------
IF NOT EXISTS (SELECT * FROM PT11
                WHERE CorpID = @CorpID
                  and PatientKey = @PatientKey)
BEGIN
    DELETE PT_PHI_Notice
     WHERE CorpID = @CorpID
       AND PatientKey = @PatientKey

    SELECT @Error = @@ERROR
    IF @Error <> 0
      GOTO ErrorHandler

    DELETE IFPT_PT10
     WHERE CorpID = @CorpID
       AND PatientKey = @PatientKey

    SELECT @Error = @@ERROR
    IF @Error <> 0
      GOTO ErrorHandler

    -- Delete Patient Accounts
    UPDATE PT_Acct
       SET AcctUsed = 0
     WHERE CorpID = @CorpID
       AND PatientKey = @PatientKey
       AND AcctUsed = 1

    SELECT @Error = @@ERROR
    IF @Error <> 0
      GOTO ErrorHandler

    UPDATE PT_Acct
       SET AcctActive = 0
     WHERE CorpID = @CorpID
       AND PatientKey = @PatientKey
       AND AcctActive = 1

    SELECT @Error = @@ERROR
    IF @Error <> 0
      GOTO ErrorHandler

    DELETE PT_Acct 
     WHERE CorpID = @CorpID
       AND PatientKey = @PatientKey

    SELECT @Error = @@ERROR
    IF @Error <> 0
      GOTO ErrorHandler

    -- Delete Financial Cap
    DELETE PT29 
     WHERE CorpID = @CorpID
       AND PatientKey = @PatientKey

    SELECT @Error = @@ERROR
    IF @Error <> 0
      GOTO ErrorHandler

    DELETE PT10 
     WHERE CorpID = @CorpID
       AND PatientKey = @PatientKey 

    SELECT @Error = @@ERROR
    IF @Error <> 0
      GOTO ErrorHandler
END

RETURN

ErrorHandler:
  RAISERROR (60000, 16, 1, '''PT11Delete''', @Error)       -- Stored proc failed
  RETURN
GO


/*

select top 100 * from pt11 where not exists (select * from pt30 where pt30.casekey = pt11.casekey)
select * from pt11 where patientkey = 1055716
update pt11 set pt11co = 1 where casekey = 1056364
select * from pt20 where casekey = 1056364

begin transaction
exec pt11delete 'VANCPQ018', 'DBarron', 0x0000000000025365, 1056364
rollback transaction

*/
