tests
testEditMessage

	| message answer edits |
	message := self makeMessageFrom: '1 + 1'.
	answer := self
		shouldBotAsked: message
		answer: '2'.
	
	message text: '1 + 2'.
	edits := self receiveEditedBotMessagesDuring: [
		bot handleEditedMessage: message].
	
	self assert: edits size = 1.
	self assert: '3' equals: (edits at: answer messageId) asString.