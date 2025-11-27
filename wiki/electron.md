# Electron

[Electron](https://electronjs.org/) is an open-source framework that allows developers to build
cross-platform desktop applications using web technologies like JavaScript,
[HTML](/wiki/markup_language.md), and CSS.
It combines the Chromium [browser](/wiki/web_browser.md) and Node.js.

## Troubleshooting

This section will focus on errors and the fixing of errors of /name/.

## Linux: `Could not detect a default secure credential storage on your device.`

A possible issue for Electron apps on [Linux](/wiki/linux.md) is the following error.

```sh 
not detect a default secure credential storage on your device.
```

This occurs because Electron relies on a Secret Service such as the GNOME Keyring, among others) to
store passwords securely on the system.
And often appears on more minimal window managers on [Xorg](/wiki/linux/x_window_system.md) or
[Wayland](/wiki/linux/wayland.md).
If no compatible service is running or detected, apps cannot save credentials.

Using the following steps this issue can be solved.
Firstly - if not already done - install a secret service.
For the Gnome Keyring install the [packages](/wiki/linux/package_manager.md) `libsecret` and
`gnome-keyring`.
The name may differ slightly depending on the [package manager](/wiki/linux/package_manager.md)
used.
Afterwards make sure to run the service and enable it if not already done.
An example for this is shown in the following command

```sh 
eval $(/usr/bin/gnome-keyring-daemon --start)
```

Finally the Electron app `<electron-app>` can be started.
For the secure credential storage to be reachable the environment variable `XDG_CURRENT_DESKTOP`
has to be set.
Due to this environment variable being possibly relevant for the system-wide settings it is
recommended to only set it for the Electron app by running the following command in a sub-shell.

```sh
export XDG_CURRENT_DESKTOP=GNOME
<electron-app>
```
