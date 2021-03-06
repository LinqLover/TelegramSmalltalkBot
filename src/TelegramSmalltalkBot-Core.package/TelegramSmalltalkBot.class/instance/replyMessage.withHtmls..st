message sending
replyMessage: aMessage withHtmls: htmlStrings

	htmlStrings do: [:htmlString |
		self
			sendText: ((HtmlReadWriter on: htmlString readStream)
				breakLines: false;
				nextText)
			toChat: aMessage chat].