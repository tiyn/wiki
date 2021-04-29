# Searx

[Searx](https://searx.me) is a free metasearch engine.

## Server

A server can be setup via docker with the [searx image](./docker-images/searx_-_searx.md).

## Adding to Firefox

Add Searx as a new search engine for firefox and set it as main search for the
address bar as described in [the Firefox article](./firefox.md).
Follow the addon part of the guide and put searx with
`<url to searx instance>/search?q=%s` as search string.
