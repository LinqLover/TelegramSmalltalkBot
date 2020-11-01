tests
testForm

	self
		shouldBotAsked: 'Morph new imageForm'
		answerSatisfy: [:answer |
			self assert: answer form isForm.
			self assert: Morph new imageForm bits equals: answer form bits].