# League of Legends

[League of Legends](https://www.leagueoflegends.com/en-us) is a multiplayer
online battle arena [game](/wiki/game.md) which is available as a standalone Launcher for
[Windows](/wiki/windows.md).
It is developed and published by [Riot Games](https://www.riotgames.com/en).

## Setup

League of Legends is available to download for
[Windows](/wiki/windows.md) systems on
[the official website](https://signup.leagueoflegends.com/en-us/signup/index#/).

For [Linux](/wiki/linux.md) distributions [Lutris](/wiki/games/lutris.md)
and [WINE](/wiki/linux/wine.md) can be used to run the game.
The correct version can be downloaded using the
[Lutris website](https://lutris.net/games/league-of-legends/).
It is recommended that a custom version of [WINE GE](/wiki/linux/wine.md) is
used named `Lutris-GE` which can be found on
[the GitHub page of WINE-GE-custom](https://github.com/GloriousEggroll/wine-ge-custom/releases?q=lol&expanded=true).
It is important to set up the game correctly for anti-cheat to work properly.
By checking the right box at the launch of the games the anti-cheat can be
enabled to persist through reboots on most Linux distributions.
For [Arch Linux](/wiki/linux/arch-linux.md) this has to be done
manually as explained by
[QuinnBorn on Reddit](https://www.reddit.com/r/leagueoflinux/comments/eokiir/anticheat_popup_every_reboot/).
For that the file `/etc/sysctl.d/vsyscall.conf` has to be created with the
contents `abi.vsyscall32 = 0`.
