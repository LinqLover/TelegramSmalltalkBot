asserting
shouldBotAsked: input answerSatisfy: outputBlock

	| actualOutput actualOutputs |
	actualOutputs := self askBot: input.
	
	self assert: actualOutputs size = 1.
	actualOutput := actualOutputs anyOne.
	
	self deny: [(outputBlock value: actualOutput) == false].
	^ actualOutput