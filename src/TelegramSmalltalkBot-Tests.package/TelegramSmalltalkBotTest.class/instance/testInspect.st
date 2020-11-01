tests
testInspect

	self
		shouldBotAsked: '/inspect (Object newUniqueClassInstVars: ''foo bar'' classInstVars: '''')
	new
			instVarNamed: ''foo'' put: #test;
			instVarNamed: ''bar'' put: Object new;
			yourself'
		answerSatisfy: [:answer |
			#('an Object\d+' 'foo\:\s*#test' 'bar\:\s*an Object') do: [:regex |
				self assert: (regex asRegex search: answer text asString)]].