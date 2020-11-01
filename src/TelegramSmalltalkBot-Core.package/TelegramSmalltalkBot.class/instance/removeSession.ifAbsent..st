accessing - sessions
removeSession: aChat ifAbsent: aBlock

	| session |
	session := sessions
		removeKey: aChat id
		ifAbsent: [^ aBlock value].
	session reset. "This would be redundant but helps us fulfill possible duties of deletion before GC rules."