message sending
editMessage: oldMessage changeTo: newMessage
	"Avoid to add or remove medias to or from the message, which is currently not supported by the API. See comment in superclass."

	(oldMessage isMediaMessage and: [newMessage isMediaMessage not]) ifTrue: [
		newMessage becomeForward: ((newMessage as: TBPhotoMessage)
			form: (Form extent: 1 @ 1) "dummy form";
			yourself)].
	(oldMessage isMediaMessage not and: [newMessage isMediaMessage]) ifTrue: [
		newMessage becomeForward: ((newMessage as: TBMessage)
			yourself)].
	
	^ super editMessage: oldMessage changeTo: newMessage