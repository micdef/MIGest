CREATE VIEW [User].[V_Users]
AS
	SELECT	u.[iduser] AS [DatabaseId],
			u.[username] AS [Username],
			u.[firstname] AS [Firstname],
			u.[lastname] AS [Lastname],
			u.[email] AS [Email],
			u.[flag_active] AS [IsActive],
			u.[flag_mustchangepwd] AS [IsMustChangePwd],
			u.[comm] AS [Comment]
	FROM [User].[User] u
	WHERE u.[flag_delete] = 0;