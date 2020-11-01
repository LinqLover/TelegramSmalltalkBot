support
receiveEditedBotMessagesDuring: aBlock

	^ [aBlock value.
	editedMessages copy]
		ensure: [editedMessages removeAll]