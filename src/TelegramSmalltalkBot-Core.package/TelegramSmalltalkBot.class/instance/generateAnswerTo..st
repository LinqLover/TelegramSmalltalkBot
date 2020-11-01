update handling
generateAnswerTo: aMessage
	"Generate an answer message to aMessage without sending it to the API.
	This method reimplements command parsing from super's #handleMessage:. The reason is that we want to use the same functionality from #messageEdited: which results in the need of a functional interface."

	| answer |
	aMessage text ifNotNil: [:text |
		self parseCommandIn: aMessage ifFound: [:command |
			answer := self answerCommand: command message: aMessage]].
	
	answer ifNil: [answer := self answerPrint: aMessage].
	
	^ answer beReplyTo: aMessage