# Discord

[Discord](https://discord.com/) is an social platform that combines voice and video conferences as
well as instant messaging chats.
Additionally to the default website Discord also features a desktop client in the form of an
[Electron-based app](/wiki/electron.md).

## Alternatives

There are some alernative frontends and modifications available for Discord.

- [BetterDiscord](/wiki/betterdiscord.md) is a modification for Discord on
  [Linux-based systems](/wiki/linux.md), which changes an existing installation of Discord.
  It supports a wide range of plugins and themes.
- [Vencord](/wiki/vencord.md) is a standalone custom Discord App.
  It supports a wide range of plugins and themes.
- [Revenge](https://github.com/revenge/revenge-manager) is a standalone client modification of
  Discord for [Android](/wiki/android.md).
  It supports a wide range of plugins and themes.

## Usage

This section addresses various features of Discord.

### Disable Automatic Update Checks

By default, Discord performs an automatic check to see if it is up to date.
On [Linux](/wiki/linux.md)-based systems it can be disabled by adding `"SKIP_HOST_UPDATE": true` to
the `~/.config/discord/settings.json` file.

### Setting Up a Music Bot

For Discord there are various bots capable of playing music.
The following is a list of bots featured in this wiki that can do this.

- [Sinusbot](/wiki/sinusbot.md) is a self-hosted bot for Discord that can play music and sounds.
  It's closed-source and free of charge.
  It also features [TeamSpeak](/wiki/teamspeak.md) support.

### Themes and Plugins

By default Discord has no option to use themes or plugins.
To use themes or plugins [alternative frontends or client modifications](#alternatives) have to be
used.

## Troubleshooting

This section will focus on errors and the fixing of errors of Discord.

### Streaming Audio not Possible

Using the default client when sharing the screen the audio might not be streamed aswell.
this section is based on a
[Reddit comment by Malo1301](https://www.reddit.com/r/linux_gaming/comments/1kbplea/no_audio_when_sharing_screen_on_discord_for_linux/).
This can happen with both [Wayland](/wiki/linux/wayland.md) and
[X11](/wiki/linux/x_window_system.md).
The simplest way to fix is to use [Vesktop](https://github.com/Vencord/Vesktop).
