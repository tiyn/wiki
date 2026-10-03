# boinc – client

This is a [Docker](/wiki/docker.md) container for a [BOINC](/wiki/boinc.md) client.
The official container and documentation was made by the
[BOINC project](https://hub.docker.com/r/boinc/client).
This docker-rebuild is made up by a `docker-compose.yml` file.

## Setup

Create the files `rebuild.sh` and `docker-compose.yml` at the same place.
Set `BOINC_GUI_RPC_PASSWORD` to a secure password and change the other settings according to your
needs.
Then run `./rebuild.sh`.

The container does not provide a web interface.
It can be controlled with the [BOINC Manager](/wiki/boinc.md#boinc-manager) or with `boinccmd`.

### Environment-variables

Set the following environment-variables in the `environment:` section of the docker-compose file.


| Name                      | Usage                                                    | Default |
| ------------------------- | -------------------------------------------------------- | ------- |
| `BOINC_GUI_RPC_PASSWORD`  | password used when connecting to the BOINC client        |         |
| `BOINC_CMD_LINE_OPTIONS`  | additional BOINC client command-line options             |         |
| `BOINC_REMOTE_HOST`       | optionally restrict GUI RPC access to a specific host IP |         |
| `TZ`                      | timezone used inside the container                       | `UTC`   |


`BOINC_CMD_LINE_OPTIONS=--allow_remote_gui_rpc` allows the BOINC Manager to connect from arbitrary
remote IP addresses.
If access should instead be restricted to one remote host, `BOINC_REMOTE_HOST` can be used.

### Volumes

Set the following volumes in the `volumes:` section of the docker-compose file.


| Outside mount/volume name | Container mount | Description                         |
| ------------------------- | --------------- | ----------------------------------- |
| `boinc`                   | `/var/lib/boinc`| BOINC configuration and client data |


### Ports

Set the following ports in the `ports:` section.


| Container Port | Recommended outside port | Protocol | Description             |
| -------------- | ------------------------ | -------- | ----------------------- |
| `31416`        | `31416`                  | TCP      | BOINC Manager / GUI RPC |


### Additional

There are some additional settings which can be used by the container.


| Setting     | Usage                                                                                 |
| ----------- | ------------------------------------------------------------------------------------- |
| `pid: host` | allows BOINC to see host processes for non-BOINC CPU usage and application exclusions |


### rebuild.sh

```sh
#!/bin/sh
docker compose down
docker pull boinc/client:latest
docker compose up -d
```

### docker-compose.yml

```yml
services:
  boinc:
    image: boinc/client:latest
    container_name: boinc
    restart: unless-stopped

    pid: host

    ports:
      - "31416:31416/tcp"

    volumes:
      - ./boinc:/var/lib/boinc

    environment:
      - BOINC_GUI_RPC_PASSWORD=<password>
      - BOINC_CMD_LINE_OPTIONS=--allow_remote_gui_rpc
```
