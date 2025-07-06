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

### Change Suspend and Hibernate Behaviour

The behaviour of suspend and hibernation can be changed in the file `/etc/systemd/sleep.conf`.
One of the most important variables is the one to set the hibernation delay time.
This time will be used to determine the time that is taken from suspend to hibernation if
suspend-to-hibernate is called.
The following line will set this to 10 minutes.

```txt 
HibernateDelaySec=10min
```

### Handle Power Key and Lid Seitch

The management of power keys and lid switches is handled in the file `/etc/systemd/logind.conf`.
The following line will set the behaviour of the power key to hibernate. The default for this would
be to shutdown the system.

```txt
HandlePowerKey=hibernate
```

The same can also be done to determine the action taken when the lid is closed.
By default the closing of the lid will result in suspending the system.
The following lines will change this to suspend-then-hibernate.

```txt
HandleLidSwitch=suspend-then-hibernate
```

For further behaviour of the suspend and hibernate actions check the
[corresponding section](#change-suspend-and-hibernate-behaviour).

## Troubleshooting

This section focusses on errors that correspond to the SystemD software.

### Timed Out Waiting for Device `/dev/tpmrm0`

This error signals problems with the trusted platform module.
This however usually can be fixed easily by masking the service and is done like the following
command shows.

```sh 
systemctl mark dev-tpmrm0.device
```
