# NextCloud

NextCloud is a free and open source client-server cloud-service.

## Setup

The software can be setup via [Docker](/wiki/docker.md) with the
[nextcloud image](./docker/nextcloud.md).

When using NextCloud with a specific nginx configuration you have to append
`'overwriteprotocol' => 'https',` to your `config/config.html`.

## Usage

This section addresses various features of NextCloud.

### WebDAV

You can access ownCloud via WebDAV with the link
`https://<nextcloud instance>/remote.php/dav/files/<user>/<path to folder or file>`.

### Nesting Nextcloud Data of Multiple Servers

By default it is not possible for one servers files to be saved to the folder structure that is
used for another server or to nest data from two or more servers within each other.
This however can be conveniently avoided by using symbolic links
(for example [symbolic links](/wiki/linux/shell.md#symbolic-links-using-ln) in
[Linux](/wiki/linux.md)), which are not by default synchronized to NextCloud.
