watcher
editMessage: aMessage text: aStringOrText

	editedMessages at: aMessage messageId put: aStringOrText.
	
	aMessage text: aStringOrText.
	^ aMessage