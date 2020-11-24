scripts
depChangeset: urlString

	| url |
	url := Url absoluteFromText: urlString.
	^ url fileName -> [
		| contents |
		contents := url retrieveContents.
		contents contentStream fileIn]