# Portainer

[Portainer](https://www.portainer.io/) is a Kubernetes management platform that
also works with [Docker](./docker.md).

## Setup

Portainer is a service that allows clustering.
It consist of one [server](#server) and possibly multiple [agents](#agent).

### Server

The software can be setup via [Docker](/wiki/docker.md) with the
[portainer image](./docker-images/portainer_-_portainer.md).

## Agent

An agent is a cluster of Docker API proxies.
An agent can be setup via Docker with the [portainer image](./docker-images/portainer_-_agent.md).
