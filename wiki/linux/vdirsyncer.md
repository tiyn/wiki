# Vdirsyncer

[Vdirsyncer](https://github.com/pimutils/vdirsyncer) can sync calendars and
contacts using the caldav and carddav protocol.

## Setup

Vdirsyncer can be installed via the
[GitHub page](https://github.com/pimutils/vdirsyncer).
Some distributions also feature the `vdirsyncer` package.

### Configuration

- Edit the `~/.config/vdirsyncer/config`.
  - Insert the following lines:

```txt
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

#contacts
[pair private_contacts]
a = "private_contacts_local"
b = "private_contacts_remote"
collections = ["from a", "from b"]

[storage private_contacts_local]
type = "filesystem"
path = "~/.local/share/pim/contacts"
fileext = ".vcf"

[storage private_contacts_remote]
type = "carddav"
url = "https://<url>"
username = "<username>"
password = "<password>"
auth = "basic"
```

Replace specific lines with your information.
You can set multiple contact and calendar syncs at once.

- `vdirsyncer discover && vdirsyncer metasync` - Initialize vdirsyncer
- `vdirsyncer sync` - Synchronize your data (put it in a crontab to run periodically)
