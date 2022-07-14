# SystemD

SystemD is a software suit for system components for Linux systems.
It is mainly used for service configuration.

## Run command on boot

To run a command (in this case `/bin/bash /root/run.sh`) create the following
file at `/etc/systemd/system/` with a name ending on `.service`.
In this case it is called `unturned.service`.

```txt
[Unit]
Description=Description of the service

[Install]
WantedBy=multi-user.target

[Service]
ExecStart=/bin/bash /root/run.sh
Type=simple
```

For [Proxmox](./proxmox.md) you can add the following line under the `[Unit]`
section to make sure the service is started after Proxmox has finished
initializing.

```txt
After=pve-guests.service
```
