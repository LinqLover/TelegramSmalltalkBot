update handling
answerCommand: aCommand message: aMessage

	^ aCommand key
		caseOf: {
			[#do] -> [self answerDo: aMessage].
			[#inspect] -> [self answerInspect: aMessage].
			[#print] -> [self answerPrint: aMessage] }
		otherwise: [self messageWithErrorText: 'Command not understood']