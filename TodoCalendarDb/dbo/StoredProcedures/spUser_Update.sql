CREATE PROCEDURE [dbo].[spUser_Update] 
	@UserId INT
	, @Email NVARCHAR(50)
	, @FirstName NVARCHAR(50)
	, @LastName NVARCHAR(50)
AS
BEGIN
	IF NOT EXISTS(SELECT * FROM [dbo].[User] WHERE [Email] = @Email)
	BEGIN
		UPDATE [dbo].[User]
		SET [Email] = @Email
			, [FirstName] = @FirstName
			, [LastName] = @LastName
		WHERE [UserId] = @UserId
	END
	ELSE
    BEGIN
        RAISERROR ('User with this email already exists', 16, 1);
        RETURN;
    END
END