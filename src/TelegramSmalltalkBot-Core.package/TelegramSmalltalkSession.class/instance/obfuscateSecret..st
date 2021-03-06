private
obfuscateSecret: secret
	"Don't let the user be aware of that they were dealing with a secret, just obfuscate it"

	| characters |
	secret isText ifTrue: [
		^ Text string: (self obfuscateSecret: secret string) runs: secret runs].
	secret isString ifFalse: [^ nil].
	
	characters := ($a to: $z) , ($A to: $Z) , ($0 to: $9).
	^ (1 to: secret size)
		collect: [:i | characters atRandom]
		as: String