# Traefik

[Traefik](https://github.com/traefik/traefik) is a http reverse proxy with
a special integration of infrastructure components (e.g. [Docker](./docker.md)).

## Setup

The software can be setup via [Docker](/wiki/docker.md) with the
[traefik image](./docker/traefik.md).

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

Additionally follow the setup regarding the service as explained in
[the general redirection sectino](#redirections-for-docker-service).

#### Docker Redirection: Removing a `www.`

To always remove a `www.` from the address the following redirection settings can be used.

```yml
    redirect-www-to-non-www:
      redirectregex:
        permanent: true
        regex: "^https?://www\\.(.+)"
        replacement: "https://${1}"
```

Additionally follow the setup regarding the service as explained in
[the general redirection sectino](#redirections-for-docker-service).

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

Additionally follow the setup regarding the service as explained in
[the general redirection sectino](#redirections-for-docker-service).

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
