CREATE TABLE [Business].[Bail_History]
(
	[idbail] INT NULL, 
    [identity] INT NULL, 
    [idbailtype] INT NULL, 
    [idlot] INT NULL, 
    [datebegin] DATETIME2 NULL, 
    [dateend] DATETIME2 NULL, 
    [comm] NVARCHAR(MAX) NULL, 
    [valid_from] DATETIME2 NULL, 
    [valid_to] DATETIME2 NULL
)
