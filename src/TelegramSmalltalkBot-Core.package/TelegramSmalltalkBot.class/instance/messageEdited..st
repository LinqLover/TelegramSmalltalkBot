update handling
messageEdited: aMessage

	| newMessage originalAnswer |
	^ self
		logErrorsDuring: [
			originalAnswer := (self sessionFor: aMessage chat)
				recordedAnswerTo: aMessage
				ifAbsent: [^ self].
			newMessage := self generateAnswerTo: aMessage.
	
			self editMessage: originalAnswer changeTo: newMessage]
		replyTo: aMessage