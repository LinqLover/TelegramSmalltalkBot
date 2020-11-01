*TelegramSmalltalkBot-Core
asTelegramSmalltalkBotMessageFor: aBot

	(self respondsTo: #asTelegramBotMessageFor:)
		ifTrue: [^ self asTelegramBotMessageFor: aBot].
	^ aBot messageWithObject: self