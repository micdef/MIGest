CREATE TABLE [Entity].[Entity]
(
	[identity] INT NOT NULL IDENTITY, 
    [idlegalform] INT NOT NULL, 
    [label] NVARCHAR(50) NOT NULL, 
    [descr] NVARCHAR(255) NULL, 
    [datein] DATETIME2 NOT NULL CONSTRAINT [DF-Entity.Entity-DateIn] DEFAULT (sysdatetime()), 
    [comm] NVARCHAR(MAX) NULL, 
    CONSTRAINT [PK-Entity.Entity-IDEntity] PRIMARY KEY ([identity]),
    CONSTRAINT [UK-Entity.Entity-Label] UNIQUE ([label]), 
    CONSTRAINT [FK-Entity.Entity-IDLegalForm] FOREIGN KEY ([idlegalform]) REFERENCES [Entity].[LegalForm]([idlegalform])
)
