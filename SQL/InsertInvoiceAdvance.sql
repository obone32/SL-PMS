--***********************************************************
--INSERT Stored Procedure for InvoiceAdvance table
--***********************************************************
GO

USE PMMS
GO

IF EXISTS (SELECT sys.objects.name FROM sys.objects INNER JOIN sys.schemas ON sys.objects.schema_id = sys.schemas.schema_id WHERE sys.objects.name = 'InvoiceAdvanceInsert'    and sys.objects.type = 'P') 
DROP PROCEDURE [InvoiceAdvanceInsert] 
GO

CREATE PROCEDURE [InvoiceAdvanceInsert] 
      @InvoiceID int
     ,@AdvancePaymentID int
     ,@ReturnValue int OUTPUT
AS
BEGIN

SET NOCOUNT ON

BEGIN TRANSACTION 

BEGIN TRY 

INSERT [InvoiceAdvance]
     (
      [InvoiceID]
     ,[AdvancePaymentID]
     )
VALUES
     (
      @InvoiceID
     ,@AdvancePaymentID
     )

IF @@ROWCOUNT = 0
BEGIN
     ROLLBACK TRANSACTION
     SET @ReturnValue = 0
     RETURN @ReturnValue
END
ELSE
BEGIN
     COMMIT TRANSACTION
     SET @ReturnValue = 1
     RETURN @ReturnValue
END

END TRY

BEGIN CATCH
     DECLARE @Error_Message varchar(150)
     SET @Error_Message = ERROR_NUMBER() + ' ' + ERROR_MESSAGE()
     ROLLBACK TRANSACTION
     RAISERROR(@Error_Message,16,1)
      SET @ReturnValue = -1
      RETURN @ReturnValue
END CATCH

END
GO

GRANT EXECUTE ON [InvoiceAdvanceInsert] TO [Public]
GO
 
