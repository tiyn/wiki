# Intel Graphics

## Screen Tearing

Linux can sometimes have problems with screen tearing.
To get this working you need to change the `/etc/X11/xorg.conf.d/20-intel.conf` to:

```
Section "Device"
    Identifier "Intel Graphics"
    Driver "intel"
    Option "TearFree" "true"
EndSection
```
This was found on [maketecheasier](https://www.maketecheasier.com/get-rid-screen-tearing-linux).
