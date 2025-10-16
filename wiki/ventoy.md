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

This section addresses the usage of Ventoy.

### Adding and Removing Boot Images

The most important steps to use a Ventoy stick is the adding and removal of image files to the
stick.
Unlike the usual flashing that is for example shown in the
[Linux ISO Image entry](/wiki/linux/iso_image.md) `.iso` or other image files can just be moved or
copied to the empty partition of a Ventoy installed USB stick.
Using this partition the image files can also be removed.

## Troubleshooting 

This section will focus on errors and the fixing of errors of ventoy.

### `Error: Verification failed: (0x1A) Security Violation`

This section is based on a
[StackExchange comment by Pablo Bianchi](https://askubuntu.com/questions/1456460/verification-failed-0x1a-security-violation-while-installing-ubuntu).
When the message `Error: Verification failed: (0x1A) Security Violation` is shown after booting the
Ventoy stick it can easily be fixed.
For this press `OK`, then press any key to perform MOK management.
Select `Enroll key from disk`, `VTOYEFI` and `ENROLL_THIS_KEY_IN_MOKMANAGER.cer`.
Afterwards select `Continue`, `Yes` and finally reboot by selecting `Reboot`.
After performing these steps the Ventoy key should work as usual.
