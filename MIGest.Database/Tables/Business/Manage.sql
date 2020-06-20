CREATE TABLE [Business].[Manage]
(
	[idmanage] INT NOT NULL IDENTITY, 
    [identity] INT NOT NULL, 
    [idownership] INT NOT NULL, 
    [comm] NVARCHAR(MAX) NULL, 
    [valid_from] DATETIME2 NULL, 
    [valid_to] DATETIME2 NULL, 
    CONSTRAINT [PK-Business.Manage-IDManage] PRIMARY KEY ([idmanage]),
    CONSTRAINT [UK-Business.Manage-IDE_IDO] UNIQUE ([identity], [idownership]), 
    CONSTRAINT [FK-Business.Manage-IDEntity] FOREIGN KEY ([identity]) REFERENCES [Entity].[Entity]([identity]), 
    CONSTRAINT [FK-Business.Manage-IDOwnership] FOREIGN KEY ([idownership]) REFERENCES [Ownership].[Ownership]([idownership])
)

GO

CREATE TRIGGER [Business].[TR-ForInsertUpdate-Business.Manage]
    ON [Business].[Manage]
    FOR INSERT, UPDATE
    AS
    BEGIN
        SET NoCount ON;
        IF ((SELECT COUNT(*) FROM deleted) > 0)
        BEGIN
            UPDATE [Business].[Manage] 
            SET [valid_from] = SYSDATETIME(), 
                [valid_to] = '9999-12-31' 
            WHERE [idmanage] IN (SELECT [idmanage] 
                                 FROM inserted);
            
            UPDATE [Business].[Manage_History] 
            SET [valid_to] = SYSDATETIME() 
            WHERE [idmanage] IN (SELECT [idmanage]
                                 FROM deleted) 
                AND [valid_to] = '9999-12-31';

            INSERT INTO [Business].[Manage_History]
            SELECT * 
            FROM inserted;

            UPDATE [Business].[Manage]
            SET [valid_from] = SYSDATETIME(),
                [valid_to] = '9999-12-31'
            WHERE [idmanage] IN (SELECT [idmanage]
                               FROM inserted)
                AND [valid_from] IS NULL
                AND [valid_to] IS NULL;
        END
        ELSE
        BEGIN
            UPDATE [Business].[Manage]
            SET [valid_from] = SYSDATETIME(),
                [valid_to] = '9999-12-31'
            WHERE [idmanage] IN (SELECT [idmanage]
                                 FROM inserted);

            INSERT INTO [Business].[Manage_History]
            SELECT *
            FROM inserted;

            UPDATE [Business].[Manage]
            SET [valid_from] = SYSDATETIME(),
                [valid_to] = '9999-12-31'
            WHERE [idmanage] IN (SELECT [idmanage]
                               FROM inserted)
                AND [valid_from] IS NULL
                AND [valid_to] IS NULL;
        END
    END
GO

CREATE TRIGGER [Business].[TF-ForDelete-Business.Manage]
    ON [Business].[Manage]
    FOR DELETE
    AS
    BEGIN
        SET NoCount ON;
        UPDATE [Business].[Manage_History]
        SET [valid_to] = SYSDATETIME()
        WHERE [idmanage] IN (SELECT [idmanage]
                             FROM deleted)
            AND [valid_to] = '9999-12-31';
    END