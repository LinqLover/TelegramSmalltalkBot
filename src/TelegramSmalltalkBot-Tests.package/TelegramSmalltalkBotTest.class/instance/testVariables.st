tests
testVariables

	self askBot: '/reset'.
	
	self
		shouldBotAsked: 'x := 1. y := x + 1'
		answer: '2'.
	self
		shouldBotAsked: 'y + 1'
		answer: '3'.
	
	self
		shouldBotAsked: '/reset'
		answerSatisfy: [:answer |
			answer text asString asLowercase includesSubstring: 'session'].
	self
		shouldBotAsked: 'y + 1'
		answerSatisfy: [:answer |
			answer text asString includesSubstring: 'MessageNotUnderstood: UndefinedObject']