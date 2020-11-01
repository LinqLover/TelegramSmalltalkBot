records
scheduleRecord: anObject fromAnswer: aBlock

	| answer scheduledBlock |
	answer := aBlock value.
	answer ifNil: [^ answer].
	
	scheduledBlock := [:bot | self record: anObject fromAnswer: answer bot: bot].
	answer
		when: #sent
		send: #value:
		to: scheduledBlock.
	pinnedClosures at: answer put: scheduledBlock.
	
	^ answer