# NextCloud

NextCloud is a free and open source client-server cloud-service.

## Setup

The software can be setup via [Docker](/wiki/docker.md) with the
[NextCloud image](/wiki/docker/nextcloud.md).

When using NextCloud with a specific nginx configuration you have to append
`'overwriteprotocol' => 'https',` to your `config/config.html`.

## Usage

This section addresses various features of NextCloud.

### WebDAV

You can access ownCloud via WebDAV with the link
`https://<nextcloud instance>/remote.php/dav/files/<user>/<path to folder or file>`.

### Nesting Nextcloud Data of Multiple Servers

By default, it is not possible for one server files to be saved to the folder structure that is
used for another server or to nest data from two or more servers within each other.
This however can be conveniently avoided by using symbolic links
(for example [symbolic links](/wiki/linux/shell.md#symbolic-links-using-ln) in
[Linux](/wiki/linux.md)), which are not by default synchronized to NextCloud.

## Troubleshooting

This section will focus on errors and the fixing of errors of NextCloud.

### `Error occurred while downloading files` on Android Clients

When using [Android](/wiki/android.md) clients for NextCloud the error `Error occurred while
downloading files` can occur.
This error can especially show up when a file or a directory contains a colon (`:`).
[Android](/wiki/android.md) might display them correctly but has problems with downloading and
displaying them which seems to be a problem with file handling and the conversion of file names.
Most notably this error is not reproducible with the [Linux](/wiki/linux.md) or
[Windows](/wiki/windows.md) or the web interface.
Simply renaming files and folders to not include colons fixes the problems most of the time.

### Problem Uploading Files on Android Clients

When using an [Android](/wiki/android.md) client problems may occur regarding uploading files.
Most of the time no error messages are given, but the error can be caused by a colon (`:`) and be
similar to the [previous section](#error-occurred-while-downloading-files-on-android-clients).
Simply renaming files and folders to not include colons fixes the problems most of the time.

### Stuck with `Synchronizing files in local folder`

When the NextCloud client is stuck with in an idle loop that is characterized by a status like
`Synchronizing files in local folder` and/or `Syncing file 0 of <file-number>` where `<file-number>`
is an arbitrarily large number of files.
When checking the logging file in `~/.local/share/Nextcloudoud_sync.log` there won't be any obvious
error messages.
In fact there will only be a sync running without it finishing - unless interrupted manually.

However, this problem can easily be fixed with the following steps.
First the NextCloud instance which is stuck needs to be stopped.

```sh
nextcloud --quit
```

Afterward some files have to be removed.
Firstly delete the cache at `~/.local/share/Nextcloud`.

```sh
rm -rf ~/.local/share/Nextcloud/*
```

And secondly remove the synchronization files in the NextCloud folder.
`<nextcloud-folder>` is the placeholder for that.

```sh
rm -rf <nextcloud-folder>/.sync_*
```

Finally, restart NextCloud and the system should not be stuck anymore.
Please note that after this steps a complete re-check of all files will be due.
This however does not mean that all files will be downloaded or uploaded again.
They will just be checked and only if the local version differs will they be synchronized.
