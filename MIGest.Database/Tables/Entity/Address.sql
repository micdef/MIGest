CREATE TABLE [Entity].[Address]
(
	[idaddress] INT NOT NULL IDENTITY, 
    [label] NVARCHAR(50) NOT NULL, 
    [descr] NVARCHAR(255) NULL, 
    [country] NVARCHAR(50) NOT NULL, 
    [state] NVARCHAR(50) NULL, 
    [zipcode] NVARCHAR(25) NOT NULL, 
    [city] NVARCHAR(50) NOT NULL, 
    [street] NVARCHAR(50) NOT NULL, 
    [streetnumber] NVARCHAR(10) NOT NULL, 
    [streetbox] NVARCHAR(10) NULL, 
    [datein] DATETIME2 NOT NULL CONSTRAINT [DF-Entity.Address-DateIn] DEFAULT (sysdatetime()), 
    [comm] NVARCHAR(MAX) NULL, 
    CONSTRAINT [PK-Entity.Address-IDAddress] PRIMARY KEY ([idaddress]),
    CONSTRAINT [UK-Entity.Address-Label] UNIQUE ([label])
)
