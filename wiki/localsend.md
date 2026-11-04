# LocalSend

[LocalSend](https://localsend.org/) is a free and open-source application for
[transferring files](/wiki/file-synchronization.md) and text directly between nearby devices over a
local network.
It is available for [Android](/wiki/android.md), iOS, [Linux](/wiki/linux.md), macOS and
[Windows](/wiki/windows.md).
Transfers are encrypted using HTTPS and do not require an account, cloud service or internet
connection.
Unlike [Syncthing](/wiki/syncthing.md), LocalSend is designed for one-time file transfers rather
than continuous file synchronization.
For LocalSend to work, both devices mus communicate over the same network (Wi-Fi or Ethernet).

## Setup

Localsend needs to be installed on both the sending as well as the receiving.

For Android, LocalSend is available on [F-Droid](/wiki/android/f-droid.md) in a package called
[org.localsend.localsend_app](https://f-droid.org/packages/org.localsend.localsend_app/).
For [Linux](/wiki/linux.md), [Windows](/wiki/windows.md) and macOS, download the application from
the [official download page](https://localsend.org/download).

On Linux, LocalSend is also available from
[Flathub](https://flathub.org/apps/org.localsend.localsend_app) and
[package managers](/wiki/linux/package_manager.md)

## Usage

This section addresses the usage of LocalSend.

### Sending Files

First, open LocalSend on both devices.
On the sending device, select **Send**, choose files or text, and select the receiving device.
Finally, accept the transfer on the receiving device
Received files are then saved to the home directory by default.
However, this can be changed in the settings.
