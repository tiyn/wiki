# Khal

[Khal](https://github.com/pimutils/khal) is a calendar you can use in your
[terminal](/wiki/linux/shell.md).
You can sync it with [vdirsyncer](vdirsyncer.md)

## Setup

On most linux distributions Khal can be installed with the `khal` package.
Alternatively it can be installed via [GitHub](https://github.com/pimutils/khal).

### Configuration

- Edit the `~/.config/khal/config`
  - Insert the following lines

```txt
[calendars]

[[calendars]]
path = ~/.local/share/pim/calendars/*/*
type = discover
```
