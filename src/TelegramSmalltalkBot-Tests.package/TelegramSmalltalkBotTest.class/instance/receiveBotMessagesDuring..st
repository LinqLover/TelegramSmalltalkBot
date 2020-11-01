support
receiveBotMessagesDuring: aBlock

	^ [aBlock value.
	receivedMessages copy]
		ensure: [receivedMessages removeAll]