--***********************************************************
--INSERT Stored Procedure for InvoiceItem table
--***********************************************************
GO

USE PMMS
GO

IF EXISTS (SELECT sys.objects.name FROM sys.objects INNER JOIN sys.schemas ON sys.objects.schema_id = sys.schemas.schema_id WHERE sys.objects.name = 'InvoiceItemInsert'    and sys.objects.type = 'P') 
DROP PROCEDURE [InvoiceItemInsert] 
GO

CREATE PROCEDURE [InvoiceItemInsert] 
      @InvoiceID int
     ,@InvoiceItemID int
     ,@Description varchar(8000)
     ,@Quantity decimal(18,2)
     ,@Rate decimal(18,2)
     ,@DiscountAmount decimal(18,2)
     ,@CGSTRate decimal(18,2)
     ,@SGSTRate decimal(18,2)
     ,@IGSTRate decimal(18,2)
     ,@ReturnValue int OUTPUT
AS
BEGIN

SET NOCOUNT ON

BEGIN TRANSACTION 

BEGIN TRY 

INSERT [InvoiceItem]
     (
      [InvoiceID]
     ,[InvoiceItemID]
     ,[Description]
     ,[Quantity]
     ,[Rate]
     ,[DiscountAmount]
     ,[CGSTRate]
     ,[SGSTRate]
     ,[IGSTRate]
     )
VALUES
     (
      @InvoiceID
     ,@InvoiceItemID
     ,@Description
     ,@Quantity
     ,@Rate
     ,@DiscountAmount
     ,@CGSTRate
     ,@SGSTRate
     ,@IGSTRate
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

GRANT EXECUTE ON [InvoiceItemInsert] TO [Public]
GO
 
