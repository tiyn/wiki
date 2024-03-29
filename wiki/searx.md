# Searx

[Searx](https://searx.me) is a free metasearch engine.

## Setup

The software can be setup via [Docker](/wiki/docker.md) with the
[searx image](./docker/searx_-_searx.md).

## Usage

This section addresses various features of Searx.

### Browser support

Add Searx as a new search engine for firefox and set it as main search for the
address bar as described in [the Firefox article](./firefox.md).
Follow the add-on part of the guide and put searx with
`<url to searx instance>/search?q=%s` as search string.

### Route search traffic through tor

You can setup a torproxy with [the dperson image](./docker/dperson_-_torproxy.md).
In the `settings.yml` file locate the section for `proxies :` and
change it to the following:

```txt
proxies :
    http : socks5://<path to torproxy server>:9050
    https: socks5://<path to torproxy server>:9050
```
