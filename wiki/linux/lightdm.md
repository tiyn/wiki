# LightDM

[LightDM](https://github.com/canonical/lightdm/) is a lightweight GUI
[display manager](/wiki/linux/display_managers.md).
It is available for both [X](/wiki/linux/x_window_system.md) and Wayland.

## Setup

On most linux distributions LightDM can be installed with the `lightdm` package.
Additionally `lightdm-gtk-greeter` and `xorg-server-xephyr` are recommended.
This setup will work with [LightDM-GTK-Greeter](#lightdm-gtk-greeter) which is the default greeter. 
If another greeter is to be chosen `lightdm-gtk-greeter` does not have to be installed, but an
alternative for it.
For a guide on how to set the greeter navigate to the [greeter section](#greeters).
This section will also discuss various other greeters like the
[LightDM-Mini-Greeter](#lightdm-mini-greeter).

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

## Greeters

LightDM features the option to choose between many different greeters.
This section focusses on various greeters.

The greeter can be set with the option `greeter-session` under the section `[Seat:*]` in the file 
`/etc/lightdm/lightdm.conf`.
This will look similar to the following line.

```txt 
[Seat:*]

greeter-session=lightdm-mini-greeter
```

If no `greeter-session` is set the default will fall back to the
[LightDM-GTK-Greeter](#lightdm-gtk-greeter).

### LightDM-GTK-Greeter

The [LightDM-GTK-Greeter](https://github.com/Xubuntu/lightdm-gtk-greeter) is the default greeter 
for LightDM.
This is the default [greeter](#greeters) of [GTK](/wiki/linux/gtk.md) but others may be chosen.

### LightDM-Mini-Greeter

[LightDM-Mini-Greeter](https://github.com/prikhi/lightdm-mini-greeter) is a minimal, single-user
greeter.

For the LightDM-Mini-Greeter to work correctly some settings have to be set in the file
`/etc/lightdm/lightdm-mini-greeter.conf`.
The following lines show an example of this file.
The most important changes have been done to set the `user` under `[greeter]` 
and `background-image` under `[greeter-theme]`.
The background image path can vary, but lightdm has to be able to access the 
image.

```txt
# LightDM Mini Greeter Configuration
#
# To test your configuration out, run: lightdm --test-mode

[greeter]
# The user to login as.
user = user
# Whether to show the password input's label.
show-password-label = true
# The text of the password input's label.
password-label-text = Password:
# The text shown when an invalid password is entered. May be blank.
invalid-password-text = Invalid Password
# Show a blinking cursor in the password input.
show-input-cursor = true
# The text alignment for the password input. Possible values are:
# "left", "center", or "right"
password-alignment = left
# The number of characters that should fit into the password input.
# A value of -1 will use GTK's default width.
# Note: The entered width is a suggestion, GTK may render a narrower input.
password-input-width = -1
# Show the background image on all monitors or just the primary monitor.
show-image-on-all-monitors = false


[greeter-hotkeys]
# The modifier key used to trigger hotkeys. Possible values are:
# "alt", "control" or "meta"
# meta is also known as the "Windows"/"Super" key
mod-key = meta
# Power management shortcuts (single-key, case-sensitive)
shutdown-key = s
restart-key = r
hibernate-key = h
suspend-key = u


[greeter-theme]
# A color from X11's `rgb.txt` file, a quoted hex string(`"#rrggbb"`) or a
# RGB color(`rgb(r,g,b)`) are all acceptable formats.

# The font to use for all text
font = "Sans"
# The font size to use for all text
font-size = 1em
# The font weight to use for all text
font-weight = bold
# The font style to use for all text
font-style = normal
# The default text color
text-color = "#eeeeee"
# The color of the error text
error-color = "#F8F8F0"
# An absolute path to an optional background image.
# The image will be displayed centered & unscaled.
# Note: The file should be somewhere that LightDM has permissions to read
#       (e.g., /etc/lightdm/).
background-image = "/etc/lightdm/background.jpg"
# The screen's background color.
background-color = "#0e0f14"
# The password window's background color
window-color = "#282828"
# The color of the password window's border
border-color = "#555a63"
# The width of the password window's border.
# A trailing `px` is required.
border-width = 2px
# The pixels of empty space around the password input.
# Do not include a trailing `px`.
layout-space = 15
# The character used to mask your password. Possible values are:
# "-1", "0", or a single unicode character(including emojis)
# A value of -1 uses the default bullet & 0 displays no characters when you
# type your password.
password-character = -1
# The color of the text in the password input.
password-color = "#eeeeee"
# The background color of the password input.
password-background-color = "#282828"
# The color of the password input's border.
# Falls back to `border-color` if missing.
password-border-color = "#282828"
# The width of the password input's border.
# Falls back to `border-width` if missing.
password-border-width = 2px
# The border radius of the password input.
password-border-radius = 0.341125em
```
