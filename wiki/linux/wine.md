# WINE

[WINE](https://www.winehq.org/) is a compatibility layer to run windows
programs on Linux machines.

## Setup

WINE can be installed on most distributions by acquiring the `wine` package.
The `winetricks` package also is recommended.
Alternatively it can be downloaded from
[the official website](https://www.winehq.org/).

## Usage

### Run a windows program

- Set the global variable `WINEPREFIX` to your liking, standard is `$HOME/.wine`
- `winetricks` - run the installation of basic windows dependencies to the wine
  directory
- Move the program you want to run to `$WINEPREFIX/drive_c/`
- `winetricks sandbox` - (Optional) if you don't want WINE to set up directories
or files into your home directory
- `wine $WINEPREFIX/drive_c/<insert program>` - Run the program with WINE

### Games and management/configuration of them

WINE is able to run many Windows games.
An easy way to create WINE prefixes for different games and managing the
installations of them is [Lutris](/wiki/game/lutris.md).
