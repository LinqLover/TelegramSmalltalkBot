accessing
secrets

	^ self allSubInstances collect: [:bot |
		bot instVarNamed: 'token']