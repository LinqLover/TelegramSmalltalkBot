commands
doStart: aMessage

	^ self replyMessage: aMessage withHtmls: {
		'<b>Welcome to the Squeak/Smalltalk Bot! 👋</b>

Just send some random <a href="https://learnxinyminutes.com/docs/smalltalk/">Smalltalk</a> code expressions to me and I will try to evaluate each of them in an up-to-date <a href="https://squeak.org/">Squeak</a> image for you – what''s that if not Smalltalk in its loveliest form 😏

You can also prepend commands such as /do or /print to vary my outputs. For an exhaustive list of all the exciting things we can reach together, send /help.'.
		'This bot is open-source and available on GitHub:
<a href="{2}">🐙 {1}</a>
We cordially invite you to visit the repository and to contribute. Your bugs will be fixed and your PRs will be merged!' format: {self class repositoryStub. self class repositoryUrl}.
		'Carpe Squeak! 🐭'
	}