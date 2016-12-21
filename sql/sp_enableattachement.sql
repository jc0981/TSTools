

CREATE PROCEDURE [dbo].[SP_ENABLE_ATTACHMENT] (@CorpID   INT  , @OutServerName  VARCHAR(255) )
AS


DECLARE
        @OutShareName           VARCHAR(255),       -- Output folder: share  part of \\server\share\folder
        @OutFolderNameLinked    VARCHAR(255),       -- Output folder: folder part of \\server\share\folder
        @CreateOutFolder        BIT         ,       -- Output folder: automatically create the out folder
        @OutPathLinked          VARCHAR(255),       -- Path name
        @Error                  INT         ,
        @ErrorMsg               VARCHAR(200),
        @Cmd                    NVARCHAR(2000),
        @RetCode                INT,
        @NewRptPathKey          INT,
        @OutHT06TypeLinked      INT
        

----------------------------------------------------------------------------
-- CONSTANTS ; DO NOT MODIFY
DECLARE     @HT06Type_CLOSEDNOTES        INT,
            @HT06Type_OPENNOTES          INT,
            @HT06Type_ADTOUT             INT,
            @HT06Type_DOCOUT             INT,
            @HT06Type_AttachmentLinked   INT
            

SET @HT06Type_CLOSEDNOTES           = 0
SET @HT06Type_OPENNOTES             = 1
SET @HT06Type_ADTOUT                = 2
SET @HT06Type_DOCOUT                = 3
SET @HT06Type_AttachmentLinked      = 4
----------------------------------------------------------------------------


----- TODO: Set Values -----


SET @OutShareName           = 'Reports'
SET @CreateOutFolder        = 0
SET @OutHT06TypeLinked      = @HT06Type_AttachmentLinked     -- USE HT06Type_ CONST above

----------------------------------------------------------------------------
-- Compile HT06 Path
----------------------------------------------------------------------------
SELECT @OutFolderNameLinked      =  'Corp' + CONVERT(VARCHAR, @CorpID) + '\' + 'Attachments' + '\' + 'Linked'
SELECT @OutPathLinked            = '\\' + @OutServerName + '\' + @OutShareName + '\'  + @OutFolderNameLinked + '\'

----------------------------------------------------------------------------
-- Linekd path'
----------------------------------------------------------------------------

IF NOT EXISTS(SELECT * FROM HT06 WHERE CorpID = @CorpID AND HT06Type = @OutHT06TypeLinked)
BEGIN 
    EXEC HT06Insert @CorpID             = @CorpID,
                    @HT06Type           = @OutHT06TypeLinked,
                    @OutPath            = @OutPathLinked,
                    @CreateOutFolder    = @CreateOutFolder
END
ELSE
BEGIN
    EXEC HT06Update @CorpID             = @CorpID,
                    @HT06Type           = @OutHT06TypeLinked,
                    @OutPath            = @OutPathLinked
END

------------------------------------------------------------
-- Success exit
------------------------------------------------------------
RETURN


------------------------------------------------------------
-- Failure exit
--------------------------------------------------------------------
ErrorHandler:

SET @ErrorMsg = 'InsertHT06_AttachmentsPaths: ' + @ErrorMsg
RAISERROR (@ErrorMsg,16,1)
RETURN

GO


