accessing - sessions
sessionFor: aChat

	^ sessions
		at: aChat id
		ifAbsentPut: [TelegramSmalltalkSession new]