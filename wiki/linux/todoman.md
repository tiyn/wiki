# Todoman

[todoman](https://github.com/pimutils/todoman) is a todolist you can use in your
[terminal](/wiki/system_console.md).
You can sync it using [vdirsyncer](vdirsyncer.md)

## Setup

Todoman can be installed via the
[github page](https://github.com/pimutils/todoman).
Some distributions also feature the `todoman` package.

### Configuration

- Edit the `~/.config/todoman/config.py`
  - Insert the following lines

```txt
#[main]
path = "~/.local/share/pim/calendars/*/*"
date_format = "%d.%m.%Y"
time_format = "%H:%M"
default_list = "personal"
```

Replace `personal` with your choice of primary list and
`~/.local/share/pim/calendars/*/*` with the path to your calendars.
