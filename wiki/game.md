# Game

A video game - short game - is an electronic game that features interation and input from the user
to generate a feedback.
Games can be played on different platforms.
To create games [game engines](/wiki/game_engine.md) can be used.

## Game Platforms, Distributors and Managers

There are various platforms for managing games.
[Steam](/wiki/game/steam.md) is a gaming a platform for games that distributes games at the same
time.
Games bought in the Steam shop but also third party games can be added to the game list.
It is very popular and cross platform capable.

For [Linux-based systems](/wiki/linux.md) the most used platform is a game manager called
[Lutris](/wiki/game/lutris.md).
Lutris can incorporate local games, aswell as games from various big platforms including steam.
It is especially popular on Linux because it can manage [WINE](/wiki/linux/wine.md) prefixes and
thus is able to easily run [Windows](/wiki/windows.md) games on Linux.

Furthermore [Gameyfin](/wiki/game/gameyfin.md) is a game manager that can be easily accessed
through a web interface.
Games can then be downloaded from the website.

## Selection of Cross Platform Games

Some online and mostly multiplayer games can be played via the [web browser](/wiki/web_browser.md).
A notable amount of this group of games uses the top-level domain `.io`.
Some examples for these are [territorial.io](https://territorial.io/) and
[slither.io](http://slither.io/).

Another online game is [Massive Decks](/wiki/game/massive_decks.md) which is the online take on a similar
popular tabletop game.

For Windows there is the popular old-school pinball game 3d Pinball Space Cadet.
This game has been [reverse engineered and ported](https://github.com/k4zmu2a/SpaceCadetPinball) to
various platforms and operating systems.

## Syncing Game Saves Across Systems

By using [Syncthing](/wiki/syncthing.md) game saves can be synchronized.
First set up Syncthing as described in the
[Syncthing entry](../syncthing.md#setup).
If a system with only user access - like the [Steam Deck](/wiki/game/steam_deck.md) - is used the
[user space configuration](../syncthing.md#user-space-configuration-for-linux)
is recommended.
Afterwards move the game saves to the directory set up by Syncthing and create
[symbolic links](/wiki/linux/shell.md#symbolic-links-using-ln) to link them back to the original
place.

For games on [Steam](/wiki/game/steam.md) it is possible that they are automatically synchronized
by [Steam Cloud](/wiki/game/steam.md#steam-cloud-and-game-synchronization).

## Speedrunning

Speedrunning is the process of trying to finish a video game in shortest amount of time.
A very popular site to compare speedruns is [speedrun.com](https://www.speedrun.com/).
While speedrunning a split tracker is used that keeps track of the time and the times of each
section of the game.
The following is a list of possible split trackers to use.

- [LiveSplit](http://livesplit.org/) is a popular split tracker available for
  [Windows](/wiki/windows.md) systems.
- [LiveSplit One](https://one.livesplit.org/) is a web-based version of LiveSplit.
- [urn](https://github.com/3snowp7im/urn) is a split tracker for [Linux](/wiki/linux.md) based
  systems.

To set up a split tracker for a specific game usually split files are used.
The format needed varies from split tracker to split tracker.
Split files in most formats and for many games can be found on [splits.io](https://splits.io/).
