CREATE TABLE [Metadata].[Country]
(
	[idcountry] INT NOT NULL IDENTITY, 
    [iso] NVARCHAR(5) NOT NULL, 
    [label] NVARCHAR(50) NOT NULL, 
    [datein] DATETIME2 NOT NULL CONSTRAINT [DF-Metadata.Country-DateIn] DEFAULT (sysdatetime()), 
    [comm] NVARCHAR(MAX) NULL, 
    CONSTRAINT [PK-Metadata.Country-IDCountry] PRIMARY KEY ([idcountry]),
    CONSTRAINT [UK-Metadata.Country-ISO] UNIQUE ([iso])
)
