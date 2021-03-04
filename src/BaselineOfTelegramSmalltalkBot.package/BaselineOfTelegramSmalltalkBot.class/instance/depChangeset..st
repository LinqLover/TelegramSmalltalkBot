scripts
depChangeset: urlString

	| url response |
	url := Url absoluteFromText: urlString.
	response := WebClient httpGet: url downloadUrl.
	response isSuccess ifFalse: [
		self error: ('Cannot load changeset from {1}: {2}'
			format: {urlString. response status})].
	^ url fileName -> [
		| contents |
		contents := response content.
		contents readStream fileIn]