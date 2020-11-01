evaluation
doSafely: aBlock ifError: errorBlock

	self flag: #extend. "Here is much more potential for isolation. Transcript forwarding, ToolSet installation, timeouts ..."
	^ [SystemChangeNotifier uniqueInstance doSilently: aBlock]
		on: ProvideAnswerNotification
		do: [:notification | errorBlock cull: notification]
		on: Error, Warning, Halt
		do: [:error | errorBlock cull: error]
		on: UnhandledError
		do: [:error | errorBlock cull: error]