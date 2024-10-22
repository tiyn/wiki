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
