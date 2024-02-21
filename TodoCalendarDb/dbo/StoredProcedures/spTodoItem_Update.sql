CREATE PROCEDURE [dbo].[spTodoItem_Update]
	@TodoItemId int,
    @DueOn DATE, 
    @Title NCHAR(50), 
    @Status NCHAR(50),
    @UserId INT
AS
BEGIN
	UPDATE dbo.[TodoItem] 
	SET [DueOn] = @DueOn,
    [Title] = @Title,
    [Status] = @Status,
    [UserId] = @UserId
	WHERE TodoItemId = @TodoItemId
END
