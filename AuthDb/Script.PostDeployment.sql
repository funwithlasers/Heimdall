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