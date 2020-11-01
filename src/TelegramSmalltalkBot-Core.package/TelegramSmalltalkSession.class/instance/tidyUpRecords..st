records
tidyUpRecords: pinnedRecords
	
	| overrun |
	overrun := pinnedRecords size - (self maximumRecordSize ifNil: [^ self]).
	overrun <= 0 ifTrue: [^ self].
	
	pinnedRecords removeFirst: overrun.