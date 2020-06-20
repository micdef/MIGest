CREATE TABLE [Entity].[LegalForm]
(
	[idlegalform] INT NOT NULL IDENTITY, 
    [code] NVARCHAR(10) NOT NULL, 
    [label] NVARCHAR(50) NOT NULL, 
    [descr] NVARCHAR(255) NULL, 
    [datein] DATETIME2 NOT NULL CONSTRAINT [DF-Entity.LegalForm-DateIn] DEFAULT (sysdatetime()), 
    [comm] NVARCHAR(MAX) NULL, 
    CONSTRAINT [PK-Entity.LegalForm-IDLegalForm] PRIMARY KEY ([idlegalform]),
    CONSTRAINT [UK-Entity.LegalForm-Code] UNIQUE ([code])
)
