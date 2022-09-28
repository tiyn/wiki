# Steam

[Steam](https://store.steampowered.com/) is a software for digital game
destribution.

## Proton

### Errors with the Wine prefix of a specific game

The last ressort for fixing problems that are related to the wine prefix of a
game is to delete the Wine prefix.
For this the id of the Steam game first has to be known.
This is done by navigating to the Steam website or the community page of the
specific game.
The URLs will have one of the following forms where the game id can be read:

```
http://steamcommunity.com/app/<game id>/
http://store.steampowered.com/app/<game id>/
```

After that navigate to the place your Steam games are stored.
You can remove `<steam location>/steamapps/compatdata/<game id>` to reset the
Wine prefix completely.
It is recommended to keep a backup of the folder containing the old Wine prefix
as it stores game saves and other important data, that can be useful.

## Adding non-Steam Games

Games that are not in the Steam store can be added to the Steam application.
This is done by opening (the desktop mode) of Steam and selecting
`Add a Non-Steam Game to My Library` under the `Games` tab in the top left
corner.
A dialog window will open to select the software to add to Steam.
Check the box or boxes of the software to add to Steam and tap
`Add Selected Programs`.

For games such as launchers a `Launch Option` can be set most of the time to
skip the launcher and go directly into the specified game.
This option usually mirrors the command that would be used in the command line
of a system to go directly into the game.
Often this is done by simply appending the path of the specified game to the
command but this can also differ depending on the launcher.

Websites can be added by setting `xdg-open "<url/ip>"` as the `Launch Option`.
This will open the website with the Steam browser.

## Setting Icons and Banners for Games

Images for games can be changed by downloading them and applying them manually.
An easier route can be taken by using
[SGDBoop](https://www.steamgriddb.com/boop).
To use it, you first need to install it.
It is available in the [flatpak package manager](../linux/flatpak.md).
After that navigate to the
[SteamGridDB website](https://www.steamgriddb.com/boop) and log in with your
Steam account.
Follow the remaining steps as described on the website.
Following this different images, banners and icons can be found on
[the website](https://www.steamgriddb.com/).
When hovering over an asset a little blue button will appear.
On the press of the button a game can be chosen that will use the asset in the
Steam application.
Make sure the game is a Steam game or
[added to Steam as a non-Steam game](#adding-non-steam-games).
After the installation of the game, the system may need to restart to correctly
work with [SGDBoop](https://www.steamgriddb.com/boop) for the game.

## Steam Cloud

The [Steam Cloud](https://partner.steamgames.com/doc/features/cloud) allows
games  and the platform to utilize cloud storage hosted by Steam.
Games can use this to store data including game settings and saves.

### Synchronize games saves without non-Steam-Cloud

By using [Syncthing](../syncthing.md) game saves can be synchronized without
the Steam Cloud.
First set up Syncthing as described in the
[Syncthing entry](../syncthing.md#setup).
If the [Steam Deck](./steam_deck.md) or another system with only user access is
used the
[user space configuration](../syncthing.md#user-space-configuration-for-linux)
is recommended.
Afterwards move the game saves to the directory set up by Syncthing and create
symbolic links to link them back to the original place.
