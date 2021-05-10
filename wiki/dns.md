# DNS

The Domain Name System (DNS) is a naming system for computers or other resources
connected to a network.
It associates various information with domain names.

## Server

A server can be setup via docker with the [ventz image](./docker-images/ventz_-_bind.md)

## Records

### A record

A (address) records map hostnames to an IP.
Its basic structure is:

```txt
name.        A      IP
```

Where `name` is the domain to map the `IP` to and `A` is the constant for
the type of the record.

### CNAME record

CNAME (canonical name) records map one domain name to another.
Its basic structure is:

```txt
name.        CNAME  value.
```

Where `name` is the domain to map the `value` (another domain) to and `CNAME` is
the constant for the type of the record.

### SRV record

Service (SRV) records define the port and hostname for specified services.
Its basic structure is:

```txt
_service._proto.name. TTL class SRV priority weight port target
```

Where `_service` is the service name, `_proto` is the used protocoll (TCP/UDP),
`name` is the domain name to assign to, `TTL` is the DNS time to live, `class`
always is `IN`, `SRV` is the constant for the type of the record, `priority` is
the priority of the target host, `weight` is the relative weight for records
with the same priority, `port` is the port on that the service can be found and
`target` is the canonical hostname of the server.

Note that you need to create an A if you bind a service to a `name` that doesn't
already have one.
