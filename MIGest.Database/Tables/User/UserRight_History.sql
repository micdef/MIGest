CREATE TABLE [User].[UserRight_History]
(
	[iduserright] INT NULL, 
    [iduser] INT NULL, 
    [idright] INT NULL, 
    [flag_read] BIT NULL, 
    [flag_write] BIT NULL,
    [comm] NVARCHAR(MAX) NULL, 
    [valid_from] DATETIME2 NULL, 
    [valid_to] DATETIME2 NULL
)
