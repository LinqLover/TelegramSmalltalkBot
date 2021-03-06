evaluation
doSafely: aBlock ifError: errorBlock

	self flag: #extend. "Here is much more potential for isolation. Transcript forwarding, ToolSet installation, timeouts ..."
	
	thisContext wrap: [:wrapped | wrapped
		valueWithin: 60 seconds
		onTimeout: [errorBlock value: 'Expression timed out']].
	
	^ self
		doSafely:[
			thisContext wrap: [:wrapped | SystemChangeNotifier uniqueInstance doSilently: wrapped].
			aBlock value]
		on: ProvideAnswerNotification, (Error, Warning, Halt), UnhandledError
		do: [:error | errorBlock cull: error]
		useSandbox: self isolationEnabled