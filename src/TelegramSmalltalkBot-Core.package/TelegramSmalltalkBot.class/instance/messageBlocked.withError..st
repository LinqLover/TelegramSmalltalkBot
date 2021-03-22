update handling
messageBlocked: aMessage withError: anError

	self removeSession: aMessage chat ifAbsent: [].