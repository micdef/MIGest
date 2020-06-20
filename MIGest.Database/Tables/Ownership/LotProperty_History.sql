CREATE TABLE [Ownership].[LotProperty_History]
(
	[idlotproperty] INT NULL, 
    [idlot] INT NULL, 
    [idinformationtype] INT NULL, 
    [value] NVARCHAR(255) NULL, 
    [comm] NVARCHAR(MAX) NULL, 
    [valid_from] DATETIME2 NULL, 
    [valid_to] DATETIME2 NULL
)
