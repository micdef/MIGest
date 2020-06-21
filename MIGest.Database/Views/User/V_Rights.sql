CREATE VIEW [User].[V_Rights]
	AS 
	SELECT	[idright] AS [DatabaseId],
			[label] AS [Label],
			[descr] AS [Descr],
			[flag_active] AS [IsActive],
			[comm] AS [Comment]
	FROM [User].[Right]
