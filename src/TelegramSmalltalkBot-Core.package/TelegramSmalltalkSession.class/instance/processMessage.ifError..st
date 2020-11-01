message processing
processMessage: aMessage ifError: aBlock

	^ self
		evaluate: aMessage mainText
		for: (self receiverFor: aMessage replyToMessage)
		ifError: aBlock