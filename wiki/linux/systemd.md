# SystemD

SystemD is an [init system](./init.md) for Linux systems.
It is used for service configuration and startup.

## Usage

### Run Command on Boot

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

Such a service can be started by running:

```sh
sudo systemctl start unturned
```

Alternatively it can be enabled to start at every boot by running:

```sh
sudo systemctl enable unturned
```

### Start/Stop/Enable/Disable a service and Retrieve its Logs

Services can be started by running `systemctl start <service-name>`.
They respectively can be stopped by replacing the `start`
keyword for `stop`.
To start the service after boot it has to be enabled.
This works accordingly with the keyword `enable`.
The `disable` keyword stops the service from starting automatically.

Logs of the last start of the service can be found by running `systemctl status <service-name>`. 

### Retrieving the SystemD Logs

SystemD logs can easily be found using the `journalctl` command.
One of the most notable usages of the command is for checking the logs of the previous boot.
This can be achieved by running the following command.

```sh
journalctl -b-1
```
