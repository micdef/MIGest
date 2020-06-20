CREATE TABLE [Entity].[EntityContact]
(
	[identitycontact] INT NOT NULL IDENTITY, 
    [identity] INT NOT NULL, 
    [idcontact] INT NOT NULL, 
    [role] NVARCHAR(50) NOT NULL, 
    [comm] NVARCHAR(MAX) NULL, 
    [valid_from] DATETIME2 NULL, 
    [valid_to] DATETIME2 NULL, 
    CONSTRAINT [PK-Entity.EntityContact-IDEntityContact] PRIMARY KEY ([identitycontact]), 
    CONSTRAINT [FK-Entity.EntityContact-IDEntity] FOREIGN KEY ([identity]) REFERENCES [Entity].[Entity]([identity]), 
    CONSTRAINT [FK-Entity.EntityContact-IDContact] FOREIGN KEY ([idcontact]) REFERENCES [Entity].[Contact]([idcontact])
)

GO

CREATE TRIGGER [Entity].[TR-ForInsertUpdate-Entity.EntityContact]
    ON [Entity].[EntityContact]
    FOR INSERT, UPDATE
    AS
    BEGIN
        SET NoCount ON;
        IF ((SELECT COUNT(*) FROM deleted) > 0)
        BEGIN
            UPDATE [Entity].[EntityContact] 
            SET [valid_from] = SYSDATETIME(), 
                [valid_to] = '9999-12-31' 
            WHERE [identitycontact] IN (SELECT [identitycontact] 
                                        FROM inserted);
            
            UPDATE [Entity].[EntityContact_History] 
            SET [valid_to] = SYSDATETIME() 
            WHERE [identitycontact] IN (SELECT [identitycontact] 
                                        FROM deleted) 
                AND [valid_to] = '9999-12-31';

            INSERT INTO [Entity].[EntityContact_History]
            SELECT * 
            FROM inserted;

            UPDATE [Entity].[EntityContact]
            SET [valid_from] = SYSDATETIME(),
                [valid_to] = '9999-12-31'
            WHERE [identitycontact] IN (SELECT [identitycontact]
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

            UPDATE [Entity].[EntityContact]
            SET [valid_from] = SYSDATETIME(),
                [valid_to] = '9999-12-31'
            WHERE [identitycontact] IN (SELECT [identitycontact]
                                        FROM inserted)
                AND [valid_from] IS NULL
                AND [valid_to] IS NULL;
        END
    END
GO

CREATE TRIGGER [Entity].[TR-ForDelete-Entity.EntityContact]
    ON [Entity].[EntityContact]
    FOR DELETE
    AS
    BEGIN
        SET NoCount ON;
        UPDATE [Entity].[EntityContact_History]
        SET [valid_to] = SYSDATETIME()
        WHERE [identitycontact] IN (SELECT [identitycontact] 
                                    FROM deleted)
            AND [valid_to] = '9999-12-31';
    END