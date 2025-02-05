# Display Control

Display control describes the process of controlling the display with means other than the hardware
buttons.

## DDC

DDC - short for Display Data Channel - is a specific way to control the display.
On [Linux](/wiki/linux.md)-based Systems this can be achieved by using the
[`ddcutil`](https://github.com/rockowitz/ddcutil) command line interface that can be found in the
package of the same name.
For a graphical user interface [`ddcui`](https://github.com/rockowitz/ddcui) can be used.
After installation it is possible that the system needs to be restarted due to the i2c-dev kernel
module.
