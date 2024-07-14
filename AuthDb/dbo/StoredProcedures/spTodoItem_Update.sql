CREATE PROCEDURE [dbo].[spTodoItem_Update]
	@TodoItemId INT
	, @DueDate DATETIME
	, @Title NVARCHAR(50)
	, @Status NVARCHAR(50)
	, @UserId INT
AS
BEGIN
	UPDATE [dbo].[TodoItem]
	SET [DueDate] = @DueDate
		, [Title] = @Title
		, [Status] = @Status
		, [UserId] = @UserId
	WHERE [TodoItemId] = @TodoItemId
END