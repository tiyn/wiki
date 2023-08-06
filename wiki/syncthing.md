# Syncthing

[Syncthing](https://syncthing.net/) is a continuous file synchronization
program.
The Software synchronizes files between multiple devices directly.

## Setup

The software can be setup via [Docker](/wiki/docker.md) with the
[linuxserver image](./docker/linuxserver_-_syncthing.md).

Additionally the software can be installed by visiting the
[official website](https://syncthing.net/downloads/) and download it from
there.

### Initial configuration

Syncthing can be configured in root and in user space.

#### Root space configuration for Linux

This section assumes that a Linux system is used.
For root space configuration you can use the Docker image for easy setup.
Afterwards navigate to the set IP with your browser and set up the directories
to sync.

#### User space configuration for Linux

This section assumes that a Linux system is used.
The user space configuration is a bit more difficult than the root space
configuration.
The following steps are adapted from a
[reddit post by tmplshdw](https://www.reddit.com/r/SteamDeck/comments/uhf8lw/comment/i77ojke/).

- Download synthing from their website as described in the
  [setup section][#setup].
- Extract the downloaded `.tar.gz` file
- Copy the file named `syncthing` to your home directory
- In the downloaded folder copy the file
  `etc/linux-systemd/user/syncthing.service` to `~/.config/systemd/user/`
- In the file `~/.config/systemd/user/` change the line starting with
  `ExecStart=`.
  Put the absolute path to your home directory after the equal sign
- Run `systemctl --user enable syncthing.service` and
  `systemctl --user start syncthing.service` to start the Syncthing service now
  and at each following start of the system

After this Syncthing can be found at `http://127.0.0.1:8384`
