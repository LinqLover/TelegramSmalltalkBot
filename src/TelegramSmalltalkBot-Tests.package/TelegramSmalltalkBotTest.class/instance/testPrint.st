tests
testPrint

	self
		shouldBotAsked: '/print ''foo''' 
		answer: 'foo'.
	self
		shouldBotAsked: '/print Morph new imageForm'
		answerSatisfy: [:answer | answer form isForm].