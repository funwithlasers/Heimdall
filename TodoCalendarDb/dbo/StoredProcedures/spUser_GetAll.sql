CREATE PROCEDURE [dbo].[spUser_GetAll]
AS
BEGIN
	SELECT [UserId]
		, [Email]
		, [FirstName]
		, [LastName]
	FROM [dbo].[User]
END