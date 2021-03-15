# TelegramSmalltalkBot

[![Actions Status](https://github.com/LinqLover/TelegramSmalltalkBot/workflows/smalltalkCI/badge.svg)](https://github.com/LinqLover/TelegramSmalltalkBot/actions)
[![Coverage Status](https://coveralls.io/repos/github/LinqLover/TelegramSmalltalkBot/badge.svg)](https://coveralls.io/github/LinqLover/TelegramSmalltalkBot)
[![Chat now](https://img.shields.io/badge/chat%20now-%40SqueakSmalltalkBot-0088cc)](https://t.me/SqueakSmalltalkBot)

A Telegram bot that connects you to a remote [Squeak/Smalltalk](https://squeak.org/) image and allows you to explore it by sending Smalltalk expressions to the bot.
Implemented using the [TelegramBot framework](https://github.com/LinqLover/TelegramBot) and [SimulationStudio](https://github.com/LinqLover/SimulationStudio) for sandboxed execution.

<p align="center">
	<a href="https://github.com/LinqLover/TelegramSmalltalkBot/blob/master/img/screenshot1.png"><img src="https://github.com/LinqLover/TelegramSmalltalkBot/raw/master/img/screenshot1.png" width="42%" hspace="5%" alt="Screenshot of a Telegram chat with the following messages sent to the bot: `Smalltalk version`, `3 + 4 * 6`, and `Display := Form extent: 600 asPoint depth: 32. Pen new mandala: 30. Display`."></img></a>
	<a href="https://youtu.be/HZCeThLqQmg"><img src="https://github.com/LinqLover/TelegramSmalltalkBot/raw/master/img/screencast.gif" width="38.6%" alt="Screencast of a Telegram chat."></img></a>
</p>

There is also a [screencast available on YouTube](https://youtu.be/HZCeThLqQmg).

## Try it out!

An instance of the bot is live under [@SqueakSmalltalkBot](https://t.me/SqueakSmalltalkBot).
Just send it a message and say hello!

<a href="https://t.me/SqueakSmalltalkBot"><img src="https://github.com/LinqLover/TelegramSmalltalkBot/raw/master/img/banner.svg" height="50px" alt="@SqueakSmalltalkBot"></img></a>

If you experience any problems, please [create an issue](https://github.com/LinqLover/TelegramSmalltalkBot/issues/new/choose).

## Self-Hosting the Bot

1. Install the latest Trunk updates in your image, then evaluate the following in a Workspace:

   ```smalltalk
   Metacello new
   	baseline: 'TelegramSmalltalkBot';
   	githubUser: 'LinqLover' project: 'TelegramSmalltalkBot' path: 'src';
   	load.
   ```

2. Chat with [@BotFather](https://t.me/BotFather) to register your very own bot.
   He will send you a secret bot token.

3. To start a bot instance, do something like:

   ```smalltalk
   bot := TelegramSmalltalkBot withToken: '<your_bot_token>'.
   bot spawnNewProcess.
   ```

4. Send a message to your bot and enjoy!

5. If you do not want that everyone from all over the world has access to your bot, you can define an allow-list of chat IDs and provide it via the `TBTestBotChatIds` global variable (experimental):

   ```smalltalk
   Smalltalk at: #TBTestBotChatIds put: #(<your_chat_id_integer>).
   ```

   You can find out your own chat ID by browsing the sessions object of your running bot instance using an object explorer, or by inspecting the result of `bot peekUpdates` after sending a message to the bot.

Configuration of the bot (e.g. to turn off isolation and quota mechanisms) is currently only supported by editing the source code, though it contains some applicable hooks such as `TelegramSmalltalkSession >> #isolationEnabled`.
If you miss a certain configuration hook or extension point, please create an issue or a pull request.

## Development

Version control is run using [Squot](https://github.com/hpi-swa/Squot).
Your contribution is welcome!
I'm always happy about bug reports, new feature proposals, or even pull requests ... :-)

Carpe Squeak!
