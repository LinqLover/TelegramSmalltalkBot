private
generateCodeExample

	^ {
		'1 + 2 * 3'.
		'2 + 3 * 4'.
		'6 * 7'.
		'Float pi i exp stringForReadout'.
		'(16 factorial + 1) isPrime'.
		'(1 to: 9) join asNumber sqrt truncateTo: 1e-3'
	} atRandom