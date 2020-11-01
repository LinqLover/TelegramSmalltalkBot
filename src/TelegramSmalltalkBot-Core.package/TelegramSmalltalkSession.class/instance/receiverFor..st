accessing
receiverFor: aMessage

	aMessage ifNil: [^ nil].
	^ results
		at: aMessage messageId
		ifAbsent: [nil]