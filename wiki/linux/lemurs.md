# Lemurs

[Lemurs](https://github.com/coastalwhite/lemurs) is a lightweight TUI
[display manager](/wiki/linux/display_managers.md).
It is available for both [X](/wiki/linux/x_window_system.md) and Wayland.

## Setup

On most [Linux](/wiki/linux.md) distributions LightDM can be installed with the `lemurs` package.

This setup needs a `xsession`.
An alternative to this is using `xinitrc` as a `xsession`.
The process of this is described in the
[display manager entry](/wiki/linux/display_managers.md#use-xinitrc-as-xsession).
Make sure to have a working `xsession` or `xinitrc`.
If you are not sure about it, use the tests provided in the penultimate step.

Before finishing the setup the functionality should be tested.
This can be done by using one or both of the following commands.

```sh
systemctl start lemurs.service
```

Finally, the [systemd](/wiki/linux/systemd.md) `lightdm` service needs to be enabled and reboot the
system.

```sh
systemctl enable lemurs.service`
reboot
```
