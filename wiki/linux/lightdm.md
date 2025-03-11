# LightDM

[LightDM](https://github.com/canonical/lightdm/) is a lightweight GUI
[display manager](/wiki/linux/display_managers.md).
It is available for both [X](/wiki/linux/x_window_system.md) and Wayland.

## Setup

On most linux distributions LightDM can be installed with the `lightdm` package.
Additionally `lightdm-gtk-greeter` and `xorg-server-xephyr` are recommended.

This setup needs an `xsession`.
An alternative to this is using `xinitrc` as an `xsession`.
The process of this is desribed in the
[display manager entry](/wiki/linux/display_managers.md#use-xinitrc-as-xsession).
Make sure to have a working `xsession` or `xinitrc`.
If you are not sure about it, use the tests provided in the penultimate step.

Then edit the config file `~/.dmrc` and edit the file to the following contents.

```txt 
[Desktop]
Session=xinitrc
```

Before finishing the setup the functionality should be tested.
This can be done by using one or both of the following commands. 

```sh 
lightdm --test-mode --debug
systemctl start lightdm.service
```

Finally the [SystemD](/wiki/linux/systemd.md) lightdm service needs to be enabled and reboot the
system.

```sh 
systemctl enable lightdm.service`
reboot
```
