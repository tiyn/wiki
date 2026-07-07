# DNS

The Domain Name System (DNS) is a naming system for computers or other resources
connected to a network.
It associates various information with domain names.

## Software suites for DNS interaction

The following list shows possible DNS software suites that can be used to set
up a DNS server.

- [Bind](/wiki/bind.md) is a open source package for setting up DNS

## Records

### A record

A (address) records map hostnames to an IP.
Its basic structure is:

```txt
name.        A      IP
```

Where `name` is the domain to map the `IP` to and `A` is the constant for
the type of the record.

### AAAA record

AAAA records are IPv6 address records that map hostnames to an IPv6 address.
Its basic structure is the following.

```txt
<name>.        AAAA   <IPv6>
```

Where `<name>` is the domain to map the IPv6 address – in this case  `<IPv6>` – to and `AAAA` is the
constant for the type of the record.

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

### MX record

Mail Exchange – often shortened to MX – records specify which mail server is responsible for
receiving emails for a domain.
Its basic structure is the following.

```txt
<name>.        MX     <priority> <target>.
```

Where `<name>` is the domain to receive mail for, `<priority>` is the preference of the mail server
(lower values are preferred), `<target>` is the hostname of the mail server and `MX` is the constant
for the type of the record.

The target of an MX record must resolve to an A or AAAA record.

### TXT record

TXT – short for text – records associate arbitrary textual information with a domain.
Its basic structure is the following.

```txt
<name>.        TXT    "<text>"
```

Where `<name>` is the domain to associate the content – in this case `<text>` with and `TXT` is the
constant for the type of the record.

TXT records are commonly used for domain verification as well as technologies such as
[SPF](/wiki/email.md#spf-record), [DKIM](/wiki/email.md#dkim-record) and
[DMARC](/wiki/email.md#dmarc-record).

### PTR record

Pointer – often shortened to PTR – records map an IP address back to a hostname.
Its basic structure is the following.

```txt
<ip>.          PTR    <hostname>.
```

Where `<ip>` is the reverse DNS representation of an IP address, `<hostname>` is the canonical
hostname and `PTR` is the constant for the type of the record.

PTR records are part of the reverse DNS namespace and are usually managed by the owner of the IP
address rather than the owner of the domain.
Therefor, they usually have to be set on the domain management website or (if accessible) directly
in the DNS server.
