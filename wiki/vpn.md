# VPN

A VPN is a virtual private network.
It uses a secure connection between a computer and a network or two networks.
It can be used to display another IP address but does not make tracking or
fingerprinting of the device impossible.
VPNs feature a server and a client side.

## OpenVPN

[OpenVPN](https://openvpn.net) is a free software to create a VPN via an
encrypted TLS connection.

### Set up (OVPN)

In the following sections the different set ups of OpenVPN usages are described.

#### Server (OVPN)

The software can be set up via [Docker](/wiki/docker.md) with the
[kylemanna image](./docker-images/kylemanna_-_openvpn.md).
Additionally to this a client is needed on the system that need access to the
server software.

#### Client (OVPN)

OpenVPN clients can be found for many devices.
For Android for example there is
[OpenVPN for Android in the F-Droid store](https://f-droid.org/de/packages/de.blinkt.openvpn/).
For most linux distributions there is a package called `openvpn`.

#### Proxy (OVPN)

For OpenVPN a proxy acts as an imntermediary between the system communicating
with the proxy and the OpenVPN server.
A proxy can be set up via [Docker](/wiki/docker.md) with the
[jonohill image](./docker-images/jonohill_-_docker-openvpn-proxy.md).

## WireGuard

[WireGuard](https://www.wireguard.com/) is a free and open-source software that
implements encrypted VPNs.
It was designed to be especially fast and secure.

### Setup (WG)

In the following sections the different set ups of WireGuard usages are described.

#### Server (WG)

The software can be set up via [Docker](/wiki/docker.md) with the
[linuxserver image](/wiki/docker-images/linuxserver_-_wireguard.md).
Additionally to this a [client](#client-wg) is needed on the system that
accesses the server.

#### Client (WG)

WireGuard clients can be found for many devices.
For Android for example there is
[Wireguard for Android in the F-Droid store](https://f-droid.org/de/packages/com.wireguard.android/).
For most linux distributions there is a package called `wireguard-tools`.

### Usage (WG)

Wireguard clients connect to servers by using a `.conf` file.
For mobile devices often times a QR-code can also be used.

In Linux based operating systems the `.conf` can be placed at
the path `/etc/wireguard/wg0.conf`.
Afterwards wireguard can be started and stopped by running the following
commands.

```
wg-quick up wg0
wg-quick down wg0
```

When using multiple `.conf` files the number behind `wg` can be incremented.
When starting and stopping wireguard with `wg-quick` the corresponding number
should be used.
Alternatively also other names not including `wg` can be used.
The term `wg0` the incremented version of it has to be changed accordingly then.
