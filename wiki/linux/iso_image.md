# ISO Image

An ISO image is a image of a disk that contains everything that would be written to an optical disc
or disk sector.

## Usage

### Mounting

ISO images can be mounted like [file systems](/wiki/linux/disk-management.md#mounting).
This is done with the following command.

```sh
mount -o loop <path to iso> <path to mount>
```

### Creating an ISO Image from CUE and BIN Files

Given a `.cue` and a `.bin` file an ISO image can be created.
This is done with the utility [bchunk](https://github.com/extramaster/bchunk) as explained by
[J. M. Becker on StackExchange](https://unix.stackexchange.com/questions/29671/how-can-i-convert-a-cue-bin-with-cdr-tracks-image-into-a-single-iso-file).
For this the following command is used.
The file names have to be changed according to the situation.

```sh
bchunk IMAGE.bin IMAGE.cue IMAGE.iso
```

### Linux Boot Stick

Many [Linux distributions](/wiki/linux.md), but also [Windows](/wiki/windows.md) use boot sticks
to install or repair the system.
The [Arch Linux entry](/wiki/linux/arch-linux.md) contains a section on the
[creation of such a stick](/wiki/linux/arch-linux.md#create-installation-medium).
An alternative to this is [Ventoy](/wiki/ventoy.md) which is cross-platform and can contain
multiple `.iso` files at the same time.
