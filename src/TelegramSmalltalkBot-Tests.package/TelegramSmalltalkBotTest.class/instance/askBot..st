support
askBot: aMessage

	(aMessage respondsTo: #messageId) ifFalse: [
		^ self askBot: (self makeMessageFrom: aMessage)].
	
	^ self receiveBotMessagesDuring: [
		bot handleMessage: aMessage]