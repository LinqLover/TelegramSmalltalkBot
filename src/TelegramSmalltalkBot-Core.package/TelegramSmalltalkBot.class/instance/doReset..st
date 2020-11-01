commands
doReset: aMessage

	self removeSession: aMessage chat ifAbsent: [^ self].
	
	self sendText: 'Session was reset.' toChat: aMessage chat.