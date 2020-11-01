update handling
handleCommand: aCommand message: aMessage

	^ aCommand key
		caseOf: {
			[#reset] -> [self doReset: aMessage] }
		otherwise: [super handleCommand: aCommand message: aMessage]