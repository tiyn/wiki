# Ly

[Ly](https://github.com/fairyglade) is a lightweight console UI
[display manager](/wiki/linux/display_managers.md).

## Setup

On most linux distributions Ly can be installed with the `ly` package.

This setup needs an executable `~/.xinitrc` file.
If you are not sure about it, use the tests provided in the penultimate step.

Before finishing the setup the functionality should be tested.
This can be done by using one or both of the following commands. 

```sh 
systemctl start ly.service
```

Finally the [SystemD](/wiki/linux/systemd.md) Ly service needs to be enabled and reboot the
system.

```sh 
systemctl enable ly.service`
reboot
```
