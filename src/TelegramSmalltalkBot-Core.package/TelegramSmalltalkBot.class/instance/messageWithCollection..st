message creation
messageWithCollection: aCollection

	^ self
		messageWithItems: (aCollection collect: #printString)
		caption: ('a {1} with {2} elements:' format: {
			aCollection class.
			aCollection size })