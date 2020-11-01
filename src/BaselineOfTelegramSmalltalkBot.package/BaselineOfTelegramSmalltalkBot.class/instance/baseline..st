baseline
baseline: spec
	<baseline>

	spec for: #common do: [
		"dependencies"
		spec
			baseline: 'TelegramBot' with: [
				spec
					repository: 'github://LinqLover/TelegramBot/src';
					loads: #minimal].
		
		"packages"
		spec
			package: 'TelegramSmalltalkBot-Core' with: [
				spec requires: #('TelegramBot')];
			package: 'TelegramSmalltalkBot-Tests' with: [
				spec requires: #('TelegramSmalltalkBot-Core')]].