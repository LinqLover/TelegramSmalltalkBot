commands
answerPrint: aMessage
	"Respond to the message with a /print command, i.e. evaluate it and answer an object-specific representation of the result."

	^ self processMessage: aMessage andDo: [:result |
		self messageWith: result]