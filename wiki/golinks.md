# Golinks

[Golinks](https://github.com/prologic/golinks) is a web app that can create and
use bookmarks and run different searches by prefixes.

## Server

A server can be setup via docker with the [prologic image](./docker-images/prologic_-_golinks.md).

## Client

### Firefox

Add Golinks as a new search engine for firefox and set it as main search for the
address bar as described in [the Firefox article](./firefox.md).
Follow the add-on part of the guide and put searx with
`<url to golinks instance>/?q=%s` as search string.
