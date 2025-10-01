# Lutris

[Lutris](https://lutris.net/) is a free and open source video [game](/wiki/game.md) platform for
[Linux](/wiki/linux.md) systems.
It features compatibility with [GOG](https://www.gog.com/),
[Humble Bundle](https://humblebundle.com/),
[Epic Games](https://www.epicgames.com/), [Steam](/wiki/game/steam.md) and many
other [Windows](/wiki/windows.md) games via its own installer that uses
[WINE](/wiki/linux/wine.md). Lutris can also use [Proton](/wiki/game/proton.md)
- a patched version of WINE developed by
[Valve](https://www.valvesoftware.com/).
Additionally to that Lutris supports many different
[emulators](/wiki/game/emulators.md).
For running both Windows applications aswell as games
[Bottles](/wiki/game/bottles.md) can be used.

## Usage

The following section describes the usage of Lutris.

### Manually Add a Game

By clicking on the `+` in the left upper corner of the Lutris application a new
game can be manually added.

Mount `.iso` files as explained in the [ISO image entry](/wiki/linux/iso_image.md#mounting).
Some installations require the swapping of discs during the installation.
An easy way around this is to mount the [ISO image](/wiki/linux/iso_image.md#mounting) and copy them
into another directory.
This way the files from two discs can be put in one folder.
Afterwards follow the installation as usual.

If a setup executable is available select `Install a Windows game from media`.
Then select the setup executable from the mounted path.
And proceed with the installation.
Lutris will automatically pick the correct executable to start the game after
setup.

For non-setup `.exe` files of completely downloaded games select
`Add locally installed game`.
Make sure to select the runner [WINE](/wiki/linux/wine.md) for the game in the
following window.
Make sure to set the `Wine prefix` to the desired location.
Select the `Working directory` to be the location of the downloaded game.
For cleanup afterwards the game can be moved into the WINE prefix folder as if
it was installed inside Windows.
If so make sure to point the `Executable` after right-clicking the game and
selecting `Configure` to the right location and remove the `Working directory`
entry as it is not needed if the executable is inside the WINE prefix.


### Setting Environment Variables

Environment variables can be set globally or on a per game basis.
To set them globally navigate to the `Global options` tab in the `Preferences`.
There the `Environment variables` can be added and removed by selecting the
corresponding buttons.
To set the environment variables for a single game right-click the game and
select `Configure`.
Navigate to the `System options` tab where the `Environment variables` can be
found.

An environment variable has two parts.
The key and the value.
This guide uses the notation `key=value` for better readability.
The following is an example of an environment variable in this notation.

```txt
__GL_SHADER_DISK_CACHE=1
```

### Nvidia Shader Cache Settings

This section is based on a
[piece of documentation by Lutris](https://github.com/lutris/docs/blob/master/Performance-Tweaks.md#nvidia-gpu-only-optimization)
regarding performance optimization for systems with [Nvidia](/wiki/nvidia.md)
GPUs.

For Nvidia GPUs the shader cache is set to have a softlimit of 128MB.
This can be easily reached by some games and will cause performance limitations.
The cleanup of the cache after reaching 128MB can be disabled.
For this set `__GL_SHADER_DISK_CACHE_SKIP_CLEANUP` to `1` as explained in the
[section regarding environment variables](#setting-environment-variables).

By default Lutris uses a cache location for all games.
For better trouble shooting capabilities a unique shader location for each game
can be set.
This can be done with the [environment variable](#setting-environment-variables)
`__GL_SHADER_DISK_CACHE_PATH=</path/to/shaders/>` that has to be set as a per
game variable and adapted with a path of your choosing.

### Performance Tweaks

This section addresses ways of increasing the performance of games when run by
Lutris.

An easy way to increase the performance of games is to install and enable
[Feral GameMode](https://github.com/FeralInteractive/gamemode) as recommended in
the [documentation of Lutris](https://github.com/lutris/docs/blob/master/Performance-Tweaks.md#enable-game-mode).
It is important to install both the 64-bit and the 32-bit version to ensure full
functionality.
Check the package manager of your distribution for packages with the names
`gamemode` and `lib32-gamemode` or similar names or install it manually via git.
Afterwards check in Lutris `Preferences` if `Enable Feral GameMode` is checked
under the `Global options` tab.

Another way to increase the performance is to increase the
[Nvidia Shader Cache](#nvidia-shader-cache-settings) limit.

### Installing Windows DLLs

Select the game in the `Games` tab of the library.
Then select the upwards arrow next to the [WINE](/wiki/linux/wine.md) symbol in
the bar at the lower screen.
Select `Winetricks` and `Select the default wineprefix` in the window
afterwards.
After selecting `Install a Windows DLL or component` the package to install can
be selected.

### Change WINE/Proton Version

[Windows](/wiki/windows.md) games are handled by
[WINE](/wiki/linux/wine.md).
After right-clicking a game and selecting `Configure` the `Wine version` can be
changed under the `Runner options` tab.
There are many different versions of WINE, WINE-fshack and various
[Proton](/wiki/game/proton.md) and
[Proton GE versions](/wiki/game/proton.md#ge-version) to select.
Using the default runner of [Bottles](/wiki/game/bottles.md) - called
[Caffe](/wiki/game/bottles.md#caffe) - is also possible.

### Disable Networking for a Game

For disabling networking for a command the program
[firejail](https://github.com/netblue30/firejail) can be used.
In Lutris after the installation of firejail right-click the game to disable networking on.
Select `Configure` and navigate to `System Options`.
Enable `Advanced` and insert `firejail --net=none --noprofile` into the `command prefix` field.
Afterwards all networking of the selected game is disabled.

### Adding and Removing Runners and Sources

Runners are ways to run [games](/wiki/game.md) on [Linux](/wiki/linux.md).
Examples for runners are [WINE](/wiki/linux/wine.md), [Steams Proton](/wiki/game/proton.md) or
[Flatpak](/wiki/linux/flatpak.md).
Sources are platforms for game distributions like [Steam](/wiki/game/steam.md) and Lutris itself.

Both sources and runners can be added and removed as needed by entering `Preferences` through the
drop-down menu and toggling on or off sources aswell as installing or uninstalling runners.

### Minimizing and System Tray

Under `Interface` in the `Preferences` available by selecting the menu there are options available
to `minimize client when a game is launched`.
This can be useful to unclutter the workspace selected.
This option works best with `Show Tray Icon` checked because it will display Lutris inside the
system tray.

## Troubleshooting

This section addresses various errors that can happen when using Lutris.

### DX12/DX13 is not Supported on Your System

This section handles a fix if the game is not able to run due to the system not
supporting DX12 or DX13.
This can be easily fixed by inserting `-dx11` in `Arguments` under the
`Game options` tab that pops up after selecting `Configure` for a selected game.

### Crashes for Windows Games

When it comes to crashes for [Windows](/wiki/windows.md) games that get
handled by [WINE](/wiki/linux/wine.md) one point of failure is the selected
WINE version.
Change the version used as explained in
[the regarding section](#change-wineproton-version).
Especially trying [Proton GE versions](/wiki/game/proton.md#ge-version) or
WINE fshack versions can lead to successful running of the game.
Specific games also benefit from running [Caffe](/wiki/game/bottles.md#caffe).
