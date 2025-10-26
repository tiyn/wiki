# Radicale

[Radicale](https://radicale.org/v3.html) is a free and open-source CalDAV and CardDAV server.

## Setup

The software can be setup via [Docker](/wiki/docker.md) with the
[tomsquest](/wiki/docker/tomsquest_-_docker-radicale.md).

## Usage

This section addresses the usage of Radicale.

### Push iCal File to Radicale

This section is based on a
[Reddit comment by jbnu1l](https://www.reddit.com/r/selfhosted/comments/jbnu1l/how_would_i_push_an_ics_to_a_caldav_server/).
To push an iCal file to the Radicale server the following command can be used.
`<user>` and `<password>` are the username and password for Radicale, while `<radicale-calendar>`
is the link to the calendar as found on the interface of Radicale.
`<ical-file>` is the path of the iCal file.

```sh
curl -u <user>:<password> -X PUT <radicale-calendar> --data-binary @<ical-file>
```

Similar to this a remote iCal file can be pushed to a Radicale server.
When using another calendar as iCal file and a cronjob this can be used to sync a calendar to a
Radicale calendar.
For this it is recommended to use a small python script like the following.

```py 
#!/usr/bin/env python3
import requests
from icalendar import Calendar

CALDAV_URL = "<radicale-calendar>/"
USERNAME = "<user>"
PASSWORD = "<password>"

ICS_SOURCE_URL = "<link to ics file>"

def upload_event(event, base_url, auth):
    uid = str(event.get("UID"))
    if not uid:
        print("Event without UID skipped")
        return

    safe_uid = "".join(c if c.isalnum() or c in "-_" else "_" for c in uid)

    event_url = f"{base_url}{safe_uid}.ics"

    cal = Calendar()
    cal.add("VERSION", "2.0")
    cal.add("PRODID", "-//Custom Import//DE")
    cal.add_component(event)

    data = cal.to_ical()

    head = requests.head(event_url, auth=auth)
    exists = head.status_code == 200

    resp = requests.put(event_url, data=data, auth=auth, headers={
        "Content-Type": "text/calendar; charset=utf-8"
    })

    if resp.status_code in (200, 201, 204):
        action = "Update" if exists else "New"
        print(f"Done {action}: {uid}")
    else:
        print(f"Error for UID {uid}: {resp.status_code} {resp.text}")

def main():
    print(f"Downloading ICS-file from {ICS_SOURCE_URL} ...")
    r = requests.get(ICS_SOURCE_URL)
    r.raise_for_status()

    gcal = Calendar.from_ical(r.content)

    for component in gcal.walk():
        if component.name == "VEVENT":
            upload_event(component, CALDAV_URL, (USERNAME, PASSWORD))

if __name__ == "__main__":
    main()
```
