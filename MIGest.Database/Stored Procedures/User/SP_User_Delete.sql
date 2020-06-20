CREATE PROCEDURE [User].[SP_User_Delete]
	@IdUser INT
AS
	DELETE FROM [User].[User] 
	WHERE [iduser] = @IdUser;
