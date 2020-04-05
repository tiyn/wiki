# Thinkpad
These are a bunch of useful programs if you own a thinkpad.

| program    | description                                      |
| ---------- | ------------------------------------------------ |
| lm_sensors | utility for hardware monitoring and SMBus access |
| thinkfan   | utility to control fanspeeds                     |

## installation
After installing both lm_sensors and thinkfan activate thinkpad_acpi.

```sudo modprobe thinkpad_acpi```

Then copy and configure the config file.

```sudo cp /usr/share/doc/thinkfan/examples/thinkfan.conf.simple /etc/thinkfan.conf```

Enable it.

```systemctl enable thinkfan```

After that check and if correct enable the thinkfan service.

```sudo thinkfan -n```

```systemctl enable thinkfan.service```
