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

For using or changing of the title, sort title, author or author title check
[the corresponding entry](#changing-the-default-author-and-title-sort).

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
