scripts
installPreviewDependencies

	| dependencies |
	self flag: #workaround. "As soon as the versions listed here get merged, this should be removed"
	
	dependencies := {
		"Text >> #beAllBold"
		self depChangeset: 'http://forum.world.st/attachment/5121467/0/Text-emphasis.1.cs'.
	}.
	
	dependencies
		do: [:dep | dep value value]
		displayingProgress: [:dep | 'Installing preview dependencies... ({1})' format: {dep key}].