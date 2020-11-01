message creation
messageWithUserText: aStringOrText

	aStringOrText ifEmpty: [
		^ self messageWithText: ('an empty {1}({2})' format: {
			thisContext objectClass: aStringOrText.
			thisContext objectIdentityHash: aStringOrText})].
	
	^ self messageWithText: aStringOrText truncated: true