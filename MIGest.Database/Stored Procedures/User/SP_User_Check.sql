CREATE PROCEDURE [User].[SP_User_Check]
	@Username NVARCHAR(50),
	@Password NVARCHAR(50)
AS
	SELECT	[iduser] AS [DatabaseID],
			[username] As [Username],
			[firstname] AS [Firstname],
			[lastname] AS [Lastname],
			[email] AS [Email],
			[flag_active] AS [IsActive],
			[flag_mustchangepwd] AS [IsMustChangePwd],
			[comm] AS [Comment]
	FROM [User].[User]
	WHERE [username] = @Username
		AND [password] = [User].[F_GetHash](@Password);
