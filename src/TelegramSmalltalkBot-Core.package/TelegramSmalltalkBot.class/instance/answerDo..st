commands
answerDo: aMessage
	"Create a response to the message with a /do command, i.e. evaluate it and answer the #printString of the result."

	^ self processMessage: aMessage andDo: [:result |
		self messageWithUserText: result printString]