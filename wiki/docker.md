# Docker

Docker is a virtualization software that deploys docker containers.
Due to easy handling and reproducible environments it is a useful tool.

## Setup

- [Arch Linux](/wiki/linux/arch-linux.md): run `pacman -S docker` to install docker
- Ubuntu: visit [the official installation guide](https://docs.docker.com/engine/install/ubuntu/)

Another possibility is to try the official convenience script.
To get and execute it run the following in your
[terminal](/wiki/linux/system_console.md).

```sh
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
```

## Usage

This section addresses various features of Docker.

### Virtualize Operating Systems

Docker is a tool that can be used to virtualize different programs and software.
Especially for containerizing and virtualizing operating systems (mostly based on
[Linux](/wiki/linux.md)) can be handled by [Distrobox](https://github.com/89luca89/distrobox).

### Run Docker as non-root user

To run docker as a non-root user you need to add your user to the `docker` group.
To do this, create the group docker if it doesn't exist `sudo groupadd docker`
and then add your user to the group using `sudo usermod -aG docker $USER`.
After that log back into your machine.
Then you should be able to run the following.

```sh
docker run hello-world
```

### Tools and Visualization

The programs below are useful docker-management systems in different style.

- [ctop](https://github.com/bcicen/ctop): top-like CLI interface for containers
- [Portainer](https://www.portainer.io/): web UI for managing docker and Kubernetes

### Enable Nvidia GPUs

To use Nvidia GPUs with docker you need to install the Nvidia CUDA toolkit.
There is a [guide on Marmelab](https://marmelab.com/blog/2018/03/21/using-nvidia-gpu-within-docker-container.html)
that focuses on that topic.

### Block remote port access

If you configured a [reverse proxy](/wiki/reverse-proxy.md) to a port chances
are you don't want the port to be accessed outside the proxy.
Especially if you set up an authentication over nginx the open port will avoid
the authentication.
This can be changed at the forwarded docker-service by replacing for example
`-p 7000:7000` with `-p 172.17.0.1:7000:7000`.
This forces the docker container to only expose the port in the docker bridge
network, effectively banning remote access.

If you use [Traefik](./traefik.md) it is not needed, because you don't have to
publish ports to reverse proxy them.

### Containerize a graphical application

A graphical application can easily be containerized using Docker and made available over both
the [web browser](/wiki/web_browser.md) or [VNC](/wiki/vnc.md).
For this
[jlesages baseimage-gui container](https://hub.docker.com/r/jlesage/baseimage-gui)
can be used.

### Find the Container and the Mounting Point of a Volume

Sometimes it is unclear which container a volume belongs to.
This is especially the case if the volume was created automatically and not manually or explicitly
during the setup.

The following command will output the container a volume with the name `<volume-name>` belongs to.

```sh
docker ps -a --filter volume=<volume_name>
```

Additionally, the mounting point is also of interest.
To display it, run the following command where `<container-name>` is the name of the container the
volume belongs to.

```sh
docker inspect <container-name>
```

## Troubleshooting

This section will focus on errors and the fixing of errors of docker.

### `Error saving credentials: 'Cannot autolaunch D-Bus without X11 $DISPLAY'`

As explained by
[gotam19 in a Docker forum post](https://forums.docker.com/t/docker-login-fails-with-error-message-saving-credentials-cannot-autolaunch-d-bus-without-x11-display/77789)
this error message only occurs on [Linux](/wiki/linux.md) when trying to log in or pulling a Docker
image.
To fix it install [GPG](/wiki/linux/gpg.md) and the `pass`
[package](/wiki/linux/package_manager.md).
Afterward running the following command perform the login to the Docker servers and the error
message should not come up again.

```sh
docker login
```
