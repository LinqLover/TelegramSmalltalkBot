update handling
messageReceived: aMessage

	^ self
		logErrorsDuring: [
			| answer |
			answer := self generateAnswerTo: aMessage.
			self sendMessage: answer]
		replyTo: aMessage