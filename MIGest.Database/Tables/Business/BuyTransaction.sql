CREATE TABLE [Business].[BuyTransaction]
(
	[idbuytransaction] INT NOT NULL IDENTITY, 
    [identity] INT NOT NULL, 
    [idownership] INT NOT NULL, 
    [dateaction] DATETIME2 NOT NULL, 
    [amount] FLOAT NOT NULL, 
    [datein] DATETIME2 NOT NULL CONSTRAINT [DF-Business.BuyTransaction-DateIn] DEFAULT (sysdatetime()), 
    [comm] NVARCHAR(MAX) NULL, 
    CONSTRAINT [PK-Business.BuyTransaction-IDBuyTransaction] PRIMARY KEY ([idbuytransaction]), 
    CONSTRAINT [CK-Business.BuyTransaction.Amount] CHECK ([amount] > 0), 
    CONSTRAINT [FK-Business.BuyTransaction.IDEntity] FOREIGN KEY ([identity]) REFERENCES [Entity].[Entity]([identity]), 
    CONSTRAINT [FK-Business.BuyTransaction.IDOwnership] FOREIGN KEY ([idownership]) REFERENCES [Ownership].[Ownership]([idownership]) 
)
