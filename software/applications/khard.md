# Khard

`khard` is a adressbook that runs in your terminal.
To sync the data using CardDAV you'll need `vdirsyncer` aswell.

## Setup

### Arch Linux

- `pacman -S khard vdirsyncer` - Install needed programs

### Configuration

- Edit the `~/.config/vdirsyncer/config`.
	-	Insert the following lines:
```
[general]
status_path = "~/.cache/vdirsyncer/status"

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
- `vdirsyncer discover && vdirsyncer metasync` - Initialize vdirsyncer
- `vdirsyncer sync` - Synchronize the addressbook (put this into a crontab to update periodically)
- Add and configure a config for khard
	- `mkdir ~/.config/khard` - add a directory for the config
	- `cp /usr/share/doc/khard/khard.conf.example ~/.config/khard/khard.conf` - Copy the example configuration
	- Adjust `khard.conf` to your needs

#### Mutt

It is possible to use your khard-addressbook in mutt.
To see how it works check out the [Mutt](/#application/neomutt.md).
