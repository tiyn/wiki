# Khal

`khal` is a calendar you can use in your terminal.
You can sync it with [vdirsyncer](vdirsyncer.md)

## Setup

### Arch-Linux

- `pacman -S khal` - Install needed packages

### Configuration

- Edit the `~/.config/khal/config`
  - Insert the following lines

```txt
[calendars]

[[calendars]]
path = ~/.local/share/pim/calendars/*/*
type = discover
```
