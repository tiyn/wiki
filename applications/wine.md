# Wine

Wine is a compatibility layer to run windows programs on linux machines.

## Setup

### Arch-Linux

- Enable multilib support in pacman
	-	`vim /etc/pacman.conf` - Uncomment the following lines
		```
		[multilib]
		Include = /etc/pacman.d/mirrorlist
		```
- `pacman -S wine winetricks` - Install wine and configuration helper

### Configuration

- Set the global variable `WINEPREFIX` to your liking, standard is `$HOME/.wine`
- `winetricks` - run the installation of basic windows dependencies to the wine directory
- Move the program you want to run to `$WINEPREFIX/drive_c/`
- `winetricks sandbox` - (Optional) if you don't want wine to set up directories or files into your home directory
- `wine $WINEPREFIX/drive_c/<insert program>` - Run the program with wine
