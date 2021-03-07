tests
testStart

	self
		shouldBotAsked: '/start'
		answersSatisfy: [:answers |
			#('welcome' 'github') allSatisfy: [:keyword |
				answers anySatisfy: [:answer |
					answer text asString asLowercase includesSubstring: keyword]]].