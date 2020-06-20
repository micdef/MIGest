CREATE TABLE [Ownership].[OwnershipProperty]
(
	[idownershipproperty] INT NOT NULL IDENTITY, 
    [idownership] INT NOT NULL, 
    [idinformationtype] INT NOT NULL, 
    [value] NVARCHAR(255) NULL, 
    [comm] NVARCHAR(MAX) NULL, 
    [valid_from] DATETIME2 NULL, 
    [valid_to] DATETIME2 NULL, 
    CONSTRAINT [PK-Ownership.OwnershipProperty-IDOwnershipProperty] PRIMARY KEY ([idownershipproperty]),
    CONSTRAINT [UK-Ownership.OwnershipProperty-IDO_IDIT] UNIQUE ([idownership], [idinformationtype]), 
    CONSTRAINT [FK-Ownership.OwnershipProperty-IDOwnership] FOREIGN KEY ([idownership]) REFERENCES [Ownership].[Ownership]([idownership]), 
    CONSTRAINT [FK-Ownership.OwnershipProperty-IDInformationType] FOREIGN KEY ([idinformationtype]) REFERENCES [Metadata].[InformationType]([idinformationtype])
)

GO

CREATE TRIGGER [Ownership].[TR-ForInsertUpdate-Ownership.OwnershipProperty]
    ON [Ownership].[OwnershipProperty]
    FOR INSERT, UPDATE
    AS
    BEGIN
        SET NoCount ON;
        IF ((SELECT COUNT(*) FROM deleted) > 0)
        BEGIN
            UPDATE [Ownership].[OwnershipProperty] 
            SET [valid_from] = SYSDATETIME(), 
                [valid_to] = '9999-12-31' 
            WHERE [idownershipproperty] IN (SELECT [idownershipproperty] 
                                            FROM inserted);
            
            UPDATE [Ownership].[OwnershipProperty_History] 
            SET [valid_to] = SYSDATETIME() 
            WHERE [idownershipproperty] IN (SELECT [idownershipproperty] 
                                            FROM deleted) 
                AND [valid_to] = '9999-12-31';

            INSERT INTO [Ownership].[OwnershipProperty_History]
            SELECT * 
            FROM inserted;

            UPDATE [Ownership].[OwnershipProperty]
            SET [valid_from] = SYSDATETIME(),
                [valid_to] = '9999-12-31'
            WHERE [idownershipproperty] IN (SELECT [idownershipproperty]
                                            FROM inserted)
                AND [valid_from] IS NULL
                AND [valid_to] IS NULL;
        END
        ELSE
        BEGIN
            UPDATE [Ownership].[OwnershipProperty]
            SET [valid_from] = SYSDATETIME(),
                [valid_to] = '9999-12-31'
            WHERE [idownershipproperty] IN (SELECT [idownershipproperty]
                                            FROM inserted);

            INSERT INTO [Ownership].[OwnershipProperty_History]
            SELECT *
            FROM inserted;

            UPDATE [Ownership].[OwnershipProperty]
            SET [valid_from] = SYSDATETIME(),
                [valid_to] = '9999-12-31'
            WHERE [idownershipproperty] IN (SELECT [idownershipproperty]
                                            FROM inserted)
                AND [valid_from] IS NULL
                AND [valid_to] IS NULL;
        END
    END
GO

CREATE TRIGGER [Ownership].[TR-ForDelete-Ownership.OwnershipProperty]
    ON [Ownership].[OwnershipProperty]
    FOR DELETE
    AS
    BEGIN
        SET NoCount ON;
        UPDATE [Ownership].[OwnershipProperty_History]
        SET [valid_to] = SYSDATETIME()
        WHERE [idownershipproperty] IN (SELECT [idownershipproperty] 
                                        FROM deleted)
            AND [valid_to] = '9999-12-31';
    END