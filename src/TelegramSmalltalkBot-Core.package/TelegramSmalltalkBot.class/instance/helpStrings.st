private
helpStrings

	^ OrderedDictionary new
		at: #print put: 'Evaluate the subsequent expression and answer the result';
		at: #do put: 'Evaluate the subsequent expression and answer the result as a printString';
		at: #inspect put: 'Evaluate the subsequent expression and answer an inspector view on the result';
		at: #reset put: 'Delete the entire session and forget that we have ever known each other';
		at: #start put: 'Send the initial greeting message again (just because it is so beautiful)';
		at: #help put: 'Show this help';
		yourself