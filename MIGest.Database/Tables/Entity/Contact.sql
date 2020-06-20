CREATE TABLE [Entity].[Contact]
(
	[idcontact] INT NOT NULL IDENTITY, 
    [label] NVARCHAR(50) NOT NULL, 
    [descr] NVARCHAR(255) NULL, 
    [firstname] NVARCHAR(50) NOT NULL, 
    [lastname] NVARCHAR(50) NOT NULL, 
    [email] NVARCHAR(384) NULL, 
    [tel] NVARCHAR(25) NULL, 
    [datein] DATETIME2 NOT NULL CONSTRAINT [DF-Entity.Contact-DateIn] DEFAULT (sysdatetime()), 
    [comm] NVARCHAR(MAX) NULL, 
    CONSTRAINT [PK-Identity.Contact-IDContact] PRIMARY KEY ([idcontact]),
    CONSTRAINT [UK-Identity.Contact-Label] UNIQUE ([label])
)
