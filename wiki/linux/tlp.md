# TLP

[TLP](https://linrunner.de/tlp) is a linux command line utility for saving
laptop battery power aswell as optimizing battery life.

## Setup

TLP can be installed on most distributions by installing the `tlp` package.
Afterwards the TLP
[service](/wiki/linux/systemd.md#startstopenabledisable-a-service) needs to be
started and enabled.
In contrast to other
[SystemD services](/wiki/linux/systemd.md#startstopenabledisable-a-service) this
can be done by running `sudo tlp start`.

## Configure Battery Charge Thresholds

There are two battery charge thresholds.
The first is `START_CHARGE_THRESH` this threshold contains the battery charge
level below which charging will begin.
`STOP_CHARGE_TRESH` is the second threshold.
It describes up to which level the battery will be charged.
Battery charge thresholds are used to limit the charging of the battery to
extend the battery life.

Thresholds can be set in the file `/etc/tlp.conf`.
Search and edit the following lines according to your needs.

```txt
START_CHARGE_THRESH_BAT0=75
STOP_CHARGE_THRESH_BAT0=80
```
