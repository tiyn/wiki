# BetterDiscord

[BetterDiscord](https://betterdiscord.app) is an unofficial extension to
[Discord](/wiki/discord.md) which allows to add various functionality through plugins and new
themes.
It is not a standalone client.

## Setup

BetterDiscord can be downloaded from [the official website](https://betterdiscord.app).

For [Linux-based systems](/wiki/linux.md) the tool
[betterdiscordctl](https://github.com/bb010g/betterdiscordctl) can be used.
After installing it the following commands have to be run for the stable version of Discord to be
converted to BetterDiscord.

```sh
betterdiscordctl install
```

Afterwards BetterDiscord can be kept up to date with the following command.

```sh
betterdiscordctl self-upgrade
```

### Pacman Hook

When using [Arch Linux](/wiki/linux/arch-linux.md) and its package managers
[Pacman and Yay](/wiki/linux/package_manager/pacman_and_aur.md) a hook can be set that
automatically updates the discord installation to setup betterdiscord using betterdiscordctl.
The following is a [pacman hook](/wiki/linux/package_manager/pacman_and_aur.md#hooks) that can be
used to update betterdiscord automatically.
Make sure to change the three occurences of `<username>` to the name of the user to install
betterdiscord for.

```sh
[Trigger]
Type = Package
Operation = Install
Operation = Upgrade
Target = discord*

[Action]
Description = Rebuild BetterDiscord after Discord update
When = PostTransaction
Exec = /usr/bin/sh -c 'sudo -u <username> betterdiscordctl reinstall >/dev/null 2>&1; sudo -u <username> xvfb-run -a discord --help >/dev/null 2>&1; sudo -u <username> betterdiscordctl install >/dev/null 2>&1; true'
Depends = xorg-server-xvfb
Depends = betterdiscordctl
NeedsTargets
```

## Usage

This section addresses the usage of BetterDiscord.

### Recommended Themes

The following themes are recommended by the author of this wiki.

- `midnight` is a dark, customizable discord theme.
- `system24` is a tui-like discord theme.

### Recommended Plugins

The following plugins are recommended by the author of this wiki.

- `BetterChatNames` improves chat names by removing dashes in chat channels.
- `BetterFriendList` adds extra controls to the friend page.
- `BetterVolume` allows to set user volume manually and higher than 200%.
- `ChatCounter` adds a character counter to most inputs.
- `DoNotTrack` stops Discord from tracking many things.
- `GameActivityToggle` adds a quick-toggle game activity button.
- `HideDisabledEmojis` hides disabled emojis form the emoji picker.
- `ImageUtilities` adds several utilities for images/videos.
- `InterTimestamps` allows you to insert timestamp markdown.
- `InvisibleTyping` is an enhanced version of silent typing.
- `MoreRoleColors` adds role colors to usernames.
- `OnlineFriendCount` adds the old online friend count.
- `PermissionViewer` allows to view a users permissions.
- `PinDMs` allows to pin DMs.
- `QuickMention` adds a mention button to the message 3-dot menu.
- `ServerDetails` shows server details in the server list tooltip.
- `SplitLargeMessages` allows you to enter larger messages, which will automatically split into
  several smaller messages.
- `StaffTag` adds a crown to server owners (or admins/management).
- `Uncompressed Images` will improve image quality of previews.
