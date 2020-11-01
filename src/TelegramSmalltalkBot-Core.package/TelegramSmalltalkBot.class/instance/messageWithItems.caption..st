message creation
messageWithItems: elements caption: aStringOrText

	^ self messageWithUserText: (Text streamContents: [:stream |
		aStringOrText ifNotNil: [stream
			nextPutAll: aStringOrText;
			cr].
		elements
			do: [:each | stream
				nextPutAll: '• ';
				nextPutAll: each tbWithoutLineEndings]
			separatedBy: [stream cr]])