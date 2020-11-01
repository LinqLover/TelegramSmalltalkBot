records
record: anObject fromAnswer: aMessage bot: aBot

	self basicRecordAnswer: aMessage.
	self basicRecordResult: anObject forMessage: aMessage.
	
	answers
		select: [:answer | answer referenceMessage replyToMessage
			ifNil: [false]
			ifNotNil: [:previousAnswer | previousAnswer messageId = aMessage messageId]]
		thenDo: [:answer | aBot handleEditedMessage: answer referenceMessage].