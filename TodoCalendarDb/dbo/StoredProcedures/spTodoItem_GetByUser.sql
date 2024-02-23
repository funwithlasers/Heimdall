CREATE PROCEDURE [dbo].[spTodoItem_GetByUser] 
	@UserId INT
AS
BEGIN
	SELECT [TodoItemId]
		, [DueBy]
		, [Title]
		, [Status]
		, [UserId]
	FROM [dbo].[TodoItem]
	WHERE [UserId] = @UserId;
END