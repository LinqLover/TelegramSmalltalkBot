message sending
replyMessage: aMessage withHtmls: htmlStrings beforeSendDo: messageBlock

	^ htmlStrings collect: [:htmlString |
		| text message |
		text := (HtmlReadWriter on: htmlString readStream)
			breakLines: false;
			nextText.
		message := self messageWithText: text.
		messageBlock value: message.
		self
			sendMessage: message
			toChat: aMessage chat]