tests
testSyntaxError

	self
		shouldBotAsked: '2+'
		answerSatisfy: [:answer | '*SyntaxError*' match: answer text asString].