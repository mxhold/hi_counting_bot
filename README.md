# HiCountingBot

This is a very simple bot built using the
[Elixir-Slack](https://github.com/BlakeWilliams/Elixir-Slack) library.

Whenever anyone says "Hi", this bot will respond with how many times "Hi" has
been said.

## Getting started

In order to run the bot, you'll need a Slack API token which can be retrieved
from the [Web API page](https://api.slack.com/web) or by creating a new
[bot integration](https://my.slack.com/services/new/bot).

Once you have a token, you can run:

    iex -S mix

to start a console and then:

    HiCountingBot.start_link("your api token here", 0)

Then when you say "Hi" in a direct message to the bot or in a channel with the
bot, the bot will respond "Hi has been said 1 times".
