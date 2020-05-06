# Khal

`khal` is a calendar you can use in your terminal.
To sync calendars you'll need `vdirsyncer` aswell.

## Setup

### Arch-Linux

- `pacman -S khal vdirsyncer` - Install needed packages

### Configuration

- To configure vdirsyncer edit a file in `~/.config/vdirsyncer/config`.

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

- `vdirsyncer discober && vdirsyncer metasync` - After that initialize vdirsyncer.
- `vdirsyncer sync` - Synchronize your data (put it in a crontab to run periodically)
- Edit the `~/.config/khal/config`
	-	Insert the following lines
		```
		[calendars]

		[[calendars]]
		path = ~/.local/share/pim/calendars/*/*
		type = discover
		```
