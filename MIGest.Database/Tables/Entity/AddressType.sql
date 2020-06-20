CREATE TABLE [Entity].[AddressType]
(
	[idaddresstype] INT NOT NULL IDENTITY, 
    [label] NVARCHAR(50) NOT NULL, 
    [descr] NVARCHAR(255) NULL, 
    [datein] DATETIME2 NOT NULL CONSTRAINT [DF-Entity.AddressType-DateIn] DEFAULT (sysdatetime()), 
    [comm] NVARCHAR(MAX) NULL, 
    CONSTRAINT [PK-Entity.AddressType-IDAddressType] PRIMARY KEY ([idaddresstype]),
    CONSTRAINT [UK-Entity.AddressType-Label] UNIQUE ([label])
)
