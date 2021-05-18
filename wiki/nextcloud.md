# NextCloud

NextCloud is a free and open source client-server cloud-service.

## Server

A server can be setup via docker with the [nextcloud image](./docker-images/nextcloud.md).

When using NextCloud with a specific nginx configuration you have to append
`'overwriteprotocol' => 'https',` to your `config/config.html`.

## WebDAV

You can access ownCloud via WebDAV with the link
`https://<nextcloud instance>/remote.php/dav/files/<user>/<path to folder or file>`.
