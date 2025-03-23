# GTK

[GTK](https://gtk.org) is an GUI and widget toolkit.

## Setup

On most linux distributions different GTK versions are installed as a dependency of various
programs that use graphical user interfaces.

### Configurations

GTK has different versions.
For GTK3 and GTK4 configurations can be achieved by creating the file `settings.ini` in the folders
`~/.config/gtk-3.0` and `~/.config/gtk-4.0`.
An example file that enables dark mode, uses the Adwaita theme and sets the default font to
sans-serif of size 12 looks something like the following.

```txt 
[Settings]
gtk-application-prefer-dark-theme = true
gtk-icon-theme-name = Adwaita
gtk-font-name = Sans 12
```

For GTK2 an older version of config files has to be used.
The file can be found or created at `~/.config/gtk-2.0/gtkrc-2.0`.
A similar setup to the previous configuration of GTK3 and GTK4 can be achieved by the following.

```txt 
gtk-theme-name="AdwaitaDark"
gtk-font-name="Sans 12"
```

#### Achieving a System-Wide Uniform Look

[Qt](/wiki/linux/qt.md) is the other big widget toolkit in use.
An easy way to achieve a uniform look of GTK and Qt is the usage of the Adwaita theme in both
toolkits.
This is also described in the
[official Arch wiki](https://wiki.archlinux.org/title/Uniform_look_for_Qt_and_GTK_applications#Styles_for_both_Qt_and_GTK).

Since it is the default theme on GTK it just has to be set inside as described in the 
[configuration section](#configuration).

For setting the same theme for Qt refer to the
[corresponding entry](/wiki/linux/qt.md#achieving-a-system-wide-uniform-look).
