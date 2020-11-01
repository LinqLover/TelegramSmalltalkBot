records
recordedAnswerTo: aMessage ifAbsent: aBlock

	^ answers
		at: aMessage messageId
		ifAbsent: aBlock