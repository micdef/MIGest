CREATE TABLE [Metadata].[ObjectType]
(
	[idobjecttype] INT NOT NULL IDENTITY, 
    [label] NVARCHAR(50) NOT NULL, 
    [descr] NVARCHAR(50) NULL, 
    [datein] DATETIME2 NOT NULL CONSTRAINT [DF-Metadata.ObjectType-DateIn] DEFAULT (sysdatetime()), 
    [comm] NVARCHAR(MAX) NULL, 
    CONSTRAINT [PK-Metadata.ObjectType-IDObjectType] PRIMARY KEY ([idobjecttype]),
    CONSTRAINT [UK-Metadata.ObjectType-Label] UNIQUE ([label])
)
