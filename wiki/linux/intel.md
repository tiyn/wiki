# Intel

[Intel](https://www.intel.de/content/www/de/de/homepage.html) is a vendor and
manufacturer of semiconductor chips.
They provide motherboard chips, network interface controllers, flash memory,
[graphics chips](#intel-graphics) and more.

## Intel Graphics

Intel graphics is the name for various intel made integrated graphics
processors.

### Usage

#### Screen Tearing

Linux systems that use intel graphics can sometimes have problems with screen
tearing.
To get this working you need to change the `/etc/X11/xorg.conf.d/20-intel.conf`
as explained on
[maketecheasier](https://www.maketecheasier.com/get-rid-screen-tearing-linux)
to:

```txt
Section "Device"
    Identifier "Intel Graphics"
    Driver "intel"
    Option "TearFree" "true"
EndSection
```

