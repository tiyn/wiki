# NVidia

NVidia is a vendor for graphics cards.

## Setup NVidia GPU

### Arch Linux

For NVidia GPUs to work install the `nvidia` and the `nvidia-utils` package.
If you want to easily configure the monitors as described in a later section of
this file you can also install `nvidia-settings`.

There is no initial setup in for of a `xorg.conf` in `/etc/X11` needed
(except for a multiple GPU/APU setup).

## Change monitor configuration

After running `sudo nvidia-setting` can drag and drop the monitors to your
liking.
After that you have to save the configuration to the `/etc/X11/xorg.conf`.

## Avoid screen tearing

To avoid screen tearing open up `nvidia-settings` and under
`X Server Display Configuration` select your display.
Then click on `Advanced` and select either `Force Composition Timeline` or
`Force Full Composition Timeline`.
