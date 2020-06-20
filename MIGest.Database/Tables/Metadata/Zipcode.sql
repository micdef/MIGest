CREATE TABLE [Metadata].[Zipcode]
(
	[dizipcode] INT NOT NULL IDENTITY, 
    [idcountry] INT NOT NULL, 
    [zipcode] NVARCHAR(25) NOT NULL, 
    [city] NVARCHAR(255) NOT NULL, 
    [datein] DATETIME2 NOT NULL CONSTRAINT [DF-Metadata.Zipcode-DateIn] DEFAULT (sysdatetime()), 
    [comm] NVARCHAR(MAX) NULL, 
    CONSTRAINT [PK-Metadata.Zipcode-IDZipcode] PRIMARY KEY ([dizipcode]),
    CONSTRAINT [UK-Metadata.Zipcode-IDC_ZC_City] UNIQUE ([idcountry], [zipcode], [city]), 
    CONSTRAINT [FK-Metadata.Zipcode-IDCountry] FOREIGN KEY ([idcountry]) REFERENCES [Metadata].[Country]([idcountry])
)
