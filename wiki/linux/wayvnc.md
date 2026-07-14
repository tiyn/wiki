# wayvnc

[wayvnc](https://github.com/any1/wayvnc) is a VNC server for [Linux](/wiki/linux.md) systems using
[Waylands](/wiki/linux/wayland.md) compositors using wlroots.
To use wayvnc the client has to be able to reach the server either directly or through an 
[SSH tunnel](/wiki/linux/openssh.md#port-tunneling).
It is the default VNC server used on modern [Raspberry Pi OS](/wiki/linux/raspberry_pi.md)
installations.

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

### Binding to an IP Address

By default, wayvnc is reachable on the IP address it is bound to.
Usually this is `0.0.0.0` and makes the VNC server on all network interfaces.

However, binding to `127.0.0.1` exposes the VNC server only on the loopback interface of
[SSH tunnels](/wiki/linux/openssh.md).
This may be useful when using [VNC over SSH](/wiki/vnc.md#vnc-over-ssh).

When using a systemd user service (for example
`~/.config/systemd/user/wayvnc.service`), the same can be achieved by changing
the `ExecStart` line to

```ini
ExecStart=/usr/bin/wayvnc 127.0.0.1
```

The server can then be accessed remotely using
[VNC over SSH](/wiki/vnc.md#vnc-over-ssh).
