CREATE PROCEDURE [dbo].[spTodoItem_Delete]
	@TodoItemId int
AS
BEGIN
	DELETE
	FROM dbo.[TodoItem]
	WHERE TodoItemId = @TodoItemId;
END