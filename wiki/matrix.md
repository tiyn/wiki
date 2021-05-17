# Matrix

[Matrix](https://matrix.org) is an open communication protocol.

## Server

A (home-)server can be setup via docker with the
[matrixdotorg image](./docker-images/matrixdotorg_-_synapse.md).

After the setup the registration is disabled.
To enable registration go to the `homeserver.yaml`
and locate the following lines:

```yaml
## Registration ##

# Enable registration for new users.
enable_registration: False
```

Set `enable_registration` to `True` to enable sign up.

It is recommended to use a reverse proxy (like [nginx](./nginx.md)) for the 8008
port.
