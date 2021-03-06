evaluation
doSafely: aBlock on: exceptionHandler do: exceptionBlock useSandbox: shouldUseSandbox

	| sandbox result |
	shouldUseSandbox ifFalse: [
		^ aBlock on: exceptionHandler do: exceptionBlock].
	
	thisContext insertSender: (Context contextOn: SandboxError do: exceptionBlock).
	sandbox := (sandboxMemory ifNil: [Sandbox new] ifNotNil: [Sandbox fromMemory: sandboxMemory])
		stepLimit: 10000000;
		flag: #todo; "garbage-collect side effects that are not related to bindings"
		yourself.
	{bindings. bindings array} , bindings array , bindings values do: [:ea |
		sandbox addObject: ea].
	self secrets do: [:secret |
		sandbox patchObject: secret with: (
			self obfuscateSecret: secret)].
	
	result := sandbox
		evaluate: aBlock
		on: exceptionHandler
		do: exceptionBlock.
	sandboxMemory := sandbox exportMemory.
	self maximumMemorySize ifNotNil: [:maxSize |
		| memSize |
		memSize := sandboxMemory memorySize.
		memSize > maxSize ifTrue: [
			[self notify: 'I''m sorry, but you have exceeded your memory limit. Everything will be wiped now']
				ensure: [sandboxMemory := nil]].
		memSize > (maxSize // 2) ifTrue: [
			"self notify: 'You have reached {1}% of your memory limit now. Maybe think about an upgrade or back up your data?'."
			self flag: #todo. "A mechanism for warning the user without aborting execution - maybe resume after Warnings by default? But would break threading structure. Or write all warnings into single message?"]].
	
	self flag: #hack. "Problem: Secret could be anywhere deeply nested in a real object"
	(self secrets anySatisfy: [:secret | result longPrintString includesSubstring: secret])
		ifTrue: [^ nil].
	
	^ result