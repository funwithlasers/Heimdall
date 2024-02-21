IF NOT EXISTS (
		SELECT 1
		FROM dbo.[User]
		)
BEGIN
	INSERT INTO dbo.[User] (
		[FirstName]
		,[LastName]
		)
	VALUES (
		'Matt'
		,'Larson'
		)
END

IF NOT EXISTS (
		SELECT 1
		FROM dbo.[TodoItem]
		)
BEGIN
	INSERT INTO dbo.[TodoItem] (
		[DueOn]
		,[Title]
		,[Status]
		,[UserId]
		)
	VALUES (
		CAST(GETDATE() as Date)
		,'Migrate Database'
		,'Completed'
		,1
		)
END