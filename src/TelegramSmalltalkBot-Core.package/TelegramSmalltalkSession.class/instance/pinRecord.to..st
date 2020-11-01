records
pinRecord: anObject to: pinnedRecords

	pinnedRecords addLast: anObject.
	
	"Could be theoretically deferred"
	self tidyUpRecords: pinnedRecords.