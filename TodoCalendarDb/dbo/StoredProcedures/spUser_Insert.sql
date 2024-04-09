CREATE PROCEDURE [dbo].[spUser_Insert]
    @Email VARCHAR(255),
    @FirstName VARCHAR(50),
    @LastName VARCHAR(50),
    @Password VARCHAR(MAX),
    @Timezone VARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON;

    IF NOT EXISTS(SELECT * FROM [dbo].[Users] WHERE [dbo].[Email] = @Email)
    BEGIN
        INSERT INTO [dbo].[Users] (@Email, @FirstName, @LastName, @Password, @Timezone)
        VALUES (@Email, @FirstName, @LastName, @Password, @Timezone);
    END
    ELSE
    BEGIN
        RAISERROR ('User with this email already exists', 16, 1);
        RETURN;
    END
END;
