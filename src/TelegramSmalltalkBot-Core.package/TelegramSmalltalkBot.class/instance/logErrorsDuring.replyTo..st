private
logErrorsDuring: aBlock replyTo: aMessage

	^ aBlock on: Error, Warning, Halt do: [:error |
		self
			sendText: (('{1}:\{2}' withCRs asText format: {
				'Sorry, I did something wrong when processing your message' asText beAllBold.
				error description })
					addAttribute: TextEmphasis italic;
					yourself)
			toChat: aMessage chat
			replyTo: aMessage.
		
		self isDebugging ifTrue: [error pass]]