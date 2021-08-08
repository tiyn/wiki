# IP

`ip` is a program that can edit and display the configurations of network
interfaces, routing and tunnels.
It is a replacement for the program `ifconfig`.

## List all network interfaces

You can list network interfaces by running:

```shell
ip link list
```

## Enable/disable a network interface

Assuming the interface is named `wlan0` run the following:

```shell
ip link set wlan0 up
```

Disabling works accordingly by running:

```shell
ip link set wlan0 down
```
