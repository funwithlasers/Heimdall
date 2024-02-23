CREATE PROCEDURE [dbo].[spTodoItem_Update]
	@TodoItemId INT
	, @DueBy DATETIME
	, @Title NVARCHAR(50)
	, @Status NVARCHAR(50)
	, @UserId INT
AS
BEGIN
	UPDATE [dbo].[TodoItem]
	SET [DueBy] = @DueBy
		, [Title] = @Title
		, [Status] = @Status
		, [UserId] = @UserId
	WHERE [TodoItemId] = @TodoItemId
END