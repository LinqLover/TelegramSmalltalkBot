binding
bindingOf: aString

	self mustDeclareVariables ifTrue: [^ super bindingOf: aString].
	
	(bindings includesKey: aString) ifFalse: [
		bindings at: aString put: nil].
	^ bindings associationAt: aString