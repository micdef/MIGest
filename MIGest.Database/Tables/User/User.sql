CREATE TABLE [User].[User]
(
	[iduser] INT NOT NULL IDENTITY, 
    [username] NVARCHAR(50) NOT NULL, 
    [password] VARBINARY(64) NOT NULL, 
    [firstname] NVARCHAR(50) NOT NULL, 
    [lastname] NVARCHAR(50) NOT NULL, 
    [email] NVARCHAR(384) NOT NULL, 
    [flag_active] BIT NOT NULL CONSTRAINT [DF-User.User-Flag_Active] DEFAULT (1), 
    [flag_delete] BIT NOT NULL CONSTRAINT [DF-User.User-Flag_Delete] DEFAULT (0), 
    [flag_mustchangepwd] BIT NOT NULL CONSTRAINT [DF-User.User-Flag_MustChangePwd] DEFAULT (1), 
    [datein] DATETIME2 NOT NULL CONSTRAINT [DF-User.User-DateIn] DEFAULT (sysdatetime()), 
    [comm] NVARCHAR(MAX) NULL, 
    CONSTRAINT [PK-User.User-IDUser] PRIMARY KEY ([iduser]),
    CONSTRAINT [UK-User.User-Username] UNIQUE ([username])
)

GO

CREATE TRIGGER [User].[TR-InsteadOfDelete-User.User]
    ON [User].[User]
    INSTEAD OF DELETE
    AS
    BEGIN
        SET NoCount ON;
        UPDATE [User].[User] 
        SET [flag_delete] = 1 
        WHERE [iduser] IN (SELECT [iduser] 
                           FROM deleted);
    END