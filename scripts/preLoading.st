"Workaround for https://github.com/hpi-swa/smalltalkCI/pull/485 and https://github.com/Metacello/metacello/issues/524"
Installer new installSAR: 'metacello.sar' from: (WebClient httpGet: 'http://forum.world.st/attachment/5121139/0/metacello.sar') content asByteArray readStream.
Metacello new
	baseline: 'Metacello';
	repository: 'github://Metacello/metacello/repository';
	load.

"Actual credentials configuration"
MCFetchGithubRepository sitePassword: (SmalltalkCI getEnv: 'GITHUB_TOKEN').
