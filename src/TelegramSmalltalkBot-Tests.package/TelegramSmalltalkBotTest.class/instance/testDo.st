tests
testDo

	self
		shouldBotAsked: '/do ''foo'''
		answer: '''foo'''.
	self
		shouldBotAsked: '/do Morph new imageForm'
		answer: Morph new imageForm printString.