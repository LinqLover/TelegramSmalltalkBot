evaluation
notify: aString at: location in: source

	| error |
	error := (SyntaxErrorNotification
		cue: (CompilationCue source: source contents)
		doitFlag: true
		errorMessage: aString
		location: location) signal.
	error tryNewSourceIfAvailable.