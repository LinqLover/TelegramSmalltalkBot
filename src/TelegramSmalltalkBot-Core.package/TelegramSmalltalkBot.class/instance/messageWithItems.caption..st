message creation
messageWithItems: elementStrings caption: aStringOrText

	^ self messageWithUserText: (Text streamContents: [:stream |
		aStringOrText ifNotNil: [stream
			nextPutAll: aStringOrText;
			cr].
		elementStrings
			do: [:each | stream
				nextPutAll: '• ';
				nextPutAll: each tbWithoutLineEndings]
			separatedBy: [stream cr]])