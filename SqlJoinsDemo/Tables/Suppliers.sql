/*CREATE TABLE [dbo].[Suppliers]
(
	[id] INT PRIMARY KEY IDENTITY(1,1)
	, [name] NVARCHAR(25) UNIQUE NOT NULL
	, [city_id] INT REFERENCES [dbo].[Cities]([id])
)*/

CREATE TABLE [dbo].[Suppliers]
(
	[id] INT PRIMARY KEY IDENTITY(1,1)
	, [name] NVARCHAR(25) UNIQUE NOT NULL
	, [city_id] INT NULL
)