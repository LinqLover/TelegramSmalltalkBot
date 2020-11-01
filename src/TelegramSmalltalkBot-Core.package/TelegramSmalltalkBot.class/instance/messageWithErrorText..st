private
messageWithErrorText: aString

	^ self messageWithUserText: (self errorText: aString)