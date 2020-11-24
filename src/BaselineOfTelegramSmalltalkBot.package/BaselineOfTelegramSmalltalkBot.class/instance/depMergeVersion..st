scripts
depMergeVersion: urlString

	| url |
	url := Url absoluteFromText: urlString.
	^ url fileName -> [
		| contents version |
		contents := url retrieveContents.
		version := ((MCVersionReader readerClassForFileNamed: url fileName)
			on: contents contentStream) version.
		[version merge]
			on: MCNoChangesException
			do: [:ex | ex resume]
			on: MCMergeResolutionRequest
			do: [:ex | ex merger conflicts
				ifEmpty: [ex resume: true]
				ifNotEmpty: [ex pass]]]