CREATE VIEW [User].[V_UserRights]
	AS 
	SELECT	ur.[iduserright] AS [DatabseId],
			ur.[iduser] AS [DatabaseIdUser],
			r.[idright] AS [DatabaseIdRight],
			r.[label] AS [Label],
			r.[descr] AS [Descr],
			r.[flag_active] AS [IsActive],
			r.[comm] AS [CommentRight],
			ur.[flag_read] AS [IsReadable],
			ur.[flag_write] AS [IsWriteable],
			ur.[comm] AS [Comment]
	FROM [User].[UserRight] ur
		INNER JOIN [User].[Right] r ON r.[idright] = ur.[idright]
