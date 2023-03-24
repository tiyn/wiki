# Steam

[Steam](https://store.steampowered.com/) is a software for digital game
destribution.
It is developed by [Valve](https://www.valvesoftware.com).
Steam uses its compatibility layer, [Proton](./proton.md) for running windows
games on linux based operating systems.

## Usage

### Adding non-Steam Games

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

### Setting Icons and Banners for Games

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

## Error Handling

The following section addresses errors that can handle inside Steam or game
errors that are specific to Steam.

### Store Wishlist Displays More Items Than Shown

It is possible for the counter of the Steam wishlist to display more games than
the number of games shown when showing the wishlist.
This happens when a game is removed from the Steam store but still being on the
wishlist.
To remove it navigate to the wishlist in a browser like
[Firefox](/wiki/firefox.md).
Press `F12` to open up the developer tools.
Then navigate to the `Console` tab and enter `g_rgWishlistData` in it.
It will display the list of games inside the wishlist.
Identify the game that has been removed and is not shown in the wishlist
anymore.
Remember the `appid` of the game
Then run the following command inside the console and change `<appid>`
accordingly.

```js
$J.post( g_strWishlistBaseURL + 'remove/', {
				'appid' : <appid>,
				'sessionid' : g_sessionID
});
```

By running this the game will be removed from the wishlist causing it to display
the correct number of games.
