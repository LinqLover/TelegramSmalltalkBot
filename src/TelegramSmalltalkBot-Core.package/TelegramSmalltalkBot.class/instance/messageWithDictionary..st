message creation
messageWithDictionary: aDictionary

	^ self
		messageWithItems: (aDictionary associations collect: #asString)
		caption: ('a {1} with {2} elements:' format: {
			aDictionary class.
			aDictionary size })