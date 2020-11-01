evaluation
notify: aString at: location in: source

	| error |
	error := (SyntaxErrorNotification 
		inClass: nil
		withCode: source contents
		doitFlag: true
		errorMessage: aString
		location: location) signal.
	error tryNewSourceIfAvailable.