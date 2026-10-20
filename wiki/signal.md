# Signal

[Signal](https://signal.org) is an encrypted, open-source messenger that allows voice and video
calls as well as instant messaging chats.
The desktop client comes in the form of an [Electron-based app](/wiki/electron.md).

## Usage

This section addresses various features of Signal.

### Linking Multiple Devices

Signal allows multiple devices to use the same account by linking them to a primary smartphone.
Up to five additional devices can be linked without registering a separate phone number.
These include [Signal Desktop](https://signal.org/download), iPads, iPhones and
[Android](/wiki/android.md) smartphones or tablets.
Messages sent and received are synchronized between the devices.

Previously, the official Signal applications only allowed one registered smartphone per account,
while additional computers and iPads could be linked.
Using the same account on another Android smartphone required an alternative
[client](#clients-and-utilities), which supported linking Android devices before the official Signal
app did.
Since an [update in August 2026](https://signal.org/blog/linked-devices-and-android-tablets/),
the official Signal applications also support additional Android smartphones, tablets and iPhones
as linked devices.
Please note that registering the same phone number on a second phone instead of linking it will
still deactivate the previous primary device.

To link another device, install the Signal application on it.
For [Android](/wiki/android.md) and iOS devices this will be the
[official Signal app](#clients-and-utilities).
For [Linux](/wiki/linux.md) it is [Signal Desktop](#clients-and-utilities).
Afterwards follow on-screen instructions.

When transferring the message history, all existing chats and the last 45 days of saved media
can be copied to the new device with end-to-end encryption.
If the history is not transferred, only new messages will be available there.

The primary smartphone must connect to the internet at least once every 30 days to keep its
linked devices active.
Linked devices are also unlinked after 45 days of inactivity.
For further information see the [Signal support article on linked devices](https://support.signal.org/hc/en-us/articles/360007320551-Linked-Devices).

### Clients and Utilities

The following is a list of clients and other utilities that can be used to communicate via Signal,
export or backup messages.

- [Signal App](https://signal.org/download) is a mobile application available for
  [Android](/wiki/android.md) or iOS.
- [Signal Desktop](https://signal.org/download) is a desktop application available for
  [Windows](/wiki/windows.md), various [Linux distributions](/wiki/linux.md#distributions) and
  macOS.
- [sigtop](https://github.com/tbvdm/sigtop) is a [Linux](/wiki/linux.md) utility that allows
  exporting messages and attachments by communicating with a Signal Desktop instance on the same
  device.
- [Molly IM](https://github.com/mollyim/mollyim-android) is a security-focused fork of Signal for
  [Android](/wiki/android.md).
  Molly nowadays lost most of its purpose after the
  [change in linking devices](#linking-multiple-devices) in August 2026.
