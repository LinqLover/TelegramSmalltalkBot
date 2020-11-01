tests
testSound

	self
		shouldBotAsked: 'PluckedSound default'
		answerSatisfy: [:answer |
			self assert: (answer sound isKindOf: PluckedSound).
			self
				assert: PluckedSound default durationInMilliseconds
				equals: answer sound durationInMilliseconds].