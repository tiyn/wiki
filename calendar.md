# Calendar
To use a terminal calendar the following programs are needed.

| programm   | description             |
| ---------- | ----------------------- |
| khal       | terminal calendar       |
| vdirsyncer | sync tool for calendars |

## Installation and configuration
To configure vdirsyncer edit a file in ```~/.config/vdirsyncer/config```.

```
[general]
status_path = "~/.cache/vdirsyncer/status"

#calendar
[pair private_calendar]
a = "private_calendar_local"
b = "private_calendar_remote"
collections = ["from a", "from b"]
metadata = ["color"]

[storage private_calendar_local]
type = "filesystem"
path = "~/.local/share/pim/calendars/private_calendar"
fileext = ".ics"

[storage private_calendar_remote]
type = "caldav"
url = "https://<url>"
auth = "basic"
username = "<username>"
password = "<password>"

```

After that initialize vdirsyncer.

```vdirsyncer discover && vdirsyncer metasync```

And keep regularly syncing your data (crontab).
The command to sync is the following.

```vdirsyncer sync```

Finally add a ```~/.config/khal/config``` and you're ready to go.

```
[calendars]

[[calendars]]
path = ~/.local/share/pim/calendars/*/*
type = discover
```
