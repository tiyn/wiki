# Netplan

[Netplan](https://netplan.io) is a utility for configuring the networking of a
linux system via YAML files.

## Usage

### Add more IP addresses to a system

In the file `/etc/netplan/50-cloud-init.yaml` create an `addresses:` section
for a device (for example an ethernet device) and list the [IP addresses](/wiki/ip_address.md) you
want to add to the system to it.
It has to be noted, that the added addresses should be outside of the DHCP
range of your router.
An example file will look something like the following lines.
In this case 4 addresses were added.
`192.168.178.18/24` is the IP assigned by the DHCP server.
It has to be noted that this is a special case as the DHCP server assigns this
address always to the system.

```txt
network:
    ethernets:
        ens18:
            dhcp4: true
            addresses:
                - 192.168.178.18/24
                - 192.168.178.201/24
                - 192.168.178.202/24
                - 192.168.178.203/24
                - 192.168.178.204/24
    version: 2
```

Afterwards netplan has to be restarted by running `sudo netplan apply`.
The addresses then are assigned to the system.
