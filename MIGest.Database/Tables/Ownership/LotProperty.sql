CREATE TABLE [Ownership].[LotProperty]
(
	[idlotproperty] INT NOT NULL IDENTITY, 
    [idlot] INT NOT NULL, 
    [idinformationtype] INT NOT NULL, 
    [value] NVARCHAR(255) NULL, 
    [comm] NVARCHAR(MAX) NULL, 
    [valid_from] DATETIME2 NULL, 
    [valid_to] DATETIME2 NULL, 
    CONSTRAINT [PK-Ownership.LotProperty-IDLotProperty] PRIMARY KEY ([idlotproperty]),
    CONSTRAINT [UK-Ownership.LotProperty-IDL_IDIT] UNIQUE ([idlot], [idinformationtype]), 
    CONSTRAINT [FK-Ownership.LotProperty-IDLot] FOREIGN KEY ([idlot]) REFERENCES [Ownership].[Lot]([idlot]), 
    CONSTRAINT [FK-Ownership.LotProperty-IDInformationType] FOREIGN KEY ([idinformationtype]) REFERENCES [Metadata].[InformationType]([idinformationtype])
)

GO

CREATE TRIGGER [Ownership].[TR-ForInsertUpdate-Ownership.LotProperty]
    ON [Ownership].[LotProperty]
    FOR INSERT, UPDATE
    AS
    BEGIN
        SET NoCount ON;
        IF ((SELECT COUNT(*) FROM deleted) > 0)
        BEGIN
            UPDATE [Ownership].[LotProperty] 
            SET [valid_from] = SYSDATETIME(), 
                [valid_to] = '9999-12-31' 
            WHERE [idlotproperty] IN (SELECT [idlotproperty] 
                                      FROM inserted);
            
            UPDATE [Ownership].[LotProperty_History] 
            SET [valid_to] = SYSDATETIME() 
            WHERE [idlotproperty] IN (SELECT [idlotproperty] 
                                      FROM deleted) 
                AND [valid_to] = '9999-12-31';

            INSERT INTO [Ownership].[LotProperty_History]
            SELECT * 
            FROM inserted;

            UPDATE [Ownership].[LotProperty_History]
            SET [valid_from] = SYSDATETIME(),
                [valid_to] = '9999-12-31'
            WHERE [idlotproperty] IN (SELECT [idlotproperty]
                                      FROM inserted)
                AND [valid_from] IS NULL
                AND [valid_to] IS NULL;
        END
        ELSE
        BEGIN
            UPDATE [Ownership].[LotProperty]
            SET [valid_from] = SYSDATETIME(),
                [valid_to] = '9999-12-31'
            WHERE [idlotproperty] IN (SELECT [idlotproperty]
                                      FROM inserted);

            INSERT INTO [Ownership].[LotProperty_History]
            SELECT *
            FROM inserted;

            UPDATE [Ownership].[LotProperty_History]
            SET [valid_from] = SYSDATETIME(),
                [valid_to] = '9999-12-31'
            WHERE [idlotproperty] IN (SELECT [idlotproperty]
                                      FROM inserted)
                AND [valid_from] IS NULL
                AND [valid_to] IS NULL;
        END
    END
GO

CREATE TRIGGER [Ownership].[TR-ForDelete-Ownership.LotProperty]
    ON [Ownership].[LotProperty]
    FOR DELETE
    AS
    BEGIN
        SET NoCount ON;
        UPDATE [Ownership].[LotProperty_History]
        SET [valid_to] = SYSDATETIME()
        WHERE [idlotproperty] IN (SELECT [idlotproperty]
                                  FROM deleted)
            AND [valid_to] = '9999-12-31';
    END