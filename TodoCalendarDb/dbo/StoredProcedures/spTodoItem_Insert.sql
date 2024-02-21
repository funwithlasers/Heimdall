CREATE PROCEDURE [dbo].[spTodoItem_Insert] 
	@DueOn DATE
	, @Title NVARCHAR(50)
	, @Status NVARCHAR(50)
	, @UserId INT
AS
BEGIN
	INSERT INTO [dbo].[TodoItem] (
		[DueOn]
		, [Title]
		, [Status]
		, [UserId]
		)
	VALUES (
		@DueOn
		, @Title
		, @Status
		, @UserId
		);
END