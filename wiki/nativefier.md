# Nativefier

[Nativefier](https://github.com/nativefier/nativefier) is an command-line tool to create desktop
apps from websites.
This way a single website can be used as an application in contrast to opening it in a
[browser](/wiki/web_browser.md).
It uses [Electron](https://www.electronjs.org/) which in turn uses
[Chromium](https://www.chromium.org/).

## Setup

Nativefier is available on [GitHub](https://github.com/nativefier/nativefier).
Additionally for some [Linux distributions](/wiki/linux.md#distributions) like
[Arch Linux' AUR](/wiki/linux/package_manager.md#arch-linux-pacman-and-yay) it is available via a
package often called `nodejs-nativefier`.

## Usage

This section addresses various usages of Nativefier.

### Creating an Application from a Website

The following command example creates an Electron desktop application in a folder inside the home
directory.
The app will be named `Mastodon` will be `x64` compatible with a resolution
of `1024`x`768` pixel.
It will create an icon in the systems `tray` and disable the Chromium developer tools
(`disable-dev-tools`).
The website to make into the application will be `https://mastodon.technology`.
Change these values accordingly.

```sh
nativefier --name Mastodon \
--platform linux --arch x64 \
--width 1024 --height 768 \
--tray --disable-dev-tools \
--single-instance https://mastodon.technology
```

By default URLs that are not belonging to the one that is given by `--single-instance` will be
blocked.
There is an unchangeable whitelist.
Single URLs that are not on the whitelist can be excluded and so not be blocked by using the
`--internal-urls` flag.
A complete example using this flag can look like the following.

```sh
nativefier --name Mastodon \
--platform linux --arch x64 \
--width 1024 --height 768 \
--tray --disable-dev-tools \
--internal-urls 'outlook.office365.com/*' \
--single-instance https://mastodon.technology
```

Afterwards if a [Linux](/wiki/linux.md)-based system is used the created app can be added to the
path.
An example for this is the following command which
[links](/wiki/linux/shell.md#symbolic-links-using-ln) the applicatoin to a specifically created
directory.

```sh
ln -s mastodon-linux-x64/mastodon ~/.local/bin/links
```

### Navigating Back and Forward

In a normal [browser](/wiki/web_browser.md) there are buttons to navigate back and forth through
the history of a tab.
On Nativefier this can be achieved by pressing the `Alt`-key and selecting `View` and `Back` - or
`Forward`.
This can also be achieved by pressing `Alt`+`Left Arrow` for going back and `Alt`+`Right Arrow` for
going forwards.

## Troubleshooting

This section focusses on various errors that can appear by using Nativefier.

### `Skia shader compilation error` When Starting an Application

When starting an application that has been set up using nativefier it is possible that the error
`Skia shader compilation error` or a similar error regarding Skia can occur.
An easy way to fix this is by clearing the GPU cache which can be found inside the `~/.config`
directory.
For example a nativefied app named [mtg-companion](/wiki/games/magic%3A_the_gathering.md#resources)
can be found in the directory `~/.config/mtg-companion-nativefier-8fcad7` and its GPU cache inside
the directory named `~/.config/mtg-companion-nativefier-8fcad7/GPUCache`.
The whole directory `GPUCache` can just be moved or removed to clear the cache.
