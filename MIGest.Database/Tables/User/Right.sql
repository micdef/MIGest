CREATE TABLE [User].[Right]
(
	[idright] INT NOT NULL IDENTITY, 
    [label] NVARCHAR(50) NOT NULL, 
    [descr] NVARCHAR(255) NULL, 
    [flag_active] BIT NOT NULL CONSTRAINT [DF-User.Right-Flag_Active] DEFAULT (1), 
    [flag_delete] BIT NOT NULL CONSTRAINT [DF-User.Right-Flag_Delete] DEFAULT (0), 
    [datein] DATETIME2 NOT NULL CONSTRAINT [DF-User.Right-DateIn] DEFAULT (sysdatetime()), 
    [comm] NVARCHAR(MAX) NULL, 
    CONSTRAINT [PK-User.Right-IDRight] PRIMARY KEY ([idright]),
    CONSTRAINT [UK-User.Right-Label] UNIQUE ([label])
)

GO

CREATE TRIGGER [User].[TR-InsteadOfDelete-User.Right]
    ON [User].[Right]
    INSTEAD OF DELETE
    AS
    BEGIN
        SET NoCount ON;
        UPDATE [User].[Right] 
        SET [flag_delete] = 1 
        WHERE [idright] IN (SELECT [idright] 
                            FROM deleted);
    END