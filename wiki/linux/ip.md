# IP

`ip` is a program that can edit and display the configurations of network
interfaces, routing and tunnels.
It is a replacement for the program `ifconfig`.

## Usage

### List all network interfaces

You can list network interfaces by running:

```sh
ip link list
```

### Enable/disable a network interface

Assuming the interface is named `wlan0` run the following:

```sh
ip link set wlan0 up
```

Disabling works accordingly by running:

```sh
ip link set wlan0 down
```

### Get Outside IP Address

For VPN and other applications using a tunnel it can be useful to check the
outside [IP address](/wiki/ip_address.md) of your system.
The following command uses the `dig` command.
It is either bundled in the `dig` package - like in
[Arch Linux](/wiki/linux/arch-linux.md) - or in the `dnsutils`
package - like in Ubuntu - or even another package depending on the distribution
used.
After installation the following command can be used to get the outside IP
address of your system.

```sh
dig +short txt ch whoami.cloudflare @1.0.0.1
```

There is an alternative to this using `wget`.
It uses a call to DuckDuckGo and requests the outside IP from there.
The mentioned command is the following.

```sh
wget -qqO- 'https://duckduckgo.com/?q=what+is+my+ip' | grep -Pow 'Your IP address is \K[0-9.]+'
```
