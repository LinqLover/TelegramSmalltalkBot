scripts
installPreviewDependencies

	| dependencies |
	self flag: #workaround. "As soon as the versions listed here get merged, this should be removed"
	
	dependencies := {
		"JsonObject >> #respondsTo:, see http://forum.world.st/I-d-like-to-contribute-to-the-JSON-project-tp5121353p5121354.html"
		self depMergeVersion: 'http://forum.world.st/attachment/5124870/0/JSON-ct.56.mcz'.
		
		"Text >> #beAllBold"
		self depChangeset: 'http://forum.world.st/attachment/5121467/0/Text-emphasis.1.cs'.
	}.
	
	dependencies
		do: [:dep | dep value value]
		displayingProgress: [:dep | 'Installing preview dependencies... ({1})' format: {dep key}].