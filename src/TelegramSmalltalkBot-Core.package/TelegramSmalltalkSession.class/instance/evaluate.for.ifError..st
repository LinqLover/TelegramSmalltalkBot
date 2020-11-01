evaluation
evaluate: aString for: receiver ifError: aBlock

	^ self
		doSafely: [Compiler new
			evaluate: aString
			in: nil
			to: receiver
			environment: Smalltalk globals
			notifying: self
			ifFail: [aBlock value]
			logged: false]
		ifError: aBlock