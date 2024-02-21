CREATE PROCEDURE [dbo].[spUser_Update] 
	@UserId INT
	, @FirstName NVARCHAR(50)
	, @LastName NVARCHAR(50)
AS
BEGIN
	UPDATE [dbo].[User]
	SET [FirstName] = @FirstName
		, [LastName] = @LastName
	WHERE [UserId] = @UserId
END