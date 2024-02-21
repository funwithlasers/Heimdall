CREATE PROCEDURE [dbo].[spUser_Update]
	@UserId int,
	@FirstName nvarchar(50),
	@LastName nvarchar(50)
AS
BEGIN
	UPDATE dbo.[User] 
	SET FirstName = @FirstName, LastName = @LastName
	WHERE UserId = @UserId
END
