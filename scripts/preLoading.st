"Workaround for https://github.com/hpi-swa/smalltalkCI/pull/485 and https://github.com/Metacello/metacello/issues/524"
SCIMetacelloLoadSpec updateMetacello.

"Actual credentials configuration"
MCFetchGithubRepository sitePassword: (SmalltalkCI getEnv: 'GH_ACCESS_TOKEN').
