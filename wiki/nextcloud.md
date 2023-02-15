# NextCloud

NextCloud is a free and open source client-server cloud-service.

## Setup

The software can be setup via [Docker](/wiki/docker.md) with the
[nextcloud image](./docker-images/nextcloud.md).

When using NextCloud with a specific nginx configuration you have to append
`'overwriteprotocol' => 'https',` to your `config/config.html`.

## Usage

This section addresses various features of NextCloud.

### WebDAV

You can access ownCloud via WebDAV with the link
`https://<nextcloud instance>/remote.php/dav/files/<user>/<path to folder or file>`.
