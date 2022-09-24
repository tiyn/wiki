# Bind

[Bind](https://www.isc.org/bind/) is an open-source software suite for
interacting with the [DNS](./dns.md).

## Server

A server can be setup via docker with the
[ventz image](./docker-images/ventz_-_bind.md).

## Setup a local DNS server with forwarding

After setting up the server.
Look into the file `/etc/bind/named.conf.options`.
Change it to something like the following lines.
Note that `192.168.178.0/24` is the subnet that is used mainly in this example.
Only queries from within it will be handled.
The forwarders `8.8.8.8` and `8.8.4.4` can be changed according to the specific
needs.

```txt
acl "trusted" {
        192.168.178.0/24;
        localhost;
        localnets;
};

options {
        directory "/var/cache/bind";
        listen-on-v6 { any; };
        recursion yes;                 # enables resursive queries
        allow-query { trusted; };  # allows recursive queries from "trusted" clients
        allow-transfer { none; };      # disable zone transfers by default

        forwarders {
                8.8.8.8;
                8.8.4.4;
        };
        forward only;

        dnssec-enable yes;
          dnssec-validation yes;

        auth-nxdomain no;
};
```

## Creating local domains

This section explains how to add local domains for local systems.
It is explicitly compatible with the
[previous section](#setup-a-local-dns-server-with-forwarding).
Locate the `named.conf.local` file in the `/etc/bind` directory.
Add the forward zone first.
Substitute `<domain>` and `<tld>` to your wishes.

```txt
zone "<domain>.<tld>" IN {
        type master;
        file "/etc/bind/extra-zones/zone.<domain>.<tld>";
};
```

Then add the reverse zone.
The following lines assume the subnet is at `192.168.178.0/24`.
Note the reverse subnet address without the `.0/24` in the lines.

```txt
zone "178.168.192.in-addr.arpa" {
        type master;
        file "/etc/bind/extra-zones/revp.178.168.192";
};
```

Following this create the directory `/etc/bind/extra-zones/`.
Then place the file `zone.<domain>.<tld>` inside it with the following content:

```txt
$TTL 1D
@               IN SOA  <domain>.<tld>. <thisserver>.<domain>.<tld> (
                                        200405191       ; serial
                                        8H              ; refresh
                                        4H              ; retry
                                        4W              ; expire
                                        1D )            ; minimum
@                                       NS      <thisserver>

<thisserver>                           A               <ip of thisserver>
```

To make the server you operate on the nameserver select a subdomain for it and
subsitute `<thisserver>` for it and its IP address `<ip of thisserver>`.
More [DNS records](./dns.md#records) can be added.

Then create `/etc/bind/extra-zones/revp.178.168.192` and fill it with the
following lines.

```txt
$ORIGIN 178.168.192.in-addr.arpa.
$TTL 1D
@       IN SOA  <domain>.tld <thisserver>.<domain>.<tld>. (
                        200405190       ; serial
                        28800           ; refresh
                        14400           ; retry
                        2419200         ; expire
                        86400           ; minimum
                        )
                        NS              <thisserver>.<domain>.<tld>.

15                      PTR              <thisserver>.<domain>.<tld>.
```

Additionally add all domain names in front of the first `)` that have been
added in the `zone.<domain>.<tld>` file as an [A record](./dns.md#a-record).
Note that all these have to be followed by a `.` just like
`<thisserver>.<domain>.<tld>.` is.
For all these records add a PTR record too.
The first part of the PTR line indicated the IP address.
To get the full address add it to the subnet.
In this case this server has the IP `192.168.178.15`.
