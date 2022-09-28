# Owncloud

ownCloud is a free client-server cloud-service.

## Setup

The software can be setup via docker with the
[owncloud image](./docker-images/owncloud.md).

## Error handling

### Problems with a locked file

It is possible that you can't remove or move a locked file.
If this problem doesn't resolve after a restart you can try to disable locking
in the owncloud config.
This is done by adding the line `'filelocking.enabled' => false,` into the file `config/config.php`.
Then try to resolve the error.
Afterwards enable locking again by removing the added line.

The reason I choose this process over editing the database file, is ease of use.
The editing of the database is much more time consuming especially if run with docker.

## WebDAV

You can access ownCloud via WebDAV with the link
`https://<owncloud instance>/remote.php/dav/files/<user>/<path to folder or file>`.
