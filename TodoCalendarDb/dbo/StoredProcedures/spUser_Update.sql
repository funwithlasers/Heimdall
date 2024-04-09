CREATE PROCEDURE [dbo].[spUser_Update] 
	@UserId INT
	, @Email NVARCHAR(255)
	, @FirstName NVARCHAR(50)
	, @LastName NVARCHAR(50)
	, @Password NVARCHAR(MAX)
AS
BEGIN
	UPDATE [dbo].[User]
	SET [Email] = @Email
		, [FirstName] = @FirstName
		, [LastName] = @LastName
		, [Password] = @Password
	WHERE [UserId] = @UserId
END