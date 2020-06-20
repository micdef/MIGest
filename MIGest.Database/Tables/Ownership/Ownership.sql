CREATE TABLE [Ownership].[Ownership]
(
	[idownership] INT NOT NULL IDENTITY, 
    [idaddress] INT NOT NULL, 
    [label] NVARCHAR(50) NOT NULL, 
    [descr] NVARCHAR(255) NULL, 
    [flag_active] BIT NOT NULL CONSTRAINT [DF-Ownership.Ownership-Flag_Active] DEFAULT (1), 
    [datein] DATETIME2 NOT NULL CONSTRAINT [DF-Ownership.Ownership-DateIn] DEFAULT (sysdatetime()), 
    [comm] NVARCHAR(MAX) NULL, 
    CONSTRAINT [PK-Ownership.Ownership-IDOwnership] PRIMARY KEY ([idownership]),
    CONSTRAINT [UK-Ownership.Ownership-Labe] UNIQUE ([label]), 
    CONSTRAINT [FK-Ownership.Ownership-IDAddress] FOREIGN KEY ([idaddress]) REFERENCES [Entity].[Address]([idaddress]), 
)
