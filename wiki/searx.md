# Searx

[Searx](https://searx.me) is a free metasearch engine.

## Setup

The software can be setup via Docker with the
[searx image](./docker-images/searx_-_searx.md).

## Adding to Firefox

Add Searx as a new search engine for firefox and set it as main search for the
address bar as described in [the Firefox article](./firefox.md).
Follow the add-on part of the guide and put searx with
`<url to searx instance>/search?q=%s` as search string.

## Route search traffic through tor

You can setup a torproxy with [the dperson image](./docker-images/dperson_-_torproxy.md).
In the `settings.yml` file locate the section for `proxies :` and
change it to the following:

```txt
proxies :
    http : socks5://<path to torproxy server>:9050
    https: socks5://<path to torproxy server>:9050
```
