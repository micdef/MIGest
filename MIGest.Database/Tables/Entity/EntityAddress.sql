CREATE TABLE [Entity].[EntityAddress]
(
	[identityaddress] INT NOT NULL IDENTITY, 
    [identity] INT NOT NULL, 
    [idaddresstype] INT NOT NULL, 
    [idaddress] INT NOT NULL, 
    [comm] NVARCHAR(MAX) NULL, 
    [valid_from] DATETIME2 NULL, 
    [valid_to] DATETIME2 NULL, 
    CONSTRAINT [PK-Entity.EntityAddress-IDEntityAddress] PRIMARY KEY ([identityaddress]),
    CONSTRAINT [CK-Entity.EntityAddress-IDE_IDAT_IDA] UNIQUE ([identity], [idaddresstype], [idaddress]), 
    CONSTRAINT [FK-Entity.EntityAddress-IDEntity] FOREIGN KEY ([identity]) REFERENCES [Entity].[Entity]([identity]), 
    CONSTRAINT [FK-Entity.EntityAddress-IDAddressType] FOREIGN KEY ([idaddresstype]) REFERENCES [Entity].[AddressType]([idaddresstype]), 
    CONSTRAINT [FK-Entity.EntityAddress-IDAddress] FOREIGN KEY ([idaddress]) REFERENCES [Entity].[Address]([idaddress])
)

GO

CREATE TRIGGER [Entity].[TR-ForInsertUpdate-Entity.EntityAddress]
    ON [Entity].[EntityAddress]
    FOR INSERT, UPDATE
    AS
    BEGIN
        SET NoCount ON;
        IF ((SELECT COUNT(*) FROM deleted) > 0)
        BEGIN
            UPDATE [Entity].[EntityAddress] 
            SET [valid_from] = SYSDATETIME(), 
                [valid_to] = '9999-12-31' 
            WHERE [identityaddress] IN (SELECT [identityaddress] 
                                        FROM inserted);
            
            UPDATE [Entity].[EntityAddress_History] 
            SET [valid_to] = SYSDATETIME() 
            WHERE [identityaddress] IN (SELECT [identityaddress] 
                                        FROM deleted) 
                AND [valid_to] = '9999-12-31';

            INSERT INTO [Entity].[EntityAddress_History]
            SELECT * 
            FROM inserted;

            UPDATE [Entity].[EntityAddress]
            SET [valid_from] = SYSDATETIME(),
                [valid_to] = '9999-12-31'
            WHERE [identityaddress] IN (SELECT [identityaddress]
                                        FROM inserted)
                AND [valid_from] IS NULL
                AND [valid_to] IS NULL;
        END
        ELSE
        BEGIN
            UPDATE [Entity].[EntityContact]
            SET [valid_from] = SYSDATETIME(),
                [valid_to] = '9999-12-31'
            WHERE [identitycontact] IN (SELECT [identitycontact]
                                        FROM inserted);

            INSERT INTO [Entity].[EntityContact_History]
            SELECT *
            FROM inserted;

            UPDATE [Entity].[EntityAddress]
            SET [valid_from] = SYSDATETIME(),
                [valid_to] = '9999-12-31'
            WHERE [identityaddress] IN (SELECT [identityaddress]
                                        FROM inserted)
                AND [valid_from] IS NULL
                AND [valid_to] IS NULL;
        END
    END
GO

CREATE TRIGGER [Entity].[TR-ForDelete-Entity.EntityAddress]
    ON [Entity].[EntityAddress]
    FOR DELETE
    AS
    BEGIN
        SET NoCount ON;
        UPDATE [Entity].[EntityAddress_History]
        SET [valid_to] = SYSDATETIME()
        WHERE [identityaddress] IN (SELECT [identityaddress] 
                                    FROM deleted)
            AND [valid_to] = '9999-12-31';
    END