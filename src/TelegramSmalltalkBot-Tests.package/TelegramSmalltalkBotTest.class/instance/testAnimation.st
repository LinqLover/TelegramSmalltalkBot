tests
testAnimation

	self
		shouldBotAsked: 'AnimatedImageMorph new fromImages: (
			#(red green blue) collect: [:color |
				(Morph new color: (Color fromString: color)) imageForm])'
		answerSatisfy: [:answer |
			| anim |
			anim := AnimatedImageMorph fromStream: answer bytes readStream.
			self assert: #(red green blue) size equals: anim images size].