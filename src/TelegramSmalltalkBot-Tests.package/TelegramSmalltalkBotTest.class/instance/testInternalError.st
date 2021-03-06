tests
testInternalError

	bot isDebugging: false.
	self botSession isolationEnabled: false.
	self
		shouldBotAsked: '/inspect (Object newSubclass
			compile: ''printOn: aStream self error: ''''fake error'''''';
			yourself) new'
		answerSatisfy: [:answer | answer text asString asLowercase includesSubstring: 'error'].