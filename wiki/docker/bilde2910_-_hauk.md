# bilde2910 - Hauk

This is a docker container for a [Hauk](../hauk.md).

## Set-up

Create the files `rebuild.sh` and `docker-compose.yml` at the same place.
Additionally create a `config.php` file based on the
[config-sample](https://github.com/bilde2910/Hauk/blob/master/backend-php/include/config-sample.php)
at the location specified in your  `docker-compose.yml` (in this example it's
`./config/hauk`).
Change the config according to your needs.
Do not change anything starting with `memcached` inside the `config.php`.
Most importantly set the `public_url` correctly.
For a simple multi-user setup set `auth_method` to `HTPASSWD`.
Then inside the same folder of `config.php` run the following command to setup
the first and optionally more users.

```sh
htpasswd -cBC 10 /etc/hauk/users.htpasswd <first user name>
htpasswd -BC 10 /etc/hauk/users.htpasswd <other user name>
```

Finally run `./rebuild.sh`.

### Volumes

Set the following volumes in the `volumes:` section of the docker-compose file.

| Outside mount/volume name | Container mount    | Description                    |
| ------------------------- | ------------------ | ------------------------------ |
| `./config/hauk`           | `/etc/hauk`        | config and password location   |

### Ports

Set the following ports in the `ports:` section.

| Container Port | Recommended outside port | Protocol | Description            |
| -------------- | ------------------------ | -------- | ---------------------- |
| `80`           | `80`                     | TCP      | Basic service          |

### rebuild.sh

```sh
#!/bin/sh
docker-compose down
docker pull bilde2910/hauk
docker-compose up -d
```

### docker-compose.yml

```yml
version: "2"

services:
  hauk:
    image: bilde2910/hauk
    restart: unless-stopped
    volumes:
      - ./config/hauk:/etc/hauk
    ports:
      - "80:80"
```
