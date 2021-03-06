support
makeChat

	^ JsonObject new
		at: #id put: self clientChatId;
		yourself