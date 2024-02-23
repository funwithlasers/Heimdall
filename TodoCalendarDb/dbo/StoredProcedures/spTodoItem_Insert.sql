CREATE PROCEDURE [dbo].[spTodoItem_Insert] 
	@DueBy DATETIME
	, @Title NVARCHAR(50)
	, @Status NVARCHAR(50)
	, @UserId INT
AS
BEGIN
	INSERT INTO [dbo].[TodoItem] (
		[DueBy]
		, [Title]
		, [Status]
		, [UserId]
		)
	VALUES (
		@DueBy
		, @Title
		, @Status
		, @UserId
		);
END