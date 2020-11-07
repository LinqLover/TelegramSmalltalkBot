"Workaround for https://github.com/hpi-swa/smalltalkCI/pull/485 and https://github.com/Metacello/metacello/issues/524"
Installer new installSAR: 'metacello2.sar' from: (
	WebClient httpGet: 'https://gist.githubusercontent.com/LinqLover/8407df4997d465046920d9cd46a4e6f7/raw/8af1c40dc51564635b8e8ccf34919d4170b7c79d/metallo2.sar.base64')
		content base64Decoded asByteArray readStream.

"Actual credentials configuration"
MCFetchGithubRepository sitePassword: (SmalltalkCI getEnv: 'GITHUB_TOKEN').
