CREATE TABLE [Entity].[EntityContact_History]
(
	[identitycontact] INT NULL, 
    [identity] INT NULL, 
    [idcontact] INT NULL, 
    [role] NVARCHAR(50) NULL, 
    [comm] NVARCHAR(MAX) NULL, 
    [valid_from] DATETIME2 NULL, 
    [valid_to] DATETIME2 NULL
)
