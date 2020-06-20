CREATE TABLE [Business].[BailType]
(
	[idbailtype] INT NOT NULL IDENTITY, 
    [label] NVARCHAR(50) NOT NULL, 
    [descr] NVARCHAR(255) NULL, 
    [timerenew] INT NOT NULL, 
    [timelapsrenew] INT NULL, 
    [datein] DATETIME2 NOT NULL CONSTRAINT [DF-Business.BailType-DateIn] DEFAULT (sysdatetime()), 
    [comm] NVARCHAR(MAX) NULL, 
    CONSTRAINT [PK-Business.BailType-IDBailType] PRIMARY KEY ([idbailtype]), 
    CONSTRAINT [UK-Business.BailType-Label] UNIQUE ([label]),
)
