# VNC

VNC – short for Virtual Network Computing – is a software used for sharing the
desktop of a system.
It is based on the Remote Frame Buffer protocoll which is also named RFB.

VNC is especially used for accessing graphical applications or
[terminals](/wiki/linux/system_console.md) of a remote server,
[dockerized](/wiki/docker.md#containerize-a-graphical-application) or virtualized
program.

## VNC Clients

The following is a list of VNC clients.

- [AVNC](https://github.com/gujjwal00/avnc) is a VNC client for [Android](/wiki/android.md)
  devices.
- TigerVNC is a VNC client for [Linux](/wiki/linux.md).
    It is generally started using `vncviewer`.
- Vinagre is a VNC client for [Linux](/wiki/linux.md).
    It is, however, a bit older, not well maintained and does not support password authentication.
    Therefor, it is not recommended.

## VNC Server

The following is a list of VNC server.

- [wayvnc](/wiki/linux/wayvnc.md) is a VNC server for [Linux](/wiki/linux.md) systems and the
    standard VNC program that is used by new [Raspberry Pis](/wiki/linux/raspberry_pi.md).
    It is generally started via [systemd](/wiki/linux/systemd.md).

## VNC over SSH

Instead of exposing a VNC server to the network it can be accessed through an
[SSH tunnel](/wiki/linux/openssh.md#port-tunneling).

It is recommended to bind the VNC server only to `127.0.0.1` (for example as explained in the
[wayvnc article](/wiki/linux/wayvnc.md#binding-to-an-ip-address)).
This ensures that the VNC server is only accessible through the SSH tunnel.

Assuming now the VNC server is bound to `127.0.0.1:5900`, a tunnel can be created from the local
machine to the remote host, making the VNC server available on a local port such as
`localhost:5901`.

This setup keeps the VNC server inaccessible from the network while all VNC traffic is encrypted by
SSH.
It may also be useful to avoid program-specific VNC authentication, which may limit the
compatibility of [VNC clients](#vnc-clients).
