update handling
handleCommand: aCommand message: aMessage

	^ aCommand key
		caseOf: {
			[#start] -> [self doStart: aMessage].
			[#reset] -> [self doReset: aMessage].
			[#help] -> [self doHelp: aMessage]. }
		otherwise: [super handleCommand: aCommand message: aMessage]