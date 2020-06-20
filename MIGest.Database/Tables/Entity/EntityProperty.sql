CREATE TABLE [Entity].[EntityProperty]
(
	[identityproperty] INT NOT NULL IDENTITY, 
    [identity] INT NOT NULL, 
    [idinformationtype] INT NOT NULL, 
    [value] NVARCHAR(255) NULL, 
    [comm] NVARCHAR(MAX) NULL, 
    [valid_from] DATETIME2 NULL, 
    [valid_to] DATETIME2 NULL, 
    CONSTRAINT [PK-Entity.EntityProperty-IDEntityProperty] PRIMARY KEY ([identityproperty]),
    CONSTRAINT [UK-Entity.EntityProperty-IDE_IDIT] UNIQUE ([identity], [idinformationtype]), 
    CONSTRAINT [FK-Entity.EntityProperty-IDEntity] FOREIGN KEY ([identity]) REFERENCES [Entity].[Entity]([identity]), 
    CONSTRAINT [FK-Entity.EntityProperty-IDInformationType] FOREIGN KEY ([idinformationtype]) REFERENCES [Metadata].[InformationType]([idinformationtype])
)

GO

CREATE TRIGGER [Entity].[TR-ForInsertUpdate-Entity.EntityProperty]
    ON [Entity].[EntityProperty]
    FOR INSERT, UPDATE
    AS
    BEGIN
        SET NoCount ON;
        IF ((SELECT COUNT(*) FROM deleted) > 0)
        BEGIN
            UPDATE [Entity].[EntityProperty] 
            SET [valid_from] = SYSDATETIME(), 
                [valid_to] = '9999-12-31' 
            WHERE [identityproperty] IN (SELECT [identityproperty] 
                                         FROM inserted);
            
            UPDATE [Entity].[EntityProperty_History] 
            SET [valid_to] = SYSDATETIME() 
            WHERE [identityproperty] IN (SELECT [identityproperty] 
                                         FROM deleted) 
                AND [valid_to] = '9999-12-31';

            INSERT INTO [Entity].[EntityProperty_History]
            SELECT * 
            FROM inserted;

            UPDATE [Entity].[EntityProperty]
            SET [valid_from] = SYSDATETIME(),
                [valid_to] = '9999-12-31'
            WHERE [identityproperty] IN (SELECT [identityproperty]
                                         FROM inserted)
                AND [valid_from] IS NULL
                AND [valid_to] IS NULL;
        END
        ELSE
        BEGIN
            UPDATE [Entity].[EntityProperty]
            SET [valid_from] = SYSDATETIME(),
                [valid_to] = '9999-12-31'
            WHERE [identityproperty] IN (SELECT [identityproperty]
                                         FROM inserted);

            INSERT INTO [Entity].[EntityContact_History]
            SELECT *
            FROM inserted;

            UPDATE [Entity].[EntityProperty]
            SET [valid_from] = SYSDATETIME(),
                [valid_to] = '9999-12-31'
            WHERE [identityproperty] IN (SELECT [identityproperty]
                                         FROM inserted)
                AND [valid_from] IS NULL
                AND [valid_to] IS NULL;
        END
    END
GO

CREATE TRIGGER [Entity].[TR-ForDelete-Entity.EntityProperty]
    ON [Entity].[EntityProperty]
    FOR DELETE
    AS
    BEGIN
        SET NoCount ON;
        UPDATE [Entity].[EntityProperty_History]
        SET [valid_to] = SYSDATETIME()
        WHERE [identityproperty] IN (SELECT [identityproperty] 
                                     FROM deleted)
            AND [valid_to] = '9999-12-31';
    END