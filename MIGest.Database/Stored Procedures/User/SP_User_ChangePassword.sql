CREATE PROCEDURE [User].[SP_User_ChangePassword]
	@IdUser INT,
	@Password NVARCHAR(50)
AS
	UPDATE [User].[User]
	SET [password] = [User].[F_GetHash](@Password),
		[flag_mustchangepwd] = 0
	WHERE [iduser] = @IdUser;
