# IP

`ip` is a program that can edit and display the configurations of network
interfaces, routing and tunnels.
It is a replacement for the program `ifconfig`.

## List all network interfaces

You can list network interfaces by running:

```sh
ip link list
```

## Enable/disable a network interface

Assuming the interface is named `wlan0` run the following:

```sh
ip link set wlan0 up
```

Disabling works accordingly by running:

```sh
ip link set wlan0 down
```
