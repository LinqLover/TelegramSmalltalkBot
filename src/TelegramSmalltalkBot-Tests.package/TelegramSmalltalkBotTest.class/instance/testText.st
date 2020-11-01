tests
testText

	self
		shouldBotAsked: '''<b>Squeak</b>'' asTextFromHtml'
		answerSatisfy: [:answer |
			self
				assert: '<b>Squeak</b>'
				equals: answer text printHtmlString].