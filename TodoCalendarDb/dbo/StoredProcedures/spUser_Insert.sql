CREATE PROCEDURE [dbo].[spUser_Insert]
    @Email VARCHAR(255),
    @FirstName VARCHAR(50),
    @LastName VARCHAR(50),
    @Password VARCHAR(MAX)
AS
BEGIN
    SET NOCOUNT ON;

    IF NOT EXISTS(SELECT * FROM [dbo].[User] WHERE [Email] = @Email)
    BEGIN
        INSERT INTO [dbo].[User] ([Email], [FirstName], [LastName], [Password])
        VALUES (@Email, @FirstName, @LastName, @Password);
    END
    ELSE
    BEGIN
        RAISERROR ('User with this email already exists', 16, 1);
        RETURN;
    END
END;
