CREATE TABLE [Business].[BailRent]
(
	[idbailrent] INT NOT NULL IDENTITY, 
    [idbail] INT NOT NULL, 
    [amount] FLOAT NOT NULL, 
    [comm] NVARCHAR(MAX) NULL, 
    [valid_from] DATETIME2 NULL, 
    [valid_to] DATETIME2 NULL, 
    CONSTRAINT [PK-Business.BailRent-IDBailRent] PRIMARY KEY ([idbailrent]), 
    CONSTRAINT [UK-Business.BailRent-IDBail] UNIQUE ([idbail]), 
    CONSTRAINT [CK-Business.BailRent-Amount] CHECK ([amount] > 0), 
    CONSTRAINT [FK-Business.BailRent-IDBail] FOREIGN KEY ([idbail]) REFERENCES [Business].[Bail]([idbail]) 
)

GO

CREATE TRIGGER [Business].[TR-ForInsertUpdate-Business.BailRent]
    ON [Business].[BailRent]
    FOR INSERT, UPDATE
    AS
    BEGIN
        SET NoCount ON;
        IF ((SELECT COUNT(*) FROM deleted) > 0)
        BEGIN
            UPDATE [Business].[BailRent] 
            SET [valid_from] = SYSDATETIME(), 
                [valid_to] = '9999-12-31' 
            WHERE [idbailrent] IN (SELECT [idbailrent] 
                                   FROM inserted);
            
            UPDATE [Business].[BailRent_History] 
            SET [valid_to] = SYSDATETIME() 
            WHERE [idbailrent] IN (SELECT [idbailrent]
                                   FROM deleted) 
                AND [valid_to] = '9999-12-31';

            INSERT INTO [Business].[BailRent_History]
            SELECT * 
            FROM inserted;

            UPDATE [Business].[BailRent]
            SET [valid_from] = SYSDATETIME(),
                [valid_to] = '9999-12-31'
            WHERE [idbailrent] IN (SELECT [idbailrent]
                               FROM inserted)
                AND [valid_from] IS NULL
                AND [valid_to] IS NULL;
        END
        ELSE
        BEGIN
            UPDATE [Business].[BailRent_History]
            SET [valid_from] = SYSDATETIME(),
                [valid_to] = '9999-12-31'
            WHERE [idbailrent] IN (SELECT [idbailrent]
                                   FROM inserted);

            INSERT INTO [Business].[BailRent_History]
            SELECT *
            FROM inserted;

            UPDATE [Business].[BailRent]
            SET [valid_from] = SYSDATETIME(),
                [valid_to] = '9999-12-31'
            WHERE [idbailrent] IN (SELECT [idbailrent]
                               FROM inserted)
                AND [valid_from] IS NULL
                AND [valid_to] IS NULL;
        END
    END
GO

CREATE TRIGGER [Business].[TR-ForDelete-Business.BailRent]
    ON [Business].[BailRent]
    FOR DELETE
    AS
    BEGIN
        SET NoCount ON;
        UPDATE [Business].[BailRent_History]
        SET [valid_to] = SYSDATETIME()
        WHERE [idbailrent] IN (SELECT [idbailrent]
                               FROM deleted)
            AND [valid_to] = '9999-12-31';
    END