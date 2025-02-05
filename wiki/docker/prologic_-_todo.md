# prologic - todo

This is a [Docker](/wiki/docker.md) container for a todo-manager.
The official container and documentation was made by
[prologic](https://hub.docker.com/r/prologic/todo).

## Set-up

Create the file `rebuild.sh`.
Change the settings according to your needs and run `./rebuild.sh` afterwards.

### Volumes

Set the following volumes with the -v tag.

| Outside mount/volume name | Container mount        | Description            |
| ------------------------- | ---------------------- | ---------------------- |
| `todo`                    | `/go/src/todo/todo.db` | Database for todo list |

### Ports

Set the following ports with the -p tag.

| Container Port | Recommended outside port | Protocol | Description |
| -------------- | ------------------------ | -------- | ----------- |
| `8000`         | `8000`                   | TCP      | WebUI       |

### rebuild.sh

```sh
#!/bin/sh
docker stop todo
docker rm todo
docker pull prologic/todo
docker run --name todo \
    -p 8000:8000 \
    --restart unless-stopped \
    -v todo:/go/src/todo/todo.db \
    -d prologic/todo
```
