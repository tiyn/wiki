# NVidia

NVidia is a vendor for graphics cards.

## Setup

For NVidia GPUs to work install the `nvidia` and the `nvidia-utils` package.
If you want to easily configure the monitors as described in a later section of
this file you can also install `nvidia-settings`.

There is no initial setup in for of a `xorg.conf` in `/etc/X11` needed
(except for a multiple GPU/APU setup).

### Configuration

A basic configuration can be achieved by running `nvidia-xconfig`.

## Usage

Most configuration and changes require the use of `nvidia-settings`.

### Change monitor configuration

In `nvidia-setting` monitors can be dragged and dropped to your liking.
After that you have to save the configuration to the
[X window manager](./x_window_system.md) configuration file
`/etc/X11/xorg.conf`.

### Avoid screen tearing

In `nvidia-settings` under
`X Server Display Configuration` select your display and click on `Advanced`
and select either `Force Composition Timeline` or
`Force Full Composition Timeline`.
