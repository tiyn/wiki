# tomsquest - docker-radicale

This is a docker container for a radicale CalDAV server.
The official container and documentation was made by
[tomsquest](https://hub.docker.com/r/tomsquest/docker-radicale).

The `latest` tag at the moment of writing this readme was corrupted.
The last usable tag was used therefore to guarantee best performance for all users.

## Set-up

Create the file `rebuild.sh`.
Create a volume with the name `radicale_config`.
Then create the `config` file in the volume `radicale_config`.
Change the settings according to your needs and run `./rebuild.sh` afterwards.

## Volumes

Set the following volumes with the -v tag.

| Outside mount/volume name | Container mount | Description                 |
| ------------------------- | --------------- | --------------------------- |
| `radicale_data`           | `/data`         | storage for caldav          |
| `radicale_config`         | `/config`       | storage for radicale config |

## Ports

Set the following ports with the -p tag.

| Container Port | Recommended outside port | Protocol | Description   |
| -------------- | ------------------------ | -------- | ------------- |
| `5232`         | `5232`                   | TCP      | WebUI, caldav |

## Additional

There are some special variables to set.

| Flag          | Usage                                                                  |
| ------------- | ---------------------------------------------------------------------- |
| `--read-only` | make radicale read-only, caldav can still be changed and used normally |

## rebuild.sh

```shell
#/bin/sh
docker stop radicale
docker rm radicale
docker pull tomsquest/docker-radicale:2.1.11.4
docker run --name radicale \
    --restart unless-stopped \
    --read-only \
    -p 5232:5232 \
    -v radicale_data:/data \
    -v radicale_config:/config \
    -d tomsquest/docker-radicale:2.1.11.4
```

## radicale\_config/\_data/config

```txt
# -*- mode: conf -*-
# vim:ft=cfg

# Config file for Radicale - A simple calendar server
#
# Place it into /etc/radicale/config (global)
# or ~/.config/radicale/config (user)
#
# The current values are the default ones


[server]

# CalDAV server hostnames separated by a comma
# IPv4 syntax: address:port
# IPv6 syntax: [address]:port
# For example: 0.0.0.0:9999, [::]:9999
#hosts = 127.0.0.1:5232
hosts = 0.0.0.0:5232

# Max parallel connections
#max_connections = 8

# Max size of request body (bytes)
#max_content_length = 100000000

# Socket timeout (seconds)
#timeout = 30

# SSL flag, enable HTTPS protocol
#ssl = False

# SSL certificate path
#certificate = /etc/ssl/radicale.cert.pem

# SSL private key
#key = /etc/ssl/radicale.key.pem

# CA certificate for validating clients. This can be used to secure
# TCP traffic between Radicale and a reverse proxy
#certificate_authority =

# SSL Protocol used. See python's ssl module for available values
#protocol = PROTOCOL_TLSv1_2

# Available ciphers. See python's ssl module for available ciphers
#ciphers =

# Reverse DNS to resolve client address in logs
#dns_lookup = True


[encoding]

# Encoding for responding requests
#request = utf-8

# Encoding for storing local collections
#stock = utf-8


[auth]

# Authentication method
# Value: none | htpasswd | remote_user | http_x_remote_user
type = htpasswd

# Htpasswd filename
htpasswd_filename = /data/users

# Htpasswd encryption method
# Value: plain | sha1 | ssha | crypt | bcrypt | md5
# Only bcrypt can be considered secure.
# bcrypt and md5 require the passlib library to be installed.
htpasswd_encryption = bcrypt

# Incorrect authentication delay (seconds)
#delay = 1

# Message displayed in the client when a password is needed
#realm = Radicale - Password Required


[rights]

# Rights backend
# Value: none | authenticated | owner_only | owner_write | from_file
#type = owner_only

# File for rights management from_file
#file = /etc/radicale/rights


[storage]

# Storage backend
# Value: multifilesystem
#type = multifilesystem

# Folder for storing local collections, created if not present
#filesystem_folder = /var/lib/radicale/collections
filesystem_folder = /data/collections

# Delete sync token that are older (seconds)
#max_sync_token_age = 2592000

# Command that is run after changes to storage
# Example: ([ -d .git ] || git init) && git add -A && (git diff --cached --quiet || git commit -m "Changes by "%(user)s)
#hook =


[web]

# Web interface backend
# Value: none | internal | radicale_infcloud
# (See also https://github.com/Unrud/RadicaleInfCloud)
type = internal


[logging]

# Threshold for the logger
# Value: debug | info | warning | error | critical
#level = warning

# Don't include passwords in logs
#mask_passwords = True


[headers]

# Additional HTTP headers
#Access-Control-Allow-Origin = *
```

Following this you need to make sure there is a password file in the docker
volume `radicale_data` called `users`.
The password will be encrypted using `bcrypt`.
Steps to create a file with a user and password:

- You will have to install the package which includes `htpasswd`; for debian
  based distributions this is `apt install apache2-utils`
- `cd /var/lib/docker/volumes/radicale\_data/\_data` - go to the volume
- `touch ./users` - create a file called users
- `htpasswd -B ./users username` - add user with name and password to the file
  (change `username` to your desired username)

Now you can go to the exposed port and login with your chosen username and password.
If you only added one user you shouldn't be able to login with any other data
than your username and password.
