asserting
shouldBotAsked: input answer: expectedOutput

	^ self shouldBotAsked: input answerSatisfy: [:actualOutput |
		(expectedOutput isKindOf: String orOf: Text)
			ifTrue: [
				self
					assert: #message equals: actualOutput type;
					assert: expectedOutput asText equals: actualOutput text]
			ifFalse: [
				self assert: expectedOutput equals: actualOutput content]]