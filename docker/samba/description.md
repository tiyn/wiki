# Samba
This is a dockerized version of a samba server.
The official container and documentation was made by [dperson](https://hub.docker.com/r/samba).

## Volumes
Set the following volumes with the -v tag.

| Volume-Name      | Container mount | Description                    |
| ---------------- | --------------- | ------------------------------ |
| samba_nas        | /nas            | storage for samba data         |
| samba_lib        | /var/lib/samba  | storage for samba lib          |
| samba_cache      | /var/cache/samba | storage for samba cache       |
| samba_run        | /run/samba       | run entries for samba         |
| samba_etc        | /etc             | etc directory of samba server |
| samba_log        | /var/log/samba   | storage for samba logs        |

## Ports
Set the following ports with the -p tag.

| Container Port | Recommended outside port | Protocol | Description    |
| -------------- | ------------------------ | -------- | -------------- |
| 139            | 139                      | TCP      | Samba internal |
| 445            | 445                      | TCP      | Samba internal |

##Additional
There are some special variables to set.

| Flag                                                                  | Usage            |
| --------------------------------------------------------------------- | ---------------- |
| -u <username;password>(;ID;group;GID)                                 | define user      |
| -w <workgroup>                                                        | define workgroup |
| -s <name;path>(;browse;readonly;guest;users;admins;writelist;comment) | define shares    |

