CREATE TABLE [User].[UserRight]
(
	[iduserright] INT NOT NULL IDENTITY, 
    [iduser] INT NOT NULL, 
    [idright] INT NOT NULL, 
    [flag_read] BIT NOT NULL CONSTRAINT [DF-User.UserRight-Flag_Read] DEFAULT (1), 
    [flag_write] BIT NOT NULL CONSTRAINT [DF-User.UserRight-Flag_Write] DEFAULT (0), 
    [comm] NVARCHAR(MAX) NULL, 
    [valid_from] DATETIME2 NULL, 
    [valid_to] DATETIME2 NULL, 
    CONSTRAINT [PK-User.UserRight-IDUserRight] PRIMARY KEY ([iduserright]),
    CONSTRAINT [UK-User.UserRight-IDU_IDR] UNIQUE ([iduser], [idright]), 
    CONSTRAINT [FK-User.UserRight-IDUser] FOREIGN KEY ([iduser]) REFERENCES [User].[User]([iduser]),
    CONSTRAINT [FK-User.UserRight-IDRight] FOREIGN KEY ([idright]) REFERENCES [User].[Right]([idright])
)

GO

CREATE TRIGGER [User].[TR-ForInsertUpdate-User.UserRight]
    ON [User].[UserRight]
    FOR INSERT, UPDATE
    AS
    BEGIN
        SET NoCount ON;
        IF ((SELECT COUNT(*) FROM deleted) > 0)
        BEGIN
            UPDATE [User].[UserRight] 
            SET [valid_from] = SYSDATETIME(), 
                [valid_to] = '9999-12-31'
            WHERE [iduserright] IN (SELECT [iduserright] 
                                    FROM inserted);
            
            UPDATE [User].[UserRight_History] 
            SET [valid_to] = SYSDATETIME() 
            WHERE [iduserright] IN (SELECT [iduserright] 
                                    FROM deleted) 
                AND [valid_to] = '9999-12-31';

            INSERT INTO [User].[UserRight_History]
            SELECT * 
            FROM inserted;

            UPDATE [User].[UserRight_History]
            SET [valid_from] = SYSDATETIME(),
                [valid_to] = '9999-12-31'
            WHERE [iduserright] IN (SELECT [iduserright]
                                    FROM inserted)
                AND [valid_from] IS NULL
                AND [valid_to] IS NULL;
        END
        ELSE
        BEGIN
            UPDATE [User].[UserRight] 
            SET [valid_from] = SYSDATETIME(), 
                [valid_to] = '9999-12-31' 
            WHERE [iduserright] IN (SELECT [iduserright] 
                                    FROM inserted);
            
            INSERT INTO [User].[UserRight_History]
            SELECT * 
            FROM inserted;

            UPDATE [User].[UserRight_History]
            SET [valid_from] = SYSDATETIME(),
                [valid_to] = '9999-12-31'
            WHERE [iduserright] IN (SELECT [iduserright]
                                    FROM inserted)
                AND [valid_from] IS NULL
                AND [valid_to] IS NULL;
        END
    END
GO

CREATE TRIGGER [User].[TR-ForDelete-User.UserRight]
    ON [User].[UserRight]
    FOR DELETE
    AS
    BEGIN
        UPDATE [User].[UserRight_History]
        SET [valid_to] = SYSDATETIME()
        WHERE [iduserright] IN (SELECT [iduserright]
                                FROM deleted)
            AND [valid_to] = '9999-12-31';
    END