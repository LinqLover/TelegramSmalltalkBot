command processing
processMessage: aMessage andDo: aBlock

	^ self processMessage: aMessage andDo: aBlock ifError: [:error |
		self messageWithExceptionText: error description asString]