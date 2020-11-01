tests
testSimple

	| number |
	number := self someNumber.
	self
		shouldBotAsked: ('{1} + 1' format: {number})
		answer: (number + 1) asString.