# ZBar

[ZBar](https://github.com/mchehab/zbar) is an open-source barcode reader for [Linux](/wiki/linux.md)
and other operating systems.
It can read QR codes and other barcodes from image files using `zbarimg`.

## Setup

On most [Linux](/wiki/linux.md) distributions ZBar is packaged inside the `zbar` package and can be
installed using the according [package managers](/wiki/linux/package_manager.md)

## Usage

This section addresses the usage of ZBar.

### Read a Barcode

To read a barcode from an image file run the following command.

```sh
zbarimg ticket.png
```

To print only the decoded content without the barcode type use `--raw`.

```sh
zbarimg --raw ticket.png
```
