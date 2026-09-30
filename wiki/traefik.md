# Traefik

[Traefik](https://github.com/traefik/traefik) is a http reverse proxy with
a special integration of infrastructure components (e.g. [Docker](/wiki/docker.md)).
It can be used to route requests to services that are made available over the [web](/wiki/web.md).

## Setup

The software can be setup via [Docker](/wiki/docker.md) with the
[traefik image](/wiki/docker/traefik.md).

## Usage

This section addresses the usage of Traefik.

### Redirections for Docker Service

It is assumed that the service already has a reverse proxy setup as described in the
[corresponding section](#reverse-proxies-for-docker-service)
For redirections to work they have to be added to the `data/config/dynamic.yml` file.

For this to work define them inside the `data/config/dynamic.yml` set up in the
[Docker image](/wiki/docker/traefik.md) under `middlewares:`.

Redirections are specified by Regex as shown in the following example.
`<redirection-name>` is the name of the redirection and `<regex>` the regular expression to replace
while `<replacement>` is the replacement of the regular expression.

```yml
    <redirection-name>:
      redirectregex:
        permanent: true
        regex: <regex>
        replacement: <replacement>
```

The `labels:` section of the [Docker](/wiki/docker.md) services that should use these redirections
have to be adapted.
The following line needs to be added.
`<service-name>` is the name of the service.

```yml
  - "traefik.http.routers.<service-name>.middlewares=<redirection-name>@file"
```

Make sure to add the domain that will be redirected to and from the labels aswell.
This will look similar like the following.
In this case the subdomains `<subdomain-1>` and `<subdomain-2>` under the domain `<domain>` is
available, but the exact look can vary since also different domains or more than two addresses can
be added.

```yml
  - "traefik.http.routers.<service-name>.rule=Host(`<subdomain-1>.<domain>`, `<subdomain-2>.<domain>`)"
```

#### Docker Redirection: Appending a `www.`

To always append a `www.` to the address the following redirection settings can be used.

```yml
    redirect-non-www-to-www:
      redirectregex:
        permanent: true
        regex: "^https?://(?:www\\.)?(.+)"
        replacement: "https://www.${1}"
```

Additionally, follow the setup regarding the service as explained in
[the general redirection section](#redirections-for-docker-service).

#### Docker Redirection: Removing a `www.`

To always remove a `www.` from the address the following redirection settings can be used.

```yml
    redirect-www-to-non-www:
      redirectregex:
        permanent: true
        regex: "^https?://www\\.(.+)"
        replacement: "https://${1}"
```

Additionally, follow the setup regarding the service as explained in
[the general redirection section](#redirections-for-docker-service).

#### Docker Redirection: Redirect a Domain to Another

For a simple redirection that replaces a domain with another the following redirection settings can
be used.
This will redirect the domain `<domain-1>` (for example `www.abc.de`) to domain `<domain-2>` (for
example `123.xyz.eu`).

```yml
    redirect-<domain-1>-to-<domain-2>:
      redirectregex:
        permanent: true
        regex: "^https://<domain-1>(.*)"
        replacement: "https://<domain-2>${1}"
```

Additionally, follow the setup regarding the service as explained in
[the general redirection section](#redirections-for-docker-service).

### Reverse Proxies for Docker Service

To create a reverse proxy from a docker container add the following lines in the
`labels:` section of the `docker-compose.yml` of the service to proxy.

```yml
  - "traefik.enable=true"
  - "traefik.docker.network=proxy"
  - "traefik.http.routers.<service-name>-secure.entrypoints=websecure"
  - "traefik.http.routers.<service-name>-secure.rule=Host(`<subdomain>.<domain>`)"
  - "traefik.http.routers.<service-name>-secure.service=<service-name>"
  - "traefik.http.services.<service-name>.loadbalancer.server.port=<port>"
```

This configuration automatically redirects http to https.
When using this configuration the port specified in the latter lines can be
ommitted in the `ports:` section if not used directly.
This ensures access only via https and restricts access via ip and port.
Change `<service-name>` according to the service you want to publish and `<subdomain>` aswell as
`<domain>` to the domain you intent to publish the service to.

### Restrict Crawling and Expensive Requests for Docker Service

For public services it can be useful to discourage [indexing](/wiki/web_crawling.md) and to rate
limit expensive routes.
These settings are added to the `labels:` section of the proxied Docker service and therefore extend
the [reverse proxy setup](#reverse-proxies-for-docker-service).
The Traefik container itself is configured separately as described in the
[Docker image](/wiki/docker/traefik.md).

#### Prevent Search Engine Indexing

A response header can be added by defining a headers middleware and attaching it to the existing
secure router.

```yml
  - "traefik.http.middlewares.<service-name>-noindex.headers.customresponseheaders.X-Robots-Tag=noindex, nofollow, noarchive"
  - "traefik.http.routers.<service-name>-secure.middlewares=<service-name>-noindex"
```

This discourages compliant search engines from indexing, following and archiving the service.
It should be combined with an appropriate [`robots.txt`](/wiki/web_crawling.md#robotstxt) if the
application supports one.
This is not an access restriction and can be ignored by crawlers that do not respect these hints.

#### Rate Limit Selected Routes

A second router with a higher priority can be used to apply a stricter rate limit only to selected
routes while leaving the remaining service on the normal router.

```yml
  - "traefik.http.routers.<service-name>-limited.entrypoints=websecure"
  - "traefik.http.routers.<service-name>-limited.rule=Host(`<subdomain>.<domain>`) && PathRegexp(`<path-regex>`)"
  - "traefik.http.routers.<service-name>-limited.priority=100"
  - "traefik.http.routers.<service-name>-limited.service=<service-name>"
  - "traefik.http.middlewares.<service-name>-rate-limit.ratelimit.average=20"
  - "traefik.http.middlewares.<service-name>-rate-limit.ratelimit.period=1m"
  - "traefik.http.middlewares.<service-name>-rate-limit.ratelimit.burst=10"
  - "traefik.http.routers.<service-name>-limited.middlewares=<service-name>-rate-limit,<service-name>-noindex"
```

The example allows an average of 20 requests per minute with a burst of 10 requests for routes that
match `<path-regex>`.
The higher router priority makes sure matching requests use the limited router instead of the normal
service router.

As an example the following lines show an example [Gitea](/wiki/gitea.md) setup using Traefik.
Here expensive web code views can be matched separately from normal Git HTTP endpoints.
The following labels extend the standard Gitea reverse proxy configuration.

```yml
  - "traefik.http.middlewares.gitea-noindex.headers.customresponseheaders.X-Robots-Tag=noindex, nofollow, noarchive"
  - "traefik.http.routers.gitea-secure.middlewares=gitea-noindex"

  - "traefik.http.routers.gitea-code.entrypoints=websecure"
  - "traefik.http.routers.gitea-code.rule=Host(`git.<domain>`) && PathRegexp(`^/[^/]+/[^/]+/(src|commits|blame|compare|tree-view|raw)(/.*)?$`)"
  - "traefik.http.routers.gitea-code.priority=100"
  - "traefik.http.routers.gitea-code.service=gitea"

  - "traefik.http.middlewares.gitea-crawl-limit.ratelimit.average=20"
  - "traefik.http.middlewares.gitea-crawl-limit.ratelimit.period=1m"
  - "traefik.http.middlewares.gitea-crawl-limit.ratelimit.burst=10"
  - "traefik.http.routers.gitea-code.middlewares=gitea-crawl-limit,gitea-noindex"
```

The path expression targets repository web views such as `src`, `commits`, `blame`, `compare`,
`tree-view` and `raw`.
Git HTTP endpoints such as `info/refs` and `git-upload-pack` are not matched by this router and
continue to use the normal Gitea router.

