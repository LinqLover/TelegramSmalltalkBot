message sending
replyMessage: aMessage withHtml: htmlString

	^ (self
		replyMessage: aMessage
		withHtmls: {htmlString}
		beforeSendDo: [:message |]) anyOne