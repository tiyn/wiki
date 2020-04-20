# Docker-radicale
This is a dockerized version of a radicale server.
The official container and documentation was made by [tomsquest](https://hub.docker.com/r/tomsquest/docker-radicale).

The `latest` tag at the moment of writing this readme was corrupted.
The last usable tag was used therefore to guarantee best performance for all users.

## Volumes
Set the following volumes with the -v tag.

| Volume-Name      | Container mount | Description                 |
| ---------------- | --------------- | --------------------------- |
| radicale\_data    | /data           | storage for caldav          |
| radicale\_config  | /config         | storage for radicale config |

## Ports
Set the following ports with the -p tag.

| Container Port | Recommended outside port | Protocol | Description   |
| -------------- | ------------------------ | -------- | ------------- |
| 5232           | 5232                     | TCP      | WebUI, caldav |

## Additional
There are some special variables to set.

| Flag        | Usage                                                                  |
| ----------- | ---------------------------------------------------------------------- |
| --read-only | make radicale read-only, caldav can still be changed and used normally |

## Setup
After installation there are a few crucial steps to take to secure your calendars with a login.
It is important to change the config file which can be found in the docker volume with name `radicale_config` to match the `config`-file.

Following this you need to make sure there is a password file in the docker volume `radicale_data` called `users`.
The password will be encrypted using `bcrypt`.
Steps to create a file with a user and password:
- You will have to install the package which includes `htpasswd`; for debian based distributions this is `apt install apache2-utils`
- `cd /var/lib/docker/volumes/radicale\_data/\_data` - go to the volume
- `touch ./users` - create a file called users
- `htpasswd -B ./users username` - add user with name and password to the file (change `username` to your desired username)

Now you can go to the exposed port and login with your chosen username and password.
If you only added one user you shouldn't be able to login with any other data than your username and password.
