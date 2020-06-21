CREATE PROCEDURE [User].[SP_User_Right_Insert]
	@Label NVARCHAR(50),
	@Descr NVARCHAR(255),
	@Comm NVARCHAR(MAX) = NULL
AS
	IF ([User].[F_CheckRightExists](@Label) = 0)
		INSERT INTO [User].[Right] ([label], [descr], [comm])
		OUTPUT inserted.[idright]
		VALUES (@Label, @Descr, @Comm);
	ELSE
		UPDATE [User].[Right]
		SET [flag_delete] = 0,
			[flag_active] = 1
		WHERE [label] = @Label;