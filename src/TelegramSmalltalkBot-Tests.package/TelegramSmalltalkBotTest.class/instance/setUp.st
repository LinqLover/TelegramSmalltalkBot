running
setUp

	| watcherName |
	super setUp.
	
	watcherName := 'tbTestWatcher'.
	bot := (SystemChangeNotifier uniqueInstance doSilently: [
		self flag: #horrible. "Extract connector class instead."
		(TelegramSmalltalkBot newSubclass
			environment: self environment;
			addInstVarName: watcherName)
			compile: 'name
		^ ''test bot''';
			compile: 'handlesMessage: aMessage
		^ true'; flag: #workaround;
			compile: 'sendMessage: aMessage
		^ (self instVarNamed: ''',watcherName,''') sendMessage: aMessage';
			compile: 'sendMessage: aMessage toChat: aChat
		^ self sendMessage: aMessage';
			compile: 'editMessage: aMessage text: aStringOrText
		^ (self instVarNamed: ''',watcherName,''') editMessage: aMessage text: aStringOrText';
			yourself]) new "no token needed here"
				instVarNamed: watcherName put: self;
				yourself.
	bot isDebugging: true.
	
	lastMessageId := 0.
	receivedMessages := OrderedCollection new.
	editedMessages := OrderedDictionary new.