# LibreOffice

[LibreOffice](https://libreoffice.org/) is a free and open-source office suite for Windows and
Linux-based systems.

## Setup

The LibreOffice program can be installed from source as described
[on the official website](https://www.libreoffice.org/about-us/source-code/).
Alternatively many [Linux](/wiki/linux.md) [package managers](/wiki/linux/package_manager.md) 
package LibreOffice in the `libreoffice`.

## Usage

This section addresses the usage of LibreOffice.

### Enable/Disable Dark Mode 

To set the dark mode open `Settings` by the `Tools` tab, select `LibreOffice` and `Appearance` and
select the correct theme for `LibreOffice Themes`.
Sometimes - especially on [Linux systems](/wiki/linux.md) using [Wayland](/wiki/linux/wayland.md) -
the automatic recognition may not work and the theme has to be set manually.

## Troubleshooting 

This section will focus on errors and the fixing of errors of /name/.

### LibreOffice Not Showing Up on First Start

When first starting LibreOffice may appear not to start.
This is because problems with hardware acceleration can occur on some systems.
It can starting the software in safe mode, navigate to the `Settings` by the `Tools` tab.
Then select `LibreOffice` and `View` and remove the check in `Use hardware acceleration`.
Afterwards LibreOffice can be closed and reopened without selecting the safe mode.
