# Display Managers

Display managers are graphical user interfaces that is displayed after booting.
Usually it also manages the login process before starting the window manager.

## List of Display Managers 

The following display managers are featured in this wiki.

- [LightDM](/wiki/linux/lightdm.md) is a lightweight GUI display manager.
- [Lemurs](/wiki/linux/lemurs.md) is a lightweight TUI display manager.
- [Ly](/wiki/linux/ly.md) is a lightweight display manager with consolue UI.

## Use `xinitrc` as `xsession`

Often a display manager needs a `xsession` to work.
For this `xinit-xsession` needs to be installed which is available on most
[Linux distributions](/wiki/linux.md#distributions) in a package of the same name.
When setting this up there should be no `~/.xsession` available.
If it is please use another setup or backup this file.
Make the `xinitrc` file executable as shown in the following command and link it to the `xsession` 
file.

```sh
chmod +x ~/.xinitrc
ln -s ~/.xsession ~/.xinitrc
```

Afterwards the session will start like the `xinitrc`
