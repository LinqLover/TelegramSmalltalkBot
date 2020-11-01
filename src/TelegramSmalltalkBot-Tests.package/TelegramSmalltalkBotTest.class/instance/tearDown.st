running
tearDown

	self deny: bot class packageInfo notNil.
	SystemChangeNotifier uniqueInstance doSilently: [
		bot class removeFromSystem].
	
	^ super tearDown