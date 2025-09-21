# /maintainer/ - /name/

This is a [Docker](/wiki/docker.md) container for a /service/ server.
The official container and documentation was made by
[/maintainer/]().
This docker-rebuild is made up by a `docker-compose.yml` file.
In addition to the main container you need to connect a
[/additional containers needed/]() to it.

## Set-up

Create the files `rebuild.sh`, `.env` and `docker-compose.yml` at the same
place.
Change the settings according to your needs and run `./rebuild.sh` afterwards.

### Environment-variables

Set the following variables in the `environment:` section.

| Name       | Usage         | Default |
| ---------- | ------------- | ------- |
| `/name/`   | /description/ |         |

<!-- ### Environment-variables -->
<!---->
<!-- The environment variables are set via the `.env` file and listed in the -->
<!-- [corresponding section](#env). -->
<!---->
### Ports

Set the following ports in the `ports:` section.

| Container Port | Recommended outside port | Protocol  | Description   |
| -------------- | ------------------------ | --------- | ------------- |
| `/port/`       | `/port/`                 | /TCP/UDP/ | /description/ |

### Volumes

Set the following volumes with the -v tag.

| Outside mount/volume name | Container mount | Description   |
| ------------------------- | --------------- | ------------- |
| `/volume name/`           | `/mount point/` | /description/ |

### rebuild.sh

```sh
#!/bin/sh
docker-compose down
docker-compose up -d
```

<!-- ### .env -->
<!---->
<!-- ```sh -->
<!-- ``` -->
<!---->
### docker-compose.yml

```yml
```
