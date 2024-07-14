IF NOT EXISTS (
		SELECT 1
		FROM [dbo].[User]
		)
BEGIN
	INSERT INTO [dbo].[User] (
		[Email]
		, [FirstName]
		, [LastName]
		, [Password]
		)
	VALUES (
		'fakeemail@real.com',
		'Matt'
		, 'Larson'
		, 'persword'
		)
END



IF NOT EXISTS (
		SELECT 1
		FROM [dbo].[TodoItem]
		)
BEGIN
	INSERT INTO [dbo].[TodoItem] (
		[DueDate]
		, [Title]
		, [Status]
		, [UserId]
		)
	VALUES (
		GETUTCDATE()
		, 'Migrate Database'
		, 'Completed'
		, 1
		)
END
