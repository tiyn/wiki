# Grayjay

[Grayjay](https://grayjay.app/) is a cross-platform video for [Android](/wiki/android.md),
[Linux](/wiki/linux.md), macOS and [Windows](/wiki/windows.md) frontend for various platforms like
[YouTube](/wiki/youtube.md) that supports peer-to-peer synchronization of subscriptions, playlists
and watch history between devices.

## Setup

Grayjay is available for [Android](/wiki/android.md), [Linux](/wiki/linux.md), macOS and
[Windows](/wiki/windows.md) and can be downloaded from the
[official website](https://grayjay.app/desktop/).
On Linux it is often bundled in a package called `grayjay`.
It is also available via [Flathub](https://flathub.org/apps/app.grayjay.Grayjay).

## Troubleshooting

This section will focus on errors and the fixing of errors of Grayjay.

### `Permission denied` When Starting on Linux

When starting Grayjay on Linux, the application may fail with the following error.

```txt
System.ComponentModel.Win32Exception (13): Permission denied
```

If the error references `~/.local/share/grayjay/cef/justcefnative`, the Chromium-based interface
component cannot be executed, possibly because its executable permission is missing.
This can be fixed with the following command.

```sh
chmod u+x ~/.local/share/grayjay/cef/justcefnative
```

If the problem persists, check the file permissions and whether the filesystem is mounted with
`noexec`.
