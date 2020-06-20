CREATE TABLE [Metadata].[InformationType]
(
	[idinformationtype] INT NOT NULL IDENTITY, 
    [idobjecttype] INT NOT NULL, 
    [label] NVARCHAR(50) NOT NULL, 
    [flag_mandatory] BIT NOT NULL CONSTRAINT [DF-Metadate.InformationType-Flag_Mandatory] DEFAULT (0),
    [unity] NVARCHAR(25) NULL, 
    [descr] NVARCHAR(255) NULL, 
    [datein] DATETIME2 NOT NULL CONSTRAINT [DF-Metadata.InformationType] DEFAULT (sysdatetime()), 
    [comm] NVARCHAR(MAX) NULL, 
    CONSTRAINT [PK-Metadata.InformationType-IDInformationType] PRIMARY KEY ([idinformationtype]),
    CONSTRAINT [UK-Metadata.InformationType-IDO_Label] UNIQUE ([idobjecttype], [label]), 
    CONSTRAINT [FK-Metadata.InformationType-IDObjectType] FOREIGN KEY ([idobjecttype]) REFERENCES [Metadata].[ObjectType]([idobjecttype])
)
