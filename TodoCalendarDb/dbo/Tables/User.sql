﻿CREATE TABLE [dbo].[User]
(
	[UserId] INT NOT NULL IDENTITY PRIMARY KEY, 
    [FirstName] NCHAR(50) NOT NULL, 
    [LastName] NCHAR(50) NOT NULL
)
