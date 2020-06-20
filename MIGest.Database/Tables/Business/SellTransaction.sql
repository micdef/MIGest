CREATE TABLE [Business].[SellTransaction]
(
	[idselltransaction] INT NOT NULL, 
    [identity] INT NOT NULL, 
    [idownership] INT NOT NULL, 
    [dateaction] DATETIME2 NOT NULL, 
    [amount] FLOAT NOT NULL, 
    [datein] DATETIME2 NOT NULL CONSTRAINT [DF-Business.SellTransaction-DateIn] DEFAULT (sysdatetime()), 
    [comm] NVARCHAR(MAX) NULL, 
    CONSTRAINT [PK-Business.SellTransaction-IDSellTransaction] PRIMARY KEY ([idselltransaction]), 
    CONSTRAINT [CK-Business.SellTransaction.Amount] CHECK ([amount] > 0), 
    CONSTRAINT [FK-Business.SellTransaction.IDEntity] FOREIGN KEY ([identity]) REFERENCES [Entity].[Entity]([identity]), 
    CONSTRAINT [FK-Business.SellTransaction.IDOwnership] FOREIGN KEY ([idownership]) REFERENCES [Ownership].[Ownership]([idownership])
)
