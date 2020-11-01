tests
testDialog

	| question firstAnswer |
	question := self makeMessageFrom: '6 * 7'.
	self
		shouldBotAsked: question
		answerSatisfy: [:answer |
			self assert: question identical: answer referenceMessage.
			firstAnswer := answer.
			answer text = (6 * 7) asString].
	
	self
		shouldBotAsked: ((self makeMessageFrom: 'self - 20') replyToMessage: firstAnswer)
		answer: (6 * 7 - 20) asString.