# swayidle

swayidle is an idle manager for [Wayland](/wiki/linux/wayland.md).

## Setup

On most Linux distributions swayidle can be installed with the `swayidle` package.

## Usage

To run swayidle it has to be called - preferably after the boot process.
An example of this will look like the following.
This will [suspend-then-hibernate](/wiki/linux/systemd.md#change-suspend-and-hibernate-behaviour)
the system after 30 seconds.
Additionally a program [xss-lock](/wiki/linux/xss-lock.md) has to be used to let swayidle know to
use a specific lock command.

```sh
#!/bin/sh

exec swayidle -w \
         timeout 30 'systemctl suspend-then-hibernate'
```
