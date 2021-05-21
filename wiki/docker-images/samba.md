# samba

The official container and documentation was made by [dperson](https://hub.docker.com/r/samba).

## Volumes

Set the following volumes with the -v tag.

| Outside mount/volume name | Container mount    | Description                   |
| ------------------------- | ------------------ | ----------------------------- |
| `samba_nas`               | `/nas`             | storage for samba data        |
| `samba_lib`               | `/var/lib/samba`   | storage for samba lib         |
| `samba_cache`             | `/var/cache/samba` | storage for samba cache       |
| `samba_run`               | `/run/samba`       | run entries for samba         |
| `samba_etc`               | `/etc`             | etc directory of samba server |
| `samba_log`               | `/var/log/samba`   | storage for samba logs        |

## Ports

Set the following ports with the -p tag.

| Container Port | Recommended outside port | Protocol | Description    |
| -------------- | ------------------------ | -------- | -------------- |
| `139`          | `139`                    | TCP      | Samba internal |
| `445`          | `445`                    | TCP      | Samba internal |

## Additional

There are some special variables to set.

| Flag                                                                      | Usage            |
| ------------------------------------------------------------------------- | ---------------- |
| `-u \<username;password\>(;ID;group;GID)`                                 | define user      |
| `-w \<workgroup\>`                                                        | define workgroup |
| `-s \<name;path\>(;browse;readonly;guest;users;admins;writelist;comment)` | define shares    |

## rebuild.sh

```shell
#!/bin/sh
docker stop samba
docker rm samba
docker pull dperson/samba
docker run --name samba \
    --restart unless-stopped \
    -p 139:139 \
    -p 445:445 \
    -v samba_nas:/nas \
    -v samba_lib:/var/lib/samba \
    -v samba_cache:/var/cache/samba \
    -v samba_run:/run/samba \
    -v samba_etc:/etc \
    -v samba_log:/var/log/samba \
    -d dperson/samba -p \
    -u "user1;pass1" \
    -u "user2;pass2" \
    -s "public;/nas/public" \
    -s "user1private;/nas/user1;no;no;no;user1;user1" \
    -s "user2private;/nas/user2;no;no;no;user2;user2"
```
