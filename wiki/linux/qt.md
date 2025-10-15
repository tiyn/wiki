# Qt

[Qt](https://www.qt.io/) is an application and widget toolkit.

## Setup

On most linux distributions different Qt versions are installed as a dependency of various programs
that use graphical user interfaces.

### Configuration

The configuration can easily be achieved by using the programs
[qt5ct](https://github.com/desktop-app/qt5ct) or [qt6ct](https://github.com/trialuser02/qt6ct)
the latter working with the current version of Qt.
qt5ct is officially archived and qt6ct is the recommended program to use and will mainly be
discussed in this article.
These programs can sometimes be found as [package](/wiki/linux/package_manager.md) of the same
name.
Afterwards `qt6ct` can be run to get a graphical user interface to set the theme and icons of Qt
applications.
This will create or edit a configuration file located at `~/.config/qt6ct/qt6ct.conf`.
To make this config apply for all Qt applications the following line needs to be inserted into the
`~/.profile` file.

```sh
export QT_QPA_PLATFORMTHEME="qt6ct"
```

Afterwards `qt6ct` can be used to enable the dark mode or change other configurations.

#### Achieving a System-Wide Uniform Look

[GTK](/wiki/linux/gtk.md) is the other big widget toolkit in use.
An easy way to achieve a uniform look of GTK and Qt is the usage of the Adwaita theme in both
toolkits.
This is also described in the 
[official Arch wiki](https://wiki.archlinux.org/title/Uniform_look_for_Qt_and_GTK_applications#Styles_for_both_Qt_and_GTK).

A simple way to achieve this in Qt is the installation of
[adwaita-qt6](https://github.com/FedoraQt/adwaita-qt) which is also available as an
[AUR](/wiki/linux/package_manager.md#installing-an-aur-program-with-a-specific-version) package.
After the installation it can be selected by `qt6ct` as described in the
[configuration section](#configuration).

For setting the same theme for GTK refer to the
[corresponding entry](/wiki/linux/gtk.md#achieving-a-system-wide-uniform-look).

## Troubleshooting 

This section will focus on errors and the fixing of errors of Qt.

### Incorrect Configuration: `The libqt6ct.so plugin is compiled against incompatible Qt version`

When updating the system it is possible that the theme will not work correctly anymore.
Often the error `The libqt6ct.so plugin is compiled against incompatible Qt version` is responsible
for this.
To fix it most of the time it is enough to recompile the `qt6ct` package.
Afterwards a reboot might be needed for the theme to be displayed correctly again.

