CREATE TABLE [Ownership].[Lot]
(
	[idlot] INT NOT NULL IDENTITY, 
    [idownership] INT NOT NULL, 
    [label] NVARCHAR(50) NOT NULL, 
    [descr] NVARCHAR(255) NULL, 
    [flag_active] BIT NOT NULL CONSTRAINT [DF-Ownership.Lot-Flag_Active] DEFAULT (1), 
    [secondary_box] NVARCHAR(10) NULL, 
    [datein] DATETIME2 NOT NULL CONSTRAINT [DF-Onwership.Lot-DateIn] DEFAULT (sysdatetime()), 
    [comm] NVARCHAR(MAX) NULL, 
    CONSTRAINT [PK-Ownership.Lot-IDLot] PRIMARY KEY ([idlot]),
    CONSTRAINT [UK-Ownership.Lot-Label] UNIQUE ([label]), 
    CONSTRAINT [FK-Ownership.Lot-IDOwnership] FOREIGN KEY ([idownership]) REFERENCES [Ownership].[Ownership]([idownership])
)
