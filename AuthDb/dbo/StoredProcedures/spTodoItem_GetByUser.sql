CREATE PROCEDURE [dbo].[spTodoItem_GetByUser] 
	@UserId INT
AS
BEGIN
	SELECT [TodoItemId]
		, [DueDate]
		, [Title]
		, [Status]
		, [UserId]
	FROM [dbo].[TodoItem]
	WHERE [UserId] = @UserId;
END