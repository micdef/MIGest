CREATE TABLE [Business].[Bail]
(
	[idbail] INT NOT NULL IDENTITY, 
    [identity] INT NOT NULL, 
    [idbailtype] INT NOT NULL, 
    [idlot] INT NOT NULL, 
    [datebegin] DATETIME2 NOT NULL, 
    [dateend] DATETIME2 NULL, 
    [comm] NVARCHAR(MAX) NULL, 
    [valid_from] DATETIME2 NULL, 
    [valid_to] DATETIME2 NULL, 
    CONSTRAINT [PK-Business.Bail-IDBail] PRIMARY KEY ([idbail]), 
    CONSTRAINT [UK-Business.Bail-IDE_IDL_DateB] UNIQUE ([identity], [idlot], [datebegin]), 
    CONSTRAINT [FK-Business.Bail-IDEntity] FOREIGN KEY ([identity]) REFERENCES [Entity].[Entity]([identity]), 
    CONSTRAINT [FK-Business.Bail-IDBailType] FOREIGN KEY ([idbailtype]) REFERENCES [Business].[BailType]([idbailtype]), 
    CONSTRAINT [FK-Business.Bail-IDLot] FOREIGN KEY ([idlot]) REFERENCES [Ownership].[Lot]([idlot]) 
)

GO

CREATE TRIGGER [Business].[TR-ForInsertUpdate-Business.Bail]
    ON [Business].[Bail]
    FOR INSERT, UPDATE
    AS
    BEGIN
        SET NoCount ON;
        IF ((SELECT COUNT(*) FROM deleted) > 0)
        BEGIN
            UPDATE [Business].[Bail] 
            SET [valid_from] = SYSDATETIME(), 
                [valid_to] = '9999-12-31' 
            WHERE [idbail] IN (SELECT [idbail] 
                               FROM inserted);
            
            UPDATE [Business].[Bail_History] 
            SET [valid_to] = SYSDATETIME() 
            WHERE [idbail] IN (SELECT [idbail]
                               FROM deleted) 
                AND [valid_to] = '9999-12-31';

            INSERT INTO [Business].[Bail_History]
            SELECT * 
            FROM inserted;

            UPDATE [Business].[Bail]
            SET [valid_from] = SYSDATETIME(),
                [valid_to] = '9999-12-31'
            WHERE [idbail] IN (SELECT [idbail]
                               FROM inserted)
                AND [valid_from] IS NULL
                AND [valid_to] IS NULL;
        END
        ELSE
        BEGIN
            UPDATE [Business].[Bail_History]
            SET [valid_from] = SYSDATETIME(),
                [valid_to] = '9999-12-31'
            WHERE [idbail] IN (SELECT [idbail]
                               FROM inserted);

            INSERT INTO [Business].[Bail_History]
            SELECT *
            FROM inserted;

            UPDATE [Business].[Bail]
            SET [valid_from] = SYSDATETIME(),
                [valid_to] = '9999-12-31'
            WHERE [idbail] IN (SELECT [idbail]
                               FROM inserted)
                AND [valid_from] IS NULL
                AND [valid_to] IS NULL;
        END
    END
GO

CREATE TRIGGER [Business].[TR-ForDelete-Business.Bail]
    ON [Business].[Bail]
    FOR DELETE
    AS
    BEGIN
        SET NoCount ON;
        UPDATE [Business].[Bail_History]
        SET [valid_to] = SYSDATETIME()
        WHERE [idbail] IN (SELECT [idbail]
                           FROM deleted)
            AND [valid_to] = '9999-12-31';
    END