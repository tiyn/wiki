# VPN

A VPN is a virtual private network.
It uses a secure connection between a computer and a network or two networks.
It can be used to display another IP address but does not make tracking or
fingerprinting of the device impossible.
VPNs feature a server and a client side.

## OpenVPN

[OpenVPN](https://openvpn.net) is a free software to create a VPN via an
encrypted TLS connection.

### Set up

In the following sections the different set ups of OpenVPN usages are described.

#### Server

The software can be set up via [Docker](/wiki/docker.md) with the
[kylemanna image](./docker-images/kylemanna_-_openvpn.md).
Additionally to this a client is needed on the system that need access to the
server software.

#### Client

OpenVPN clients can be found for many devices.
For Android for example there is
[OpenVPN for Android in the F-Droid store](https://f-droid.org/de/packages/de.blinkt.openvpn/).
For most linux distributions there is a package called `openvpn`.

#### Proxy

For OpenVPN a proxy acts as an imntermediary between the system communicating
with the proxy and the OpenVPN server.
A proxy can be set up via [Docker](/wiki/docker.md) with the
[jonohill image](./docker-images/jonohill_-_docker-openvpn-proxy.md).
