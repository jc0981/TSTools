declare @PayerKey int
declare @PayerName varchar(30)
declare @CorpID int
declare @CodeSetKey int


set @CodeSetKey =1

----------------------change values ------------------------------------
set @CorpID = 9130
Set @PayerName='1199'

----------------------change values ------------------------------------


select @PayerKey=PayerKey from AT60
where AT60CoNam =@PayerName and CorpID = @CorpID

IF @@ROWCOUNT <> 1 
	BEGIN
		PRINT 'Could not locate  payer  named ''' + @payername + ''''
		RETURN
	END
	
	 
	exec AT61Delete
    @CorpID , 
    @PayerKey ,
    @CodeSetKey
     