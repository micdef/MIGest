CREATE PROCEDURE [User].[SP_User_User_Update]
	@IdUser INT,
	@Firstname NVARCHAR(50),
	@Lastname NVARCHAR(50),
	@Email NVARCHAR(50),
	@IsActive BIT,
	@Comm NVARCHAR(MAX) = NULL
AS
	UPDATE [User].[User]
	SET [firstname] = @Firstname,
		[lastname] = @Lastname,
		[email] = @Email,
		[flag_active] = @IsActive,
		[comm] = @Comm
	WHERE [iduser] = @IdUser
