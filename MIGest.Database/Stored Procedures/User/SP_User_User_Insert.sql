CREATE PROCEDURE [User].[SP_User_User_Insert]
	@Username NVARCHAR(50),
	@Password NVARCHAR(50),
	@Firstname NVARCHAR(50),
	@Lastname NVARCHAR(50),
	@Email NVARCHAR(50),
	@Comm NVARCHAR(MAX) = NULL
AS
	IF ([User].[F_CheckUserExists](@Username) = 0)
		INSERT INTO [User].[User] ([username], [password], [firstname], [lastname], [email], [comm])
		OUTPUT inserted.[iduser]
		VALUES (@Username, [User].[F_GetHash](@Password), @Firstname, @Lastname, @Email, @Comm);
	ELSE
		UPDATE [User].[User] 
		SET [flag_delete] = 0, 
			[flag_active] = 1, 
			[flag_mustchangepwd] = 1,
			[password] = [User].[F_GetHash](@Password)
		WHERE [username] = @Username;