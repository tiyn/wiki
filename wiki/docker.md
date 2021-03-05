# Docker

Docker is a virtualization software that deploys docker containers.
Due to easy handling and reproducable environments it is a useful tool.

## Installation

- Arch linux: run `pacman -S docker` to install docker
- Ubuntu: visit [the official installation guide](https://docs.docker.com/engine/install/ubuntu/)

## Run Docker as non-root user

To run docker as a non-root user you need to add your user to the `docker` group.
To do this create the group docker if it doesn't exist `sudo groupadd docker`
and then add your user to the group using `sudo usermod -aG docker $USER`.
After that relog into your machine and you should be able to run
`docker run hello-world`.

## Tools and Visualisation

The programs below are useful docker-management systems in different style.

- [ctop](https://github.com/bcicen/ctop): top-like cli interface for containers
- [portainer](portainer.md): web ui for managing docker and kubernetes

## Enable Nvidia GPUs

To use Nvidia GPUs with docker you need to install the nvidia-cuda-toolkit.
There is a [guide on marmelab](https://marmelab.com/blog/2018/03/21/using-nvidia-gpu-within-docker-container.html)
that focusses on that topic.
