CREATE PROCEDURE [dbo].[spTodoItem_Insert] 
	@DueDate DATETIME
	, @Title NVARCHAR(50)
	, @Status NVARCHAR(50)
	, @UserId INT
AS
BEGIN
	INSERT INTO [dbo].[TodoItem] (
		[DueDate]
		, [Title]
		, [Status]
		, [UserId]
		)
	VALUES (
		@DueDate
		, @Title
		, @Status
		, @UserId
		);
END