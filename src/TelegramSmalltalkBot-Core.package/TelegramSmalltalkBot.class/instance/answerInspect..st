commands
answerInspect: aMessage
	"Respond to the aMessage with an /inspect command, i.e. evaluate it and answer an in-spector-like representation of the result."

	^ self processMessage: aMessage andDo: [:result |
		| fields |
		fields := (Inspector inspect: result) fields
			collect: [:field | (field name asStringOrText asText removeAttributesThat: [:attrib |
					attrib isSupportedByTelegramBot not]
				) -> ([field shouldPrintValueAsIs
				ifTrue: [field value asStringOrText]
				ifFalse: [field value printString]]
					ifError: [self errorText: '<error in #printString>'])]
			as: OrderedDictionary.
		
		fields keysAndValuesRemove: [:key :value |
			#(self 'all inst vars') includes: key asString].
		(fields associationAt: '...' ifAbsent: [nil]) ifNotNil: [:assoc |
			assoc value: (Text
				string: (assoc value asString
					copyWithRegex: '(?<=Fields named .* not shown.).+(?=>)'
					matchesReplacedWith: '')
				attributes: {TextEmphasis italic}).
			self flag: #wish. "#copyWithRegex:matchesReplacedWith: on Text would be great"].
		
		self messageWithUserText: ('{1} {2}\{3}' withCRs asText format: {
			result class asString asText beAllBold.
			[result printStringLimitedTo: 50] ifError: [
				self errorText: '<error in #printString>'].
			Text streamContents: [:stream |
				fields associations
					do: [:assoc |
						stream withAttribute: TextEmphasis underlined do: [
							stream nextPutAll: assoc key withBlanksTrimmed].
						stream nextPut: $:; tab.
						stream nextPutAll: assoc value withBlanksTrimmed]
					separatedBy: [stream cr]]})]