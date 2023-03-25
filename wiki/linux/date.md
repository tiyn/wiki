# Date

`date` is a program to show and edit the date and time of a system.
To change the hardware clock look at the [according article](./hwclock.md)

## Display time and date

To change the time and date run the following command:

```sh
date
```

## Change the date and time

To change the date run the following command with an adjusted value for the
date:

```sh
date +%Y%m%d -s "20210809"
```

To change the time run the following command with an adjusted value for the
date:

```sh
date +%T -s "18:49:42"
```

After that you can check if the time is correct by displaying it.

## Set timezone

To set your timezone run the following command with the accordingly selected
file for your location:

```sh
cp /usr/share/zoneinfo/Europe/Berlin /etc/localtime
```
