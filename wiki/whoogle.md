# Whoogle

[Whoogle](https://github.com/benbusby/whoogle-search) is a self-hostable
metasearch engine.

## Setup

The software can be setup via docker with the
[image by benbusby](./docker-images/benbusby_-_whoogle-search.md)

## Adding to Firefox

Add Whoogle as a new search engine for firefox and set it as main search for the
address bar as described in [the Firefox article](./firefox.md).
Follow the add-on part of the guide and put whoogle with
`<url to whoogle instance>/search?q=%s` as search string.
In rare cases the search string is different.
