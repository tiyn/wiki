# Contacts
To use a terminal addressbook the following programs are needed.

| programm   | description             |
| ---------- | ----------------------- |
| khard      | terminal addressbook    |
| vdirsyncer | sync tool for calendars |

## Installation and configuration
To configure vdirsyncer edit a file in ```~/.config/vdirsyncer/config```.

```
[general]
status_path = "~/.cache/vdirsyncer/status"

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

After that initialize vdirsyncer.

```vdirsyncer discover && vdirsyncer metasync```

And keep regularly syncing your data (crontab).
The command to sync is the following.

```vdirsyncer sync```

Now you just need to add and configure the config and youre done.

```
mkdir ~/.config/khard
cp /usr/share/doc/khard/khard.conf.example ~/.config/khard/khard.conf
```

## Mutt
It is possible to use your khard-addressbook in mutt.
To see how it works check out the [Mutt](/#arch/mail.md).
