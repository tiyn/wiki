# Ventoy

[Ventoy](https://www.ventoy.net/en/index.html) is an open-source tool to create a bootable USB
stick.
Ventoy enables the stick to contain multiple image files at once and easily add and remove it from
the stick.

## Setup

For [Windows](/wiki/windows.md) the easiest way to install Ventoy to an USB stick is to navigate to 
the [Ventoys download page](https://www.ventoy.net/en/download.html).
On there download the file named similarly to `ventoy-...-windows.zip`.
After unzipping it an executable is contained that can install Ventoy to a USB stick.

For most [Linux distributions](/wiki/linux.md) Ventoy contained in a package named `ventoy` or
`ventoy-bin`.
Using it Ventoy can be installed to a USB stick with a command like the following.
In this example the USB stick to install to is listed under `/dev/sdg`.

```sh 
ventoy -i /dev/sdg
```

## Usage

The most important steps to use a Ventoy stick is the adding and removal of image files to the
stick.
Unlike the usual flashing that is for example shown in the
[Linux ISO Image entry](/wiki/linux/iso_image.md) `.iso` or other image files can just be moved or
copied to the empty partition of a Ventoy installed USB stick.
Using this partition the image files can also be removed.
