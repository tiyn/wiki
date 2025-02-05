# homeassistant - home-assistant

This is a [Docker](/wiki/docker.md) container for a [Home Assistant](/wiki/home_assistant.md)
server.
The official container and documentation was made by
[homeassistant](https://hub.docker.com/r/homeassistant/home-assistant).

## Set-up

Create the file `rebuild.sh`.
Change the settings according to your needs and run `./rebuild.sh` afterwards.

### Volumes

Set the following volumes with the -v tag.

| Outside mount/volume name | Container mount | Description                     |
| ------------------------- | --------------- | ------------------------------- |
| `homeassistant_data`      | `/config`       | configuration for devices, etc  |

### Environment-variables

Set the following environment-variables in the `environment:` section of the
docker-compose file.

| Name                  | Usage                       | Default                 |
| --------------------- | --------------------------- | ----------------------- |
| `TZ`                  | specify the timezone        | ``                      |

### Additional

The container needs acces to the host network.
This will at the same time expose port 8123 as web interface.

### rebuild.sh

```sh
docker run --name homeassistant \
  --restart=unless-stopped \
  --privileged \
  --network=host \
  -e TZ=Europe/Berlin \
  -v homeassistant_data:/config \
  -d ghcr.io/home-assistant/home-assistant:stable
```
