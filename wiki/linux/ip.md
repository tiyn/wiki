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

### Get Outside IP

For VPN and other applications using a tunnel it can be useful to check the
outside IP of your system.
Together with `awk` only the outside IP address can be displayed.
This is done with the command `ip route get 1.2.3.4 | awk '{print $7}'`.
Alternatively it can be done without `awk` by simply running the command
`ip route get 1.2.3.4` and checking for the seventh column.
