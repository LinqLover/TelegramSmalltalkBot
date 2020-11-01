support
makeMessageFrom: anObject

	| message |
	(anObject isString or: [anObject isText]) ifFalse: [
		self fail: 'Message type not yet suppported!'].
	
	message := JsonObject new
		at: #text put: anObject;
		at: #messageId put: self nextMessageId;
		at: #from put: (JsonObject new
			at: #id put: self clientChatId;
			yourself);
		at: #chat put: (JsonObject new
			at: #id put: self clientChatId;
			at: #type put: #private;
			yourself);
		yourself.
	
	"Add missing TBTextCommand attributes"
	message text ifNotNil: [:text | | commandRanges newText |
		newText := text asText copy.
		commandRanges := newText string allRangesOfRegexMatches: '(?<!\S)\/\S+'.
		commandRanges do: [:range | | subtext |
			subtext := newText copyFrom: range start to: range stop.
			(subtext runs noneSatisfy: [:attributes | attributes anySatisfy: [:attribute |
				(attribute isKindOf: (Smalltalk classNamed: #TextCodeStyle)) or: [
					attribute isTelegramBotAttribute and: [
						attribute isRedundantForString: subtext string]]]]) ifTrue: [
				newText
					addAttribute: (TBTextCommand
						readFrom: subtext string
						forBotNamed: bot name)
					from: range start
					to: range stop]].
		message text: newText].
	
	^ message