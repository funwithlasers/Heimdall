CREATE TABLE [dbo].[TodoItem]
(
	[TodoItemId] INT NOT NULL IDENTITY PRIMARY KEY, 
    [DueOn] DATE NOT NULL, 
    [Title] NCHAR(50) NOT NULL, 
    [Status] NCHAR(50) NOT NULL,
    [UserId] INT,
    CONSTRAINT [FK_User_TodoItem] FOREIGN KEY ([UserId])
    REFERENCES [User]([UserId])
)