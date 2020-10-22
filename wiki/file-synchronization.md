# File synchronization

Tools to synchronize data and so called clouds are pretty handy to use files on different machines.
There are tools with a main server and there are tools that don't need them.

## Synchronizing with main server

The biggest advantage of having a main server contain your data is that - as long as the server is online -
you can sync as you please.
You do not need to care which machines are online to get all the files you need.
If you are talking about a cloud, this is this.

- [Owncloud](owncloud.md) is a self-hostable, open-source file hosting service that can be dockerized.
- [Onedrive](onedrive.md) is a very popular piece of software despite being proprietary.
You can not self-host it, but you can run a dockerized client.

## Synchronizing without main server

If you can bare the difficulties ascending due to the mentioned above problems, this is probably a more
safe way to "host" files.
There is no single server as point of attack with all your data.

- [Syncthing](syncthing.md) is a free and open-source peer-to-peer file synchronization tool that can be dockerized.
