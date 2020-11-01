records
basicRecordResult: anObject forMessage: aMessage

	results
		at: aMessage messageId
		put: anObject.
	self pinRecord: anObject to: pinnedResults.