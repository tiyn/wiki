# calibre

[calibre](https://calibre-ebook.com/) is a cross-platform, free and open-source software suite for
[e-book](/wiki/e-book.md) management.
It supports various formats as well as conversion between them.

## Setup

The web version of calibre can be setup via [Docker](/wiki/docker.md) with the
[linuxserver image](/wiki/docker/linuxserver_-_calibre-web.md).

Additionally, a desktop version is available for [Windows](/wiki/windows.md), macOS and
[Linux](/wiki/linux.md) on the [official website](https://calibre-ebook.com/download).
For many [Linux distributions](/wiki/linux.md#distributions) there is also a package with the
package `calibre` or a similar name, which contains the desktop version as well.

## Usage

This section addresses various features of calibre.

### Usage for the Web Version

This section focuses on the basic usage of calibre's web version.

#### Connect via OPDS

OPDS is a protocol to share e-books via HTTP(S) and XML.
For example, it can be used to connect to an e-book reader like [Episteme](/wiki/e-book.md#e-reader)
on [Android](/wiki/android.md).
Using this the catalog of calibre's web version can then be browsed directly via
[Episteme](/wiki/e-book.md#e-reader).

For calibre's web version the url for the OPDS catalog is the following.
Please note that `<subdomain>`, `<domain>` and `<tld>` can vary.
Additionally, the subdomain could be omitted or `https://` could be used.
However, most important is the path `/opds` which leads to the catalog.

```txt
http://<subdomain>.<domain>.<tld>/opds
```

The login data for the OPDS catalog is the same as for calibre's web version in general.

### Usage for the Desktop Version

This section focuses on the basic usage of calibre's desktop version.

#### Adding a Plugin

A plugin by a third party can be added by selecting a `.zip` archive – usually named
`<plugin name>_plugin.zip` – under Preferences, Plugins, Load plugin from file.

#### Exporting Books

Books can be exported by selecting them and pressing `Save to disk`.
After selecting a path the books will be saved there.
Preferences for this can be set under `Preferences` and `Saving books to disk`.
Especially the creation of separate image and metadata files are often of interest.

The template defines the path structure of the saved books.
A simple template that will create the following structure is
`{author_sort:re( &,;)}/{title}/{authors}_-_{title}`.

```txt
thomas_schickinger;_angelika_steger/diskrete_strukturen_2/thomas_schickinger_&_angelika_steger_-_diskrete_strukturen_2.pdf
```

This assumes the sort author names and sort titles are set as described in
[the following section](#changing-the-default-author-and-title-sort).

In the same view only the boxes `Save cover separately`, `Save metadata in a separate OPF file` and
`Save data file as well` should be unchecked.
All others are used to ensure a lowercase directory and file name without special characters.

#### Changing the Default Author and Title Sort

Under `Preferences` and `Tweaks` the corresponding settings to change the title and author sort name
can be found.

`Author sort name algorithm` defines the author sort name.
By setting `author_sort_copy_method = 'copy'` the author sort name is the same as the author name.
After this setting has been changed right click `Authors` in the navigation bar on the left side and
press `Manage Authors`.
Then press `Recalculate all author sort values` for the change to take effect.

`Control sorting of titles and series in the library display` defines the sort titles.
Setting `title_series_sorting = 'strictly_alphabetic'` will use the standard title and won't make
articles of titles suffixes.
Afterward select all books, right-click and select `Edit metadata in bulk` under `Edit metadata`.
Then check the box `update title sort` and press `Ok` to update all sort titles.

This entry is based on two posts on mobileread – one regarding the
[sort author name](https://www.mobileread.com/forums/showthread.php?t=314663) and the other
regarding the [sort title](https://www.mobileread.com/forums/showthread.php?t=249870).

#### Changing the Cover of a Book

Changing covers of a book can be done by editing the metadata available via the right-click menu.
However this is not enough in some cases.
`.pdf` in contrast to `.epub` files won't save the cover just by this action.
After changing the cover in the metadata screen `.pdf` files have to be converted to correctly
display the cover since the first page of such a file is generally considered the cover.
An alternative to this is the `PDF Cover` Plugin which allows the insertion of the cover before all
other pages without an extra conversion.
Please note that it prepends the cover and does not delete any pages.

#### Transfer Books to a Device

To transfer books to a device connect a e-reader to the computer.
After a while calibre should recognize the device which will be apparent by the appearance of
additional buttons on the top menu like the `Send to device`- and the `Device`-Button.
First make sure only the formats you want will be transfered.
This can be done by selecting `Device`, `File formats` and checking the formats as needed.
Afterward select the books and press `Send to device` to start the process of transfering the
devices.
Alternatively only specific formats of the books can be send to the device by selecting
`Send specific format to` and `Main memory` under the `Send to device` menu.
If there are books that contain series metadata make sure to disconnect the e-reader once and
reconnect it.
Afterward select `Update cached metadata on device` under `Device` to update the metadata including
the series.
Finally, disconnect the device.

It is recommended to convert `.mobi` and `.epub` files to a `.kepub` file before transfering it to a
Kobo device.
For this the Plugin `KePub Output` by Joel Goguen [can be added](#adding-a-plugin) can be installed.
Afterward books can be converted the normal way, but now the output format `.kepub` is available.
Additionally, the `Kobo Touch Extended` plugin is recommended to use since it makes sending books
to Kobo e-readers easier.
Finally, `KePub Metadata Reader` and `KePub Metadata Reader` make it possible to read and write
metadata to `.kepub` files which is especially useful.

#### Exporting and Importing Settings and Libraries

This section explains how to export and import the settings of one calibre instance to another.
It is based on a
[reddit comment by dwhitzzz](https://www.reddit.com/r/Calibre/comments/1313kix/comment/mo4b9rn).

To export the settings and libraries of a calibre instance open the corresponding instance and then
right-click the `calibre` Button on the top menu.
Select `Export/import all calibre data`, select the export or import option and then follow the
instructions.
Please note that the export only works when an empty folder is selected.
All calibre data will then be exported into the selected directory.
For the import process the folder that includes the calibre data has to be selected.

## Troubleshooting

This section will focus on errors and the fixing of errors of calibre.

### Troubleshooting for the Web Version

This section focuses on the basic usage of calibre's web version.

#### Problems Logging in With Reverse Proxy

It is [a known problem](https://github.com/janeczku/calibre-web/issues/2916?utm_source=chatgpt.com)
not being able to login when using a [reverse proxy](/wiki/reverse-proxy.md) like
[Nginx](/wiki/nginx.md) or [Traefik](/wiki/traefik.md).
In this case a 504 error will be displayed.
According to various sources this can be fixed by trying previous sections until it works again.
