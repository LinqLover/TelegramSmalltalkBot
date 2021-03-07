asserting
shouldBotAsked: input answersSatisfy: outputBlock

	| actualOutputs |
	actualOutputs := self askBot: input.
	
	self deny: [(outputBlock value: actualOutputs) == false].
	^ actualOutputs