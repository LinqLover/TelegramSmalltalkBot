baseline
baseline: spec
	<baseline>

	spec for: #common do: [
		"dependencies"
		spec
			baseline: 'TelegramBot' with: [
				spec
					repository: 'github://LinqLover/TelegramBot/src';
					loads: #minimal];
			package: 'JSON' with: [
				spec repository: 'https://www.squeaksource.com/PostgresV3'].
		
		"packages"
		spec
			package: 'TelegramSmalltalkBot-Core' with: [
				spec requires: #('TelegramBot').
				spec postLoadDoIt: #installPreviewDependencies];
			package: 'TelegramSmalltalkBot-Tests' with: [
				spec requires: #('TelegramSmalltalkBot-Core' 'JSON')]].