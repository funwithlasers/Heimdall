CREATE PROCEDURE [dbo].[spTodoItem_Update]
	@TodoItemId INT
	, @DueOn DATE
	, @Title NVARCHAR(50)
	, @Status NVARCHAR(50)
	, @UserId INT
AS
BEGIN
	UPDATE [dbo].[TodoItem]
	SET [DueOn] = @DueOn
		, [Title] = @Title
		, [Status] = @Status
		, [UserId] = @UserId
	WHERE [TodoItemId] = @TodoItemId
END