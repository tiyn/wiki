# OpenVPN

[OpenVPN](https://openvpn.net) is a free software to create a VPN via an
encrypted TLS connection.

## Set up

In the following sections the different set ups of OpenVPN usages are described.

### Server

The software can be set up via [Docker](/wiki/docker.md) with the
[kylemanna image](./docker/kylemanna_-_openvpn.md).
Additionally to this a client is needed on the system that need access to the
server software.

### Client

OpenVPN clients can be found for many devices.
For [Android](/wiki/android.md) for example there is
[OpenVPN for Android in the F-Droid store](https://f-droid.org/de/packages/de.blinkt.openvpn/).
For most linux distributions there is a package called `openvpn`.

### Proxy

For OpenVPN a proxy acts as an intermediary between the system communicating
with the proxy and the OpenVPN server.
A proxy can be set up via [Docker](/wiki/docker.md) with the
[jonohill image](./docker/jonohill_-_docker-openvpn-proxy.md).
