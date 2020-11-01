records
basicRecordAnswer: aMessage

	answers
		at: aMessage referenceMessageId
		put: aMessage.
	self pinRecord: aMessage to: pinnedAnswers.