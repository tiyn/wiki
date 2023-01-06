# Wine

[Wine](https://www.winehq.org/) is a compatibility layer to run windows
programs on linux machines.

## Setup

Wine can be installed on most distributions by acquiring the `wine` package.
The `winetricks` package also is recommended.
Alternatively it can be downloaded from
[the official website](https://www.winehq.org/).

## Usage

### Run a windows program

- Set the global variable `WINEPREFIX` to your liking, standard is `$HOME/.wine`
- `winetricks` - run the installation of basic windows dependencies to the wine
  directory
- Move the program you want to run to `$WINEPREFIX/drive_c/`
- `winetricks sandbox` - (Optional) if you don't want wine to set up directories
or files into your home directory
- `wine $WINEPREFIX/drive_c/<insert program>` - Run the program with wine
