CREATE PROCEDURE [dbo].[spUser_GetAll]
AS
BEGIN
	SELECT [UserId]
		, [FirstName]
		, [LastName]
	FROM [dbo].[User]
END