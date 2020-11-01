initialize-release
initialize

	super initialize.
	
	bindings := Dictionary new.
	answers := WeakValueDictionary new.
	results := WeakValueDictionary new.
	pinnedAnswers := OrderedCollection new.
	pinnedResults := OrderedCollection new.
	pinnedClosures := WeakKeyDictionary new.