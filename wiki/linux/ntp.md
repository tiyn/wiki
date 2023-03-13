# NTP

[NTP](https://www.rfc-editor.org/rfc/rfc5905) - short for Network Time Protocol
- is the most common method to synchronize the software clock of a
[Linux](/wiki/linux/linux.md) system.

## Setup

NTP can be installed on most distributions by installing the
`ntp` package.

## Usage

The following section describes the usage of the NTP package.

### Synchronize Time once

For one time synchronization of the time and date the `ntpdate` command can be
used.
The following command is an example for a one time sync.
Note that the server has to be changed for different time zones.
In this case a german time server is used.

```sh
ntpdate -q 0.de.pool.ntp.org
```
