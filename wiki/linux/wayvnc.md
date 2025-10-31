# wayvnc

[wayvnc](https://github.com/any1/wayvnc) is a VNC server for [Linux](/wiki/linux.md) systems using
[Waylands](/wiki/linux/wayland.md) compositors using wlroots.
To use wayvnc the system with the server has to be on the same network as the client.
This is also explained in the [screen sharing entry](/wiki/screen-sharing.md).

## Setup

Many [Linux](/wiki/linux.md) [package managers](/wiki/linux/package_manager.md) 
package wayvnc in the `wayvnc` package.

## Usage

This section addresses the usage of wayvnc.

### Starting and Running 

The following command can be used to start the server.
`<ip>` describes the IPs the server can be reached by (for example `0.0.0.0`) and `<screen>` is a
placeholder for the screen that will be shared (for example `HDMI-A-1`).
The name of the screen can be retrieved by using
[wlroots](/wiki/linux/wayland.md#display-wlroots-screens).

```sh
wayvnc <ip> --output=<screen> --render-cursor
```
