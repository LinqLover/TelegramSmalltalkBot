tests
testHelp

	self
		shouldBotAsked: '/help'
		answerSatisfy: [:answer |
			#('/print' '/do' '/inspect') allSatisfy: [:keyword |
				answer text asString asLowercase includesSubstring: keyword]].
	
	self
		shouldBotAsked: '/help do'
		answerSatisfy: [:answer |
			answer text asString asLowercase includesSubstring: 'string'].