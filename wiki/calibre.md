# Calibre

[Calibre](https://calibre-ebook.com/) is a cross-platform, free and open-source
software suite for [e-book](/wiki/e-books.md) management.
It supports various formats aswell as conversion between them.

## Usage

## Adding a Plugin

A plugin by a third party can be added by selecting a `.zip` archive - usually
named `<plugin name>_plugin.zip` - under Preferences, Plugins, Load plugin from
file.

## Exporting Books

Books can be exported by selecting them and pressing `Save to disk`.
After selecting a path the books will be saved there.
Preferences for this can be set under `Preferences` and `Saving books to disk`.
Especially the creation of separate image and metadata files are often of
interest.

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

## Changing the Default Author and Title Sort

Under `Preferences` and `Tweaks` the corresponding settings to change the title
and author sort name can be found.

`Author sort name algorithm` defines the author sort name.
By setting `author_sort_copy_method = 'copy'` the author sort name is the same
as the author name.
After this setting has been changed right click `Authors` in the navigation bar
on the left side and press `Manage Authors`.
Then press `Recalculate all author sort values` for the change to take effect.

`Control sorting of titles and series in the library display` defines the sort
titles.
Setting `title_series_sorting = 'strictly_alphabetic'` will use the standard
title and wont make articles of titles suffixes.
Afterwards select all books, right-click and select `Edit metadata in bulk`
under `Edit metadata`.
Then check the box `update title sort` and press `Ok` to update all sort titles.

This entry is based on two posts on mobileread - one regarding the
[sort author name](https://www.mobileread.com/forums/showthread.php?t=314663)
and the other regarding the
[sort title](https://www.mobileread.com/forums/showthread.php?t=249870).

## Transfer Books to a Device

To transfer books to a device connect a e-reader to the computer.
After a while calibre should recognize the device which will be apparent by the appearance of
additional buttons on the top menu like the `Send to device`- and the `Device`-Button.
First make sure only the formats you want will be transfered.
This can be done by selecting `Device`, `File formats` and checking the formats as needed.
Afterwards select the books and press `Send to device` to start the process of transfering the
devices.
Alternatively only specific formats of the books can be send to the device by selecting
`Send specific format to` and `Main memory` under the `Send to device` menu.
If there are books that contain series metadata make sure to disconnect the e-reader once and
reconnect it.
Afterwards select `Update cached metadata on device` under `Device` to update the metadata
including the series.
Finally disconnect the device.
