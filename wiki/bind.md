# Bind

[Bind](https://www.isc.org/bind/) is an open-source software suite for
interacting with the [DNS](./dns.md).

## Setup

The software can be setup via docker with the
[ventz image](./docker/ventz_-_bind.md).

## Usage

The following sections describe various use cases for Bind and how to set up
specific domains.

### Configure Local DNS server with forwarding

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

### Configure local domains

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
@                                       NS          <servername>

<servername>                           A            <ip of server>
```


To make the server you operate on the nameserver select a subdomain for it and
subsitute `<servername>` for it and its IP address `<ip of server>`.
The following uses a filled in example with multiple subdomains.
It uses CNAME records as a placeholder for the ip.
In the last section the domain itself `home.server` is mapped to the ip
`192.168.178.16`.
This cannot be done with CNAME as `home.server` is already mapped as a
nameserver and assigning it multiple times is not supported.

```txt
$TTL 1D
@               IN SOA  home.server. kenny.home.server (
                                        200405191       ; serial
                                        8H              ; refresh
                                        4H              ; retry
                                        4W              ; expire
                                        1D )            ; minimum
@                                       NS      kenny

bag                                  IN CNAME   kenny
home                                 IN CNAME   kenny
links                                IN CNAME   kenny
search                               IN CNAME   kenny
speedtest                            IN CNAME   kenny
sync.kenny                           IN CNAME   kenny
www                                  IN CNAME   kenny

audio                                IN CNAME   quentin
insta                                IN CNAME   quentin
jelly                                IN CNAME   quentin
media                                IN CNAME   quentin
music                                IN CNAME   quentin
plex                                 IN CNAME   quentin
reddit                               IN CNAME   quentin
rss                                  IN CNAME   quentin
sync.quentin                         IN CNAME   quentin
transmission                         IN CNAME   quentin
tv                                   IN CNAME   quentin
twitter                              IN CNAME   quentin
yt                                   IN CNAME   quentin

folding                              IN CNAME   sheldon

home.server.                         IN A       192.168.178.16
localhost                            IN A       127.0.0.1
kenny                                IN A       192.168.178.16
mario                                IN A       192.168.178.15
quentin                              IN A       192.168.178.18
sheldon                              IN A       192.168.178.19
```

More [DNS records](./dns.md#records) can be added.
Most importantly used and needed for [reverse proxies](./reverse-proxy.md) are
[A records](./dns.md#a-record) and [CNAME records](./dns.md#cname-record).

Then create `/etc/bind/extra-zones/revp.178.168.192` and fill it with the
following lines.

```txt
$ORIGIN 178.168.192.in-addr.arpa.
$TTL 1D
@       IN SOA  <domain>.<tld>. <thisserver>.<domain>.<tld>. (
                        200405190       ; serial
                        28800           ; refresh
                        14400           ; retry
                        2419200         ; expire
                        86400           ; minimum
                        )
@                   IN  NS               <thisserver>.<domain>.<tld>.

<last part of ipv4> IN  PTR              <thisserver>.<domain>.<tld>.
```

Additionally add all domain names in front of the first `(` that have been
added in the `zone.<domain>.<tld>` file as an [A record](./dns.md#a-record).
Note that all these have to be followed by a `.` just like
`<thisserver>.<domain>.<tld>.` is.
For all these records add a PTR record too.
The first part of the PTR line is part of the IP address.
To get the full address add it to the subnet.
In this case this server has the IP `192.168.178.15`.

An example of `/etc/bind/extra-zones/revp.178.168.192` that is compatible with
the previous examples is shown in the following.

```txt
$ORIGIN 178.168.192.in-addr.arpa.
$TTL 1D
@       IN   SOA        home.server. kenny.home.server. (
                        200405190       ; serial
                        28800           ; refresh
                        14400           ; retry
                        2419200         ; expire
                        86400           ; minimum
                        )
@               IN      NS              kenny.home.server.
1               IN      PTR             fritz.box.
16              IN      PTR             kenny.home.server.
18              IN      PTR             quentin.home.server.
19              IN      PTR             sheldon.home.server.
```

According to your IPs and domains you may need to create multiple `revp.` or
`zone.` files and need to map them back to `named.conf.local`.
