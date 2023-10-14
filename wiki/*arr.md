# \*ARR

\*ARR application is a class of applications made as personal video recorders in
the usenet and [BitTorrent](/wiki/bittorrent.md) domain.
These applications include but are not limited to
[Sonarr](https://github.com/Sonarr/Sonarr) for
[TV shows](/wiki/video.md),
[Radarr](https://github.com/Radarr/Radarr) for
[movies](/wiki/video.md) and
[Lidarr](https://github.com/Lidarr/Lidarr) for [music](/wiki/audio.md).

## Setup

For the different applications there are different [Docker](/wiki/docker.md)
containers for setup:
[Linuxservers Sonarr image](/wiki/docker/linuxserver_-_sonarr.md),
[Linuxservers Radarr image](/wiki/docker/linuxserver_-_radarr.md) and
[Linuxservers Lidarr image](/wiki/docker/linuxserver_-_lidarr.md).

### Initial Configuration

For the initial configuration navigate to `System` and `Status`.
Afterwards check if there are any messages.
There are probably a few steps that need to be taken to complete the setup.
Set the `Download Clients` under `Settings`.
For this an instance of a [BitTorrent Client](/wiki/bittorrent.md#clients) can
be used.
Next an indexer needs to be added.
For this [Jackett](/wiki/jackett.md) can be used.
A guide to add Jackett indexers is featured in
[the Jackett entry](/wiki/jackett.md#adding-a-jackett-indexer-to-arr-applications).
