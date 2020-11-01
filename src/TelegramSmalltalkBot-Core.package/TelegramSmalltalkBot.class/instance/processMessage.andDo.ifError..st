command processing
processMessage: aMessage andDo: resultBlock ifError: errorBlock

	| session result |
	session := self sessionFor: aMessage chat.
	result := session
		processMessage: aMessage
		ifError: [:error | ^ session scheduleRecord: error fromAnswer: [errorBlock cull: error]].
	^ session scheduleRecord: result fromAnswer: [resultBlock value: result]