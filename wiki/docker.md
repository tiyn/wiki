# Docker

Docker is a virtualization software that deploys docker containers.
Due to easy handling and reproducable environments it is a useful tool.

## Setup

- Arch linux: run `pacman -S docker` to install docker
- Ubuntu: visit [the official installation guide](https://docs.docker.com/engine/install/ubuntu/)

Another possibility is to try the official convenience script.
To get and execute it run the following in your
[terminal](/wiki/system_console.md).

```sh
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
```

## Usage

### Run Docker as non-root user

To run docker as a non-root user you need to add your user to the `docker` group.
To do this create the group docker if it doesn't exist `sudo groupadd docker`
and then add your user to the group using `sudo usermod -aG docker $USER`.
After that relog into your machine and you should be able to run
`docker run hello-world`.

### Tools and Visualisation

The programs below are useful docker-management systems in different style.

- [ctop](https://github.com/bcicen/ctop): top-like cli interface for containers
- [portainer](https://www.portainer.io/): web ui for managing docker and kubernetes

### Enable Nvidia GPUs

To use Nvidia GPUs with docker you need to install the nvidia-cuda-toolkit.
There is a [guide on marmelab](https://marmelab.com/blog/2018/03/21/using-nvidia-gpu-within-docker-container.html)
that focusses on that topic.

### Block remote port access

If you configured a [reverse proxy](/wiki/reverse-proxy.md) to a port chances
are you don't want the port to be accessed outside of the proxy.
Especially if you set up a authentication over nginx the open port will avoid
the authentication.
This can be changed at the forwarded docker-service by replacing for example
`-p 7000:7000` with `-p 172.17.0.1:7000:7000`.
This forces the docker container to only expose the port in the docker bridge
network, effectively banning remote access.

If you use [Traefik](./traefik.md) it is not needed, because you don't have to
publish ports to reverse proxy them.

### Dockerize a graphical application

A graphical application can easily be dockerized and made available over both
the [web browser](/wiki/web_browser.md) or [VNC](/wiki/vnc.md).
For this
[jlesages baseimage-gui container](https://hub.docker.com/r/jlesage/baseimage-gui)
can be used.
