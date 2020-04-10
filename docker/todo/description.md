# Todo
This is a dockerized todo-list webui.
The official container and documentation was made by [prologic](https://hub.docker.com/r/pologic/todo).

## Volumes
Set the following volumes with the -v tag.

| Volume-Name      | Container mount      | Description             |
| ---------------- | -------------------- | ----------------------- |
| todo             | /go/src/todo/todo.db | Database for todo list  |

## Ports
Set the following ports with the -p tag.

| Container Port | Recommended outside port | Protocol | Description |
| -------------- | ------------------------ | -------- | ----------- |
| 8000           | 8000                     | TCP      | WebUI       |

