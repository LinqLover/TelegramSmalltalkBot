commands
doHelp: aMessage

	| helpStrings filteredHelpStrings reply |
	helpStrings := self helpStrings.
	filteredHelpStrings := {}.
	aMessage mainText isEmptyOrNil ifFalse: [
		| commands |
		commands := aMessage mainText asString regex: '\b\/?\w+\b' matchesCollect: #yourself.
		filteredHelpStrings := Dictionary newFrom: (
			helpStrings associationsSelect: [:assoc |
				commands includes: assoc key]).
		filteredHelpStrings ifNotEmpty: [
			commands readStream in: [:read |
				(read peek = 'help' and: [(read peek: 2) size >= 2]) ifTrue: [
					| writeHelp writeCommand |
					writeHelp := WriteStream on: ''.
					writeCommand := WriteStream on: ''.
					writeHelp nextPutAll: 'Show '; nextPutAll: read peek.
					writeCommand nextPutAll: read peek.
					[read peek = 'help' and: [(read peek: 2) size >= 2]] whileTrue: [
						writeHelp nextPutAll: ' on '; nextPutAll: read peek.
						writeCommand space; nextPutAll: read next].
					writeHelp nextPutAll: ' on '; nextPutAll: read peek.
					writeCommand space; nextPutAll: read next.
					filteredHelpStrings
						removeKey: 'help';
						at: writeCommand contents put: writeHelp contents].
			helpStrings := filteredHelpStrings]]].
	
	reply := self replyMessage: aMessage withHtml: (String streamContents: [:stream |
		filteredHelpStrings ifEmpty: [
			stream nextPutAll: ('To get started, just send me any valid Smalltalk expression (e. g., <code>{1}</code>). In addition, I understand the following messages:' format: {self generateCodeExample}); cr; cr].
		helpStrings associations
			do: [:assoc | stream nextPutAll: ('/{1} - {2}' format: {
				assoc key. assoc value})]
			separatedBy: [stream cr].
		filteredHelpStrings ifEmpty: [
			stream cr; cr; nextPutAll: 'Furthermore, you can send your messages to any of my previous replies to choose the receiver context accordingly (i. e., to bind <code>self</code> to the object from the reply). Last but not least, if you edit any of your messages, I will update my answers accordingly, so together we can erase every trace of your former slips (who controls the past ...). Have fun!'].]).
	
	(self sessionFor: aMessage chat)
		record: '<b><i>🥚 Congratulations, you uncovered an easter egg! 🎉</i></b>'  asTextFromHtml "Sticker would be even nicer though"
		fromAnswer: reply
		bot: self.