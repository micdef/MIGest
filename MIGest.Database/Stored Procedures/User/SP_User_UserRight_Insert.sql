CREATE PROCEDURE [User].[SP_User_UserRight_Insert]
	@IdUser INT,
	@IdRight INT,
	@IsReadable BIT = 1,
	@IsWriteable BIT = 0,
	@Comm NVARCHAR(MAX) = NULL
AS
	INSERT INTO [User].[UserRight] ([iduser], [idright], [flag_read], [flag_write], [comm])
	VALUES (@IdUser, @IdRight, @IsReadable, @IsWriteable, @Comm);