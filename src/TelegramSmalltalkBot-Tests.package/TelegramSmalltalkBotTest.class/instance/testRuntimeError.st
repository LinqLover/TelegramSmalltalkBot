tests
testRuntimeError

	self
		shouldBotAsked: 'self error: ''fake runtime error'''
		answerSatisfy: [:answer |
			self assert: [answer text asString includesSubstring: 'fake runtime error'].
			self assert: [answer text runs anySatisfy: #notEmpty]].