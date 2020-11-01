watcher
sendMessage: aMessage

	receivedMessages addLast: aMessage.
	
	aMessage messageId: self nextMessageId.
	aMessage triggerEvent: #sent with: bot.
	^ aMessage