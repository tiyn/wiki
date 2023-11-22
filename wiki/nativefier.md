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
