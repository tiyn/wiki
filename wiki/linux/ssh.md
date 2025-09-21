# SSH

SSH is a network protocoll to securely connect to a computer.
In this article it is assumed that `openssh` is used.

## Usage

### Generate New Keys

To generate new ssh keys simply run `ssh-keygen -t ed25519` or
`ssh-keygen -t rsa -b 4096`.

The keys can then be added to the authentication agent by as described in the
[corresponding article](#adding-keys-to-authentication-agent)

### Adding Keys to Authentication Agent

The following line will add a key to the authentication agent.

```ssh
ssh-add id_rsa
```

Depending on the name of the certificate inside the `~/.ssh` folder the name
`id_rsa` can vary.
For example `id_ed25519` is the name if the first generation option was chosen.

### Enable Root Login via SSH

Edit the `/etc/ssh/sshd_config` and change the line containing `PermitRootLogin`
to `PermitRootLogin yes`.

### Add Login via SSH Public Key

To enable easy login without password you can add the contents of the file
`~/.ssh/id_rsa.pub` from your local machine to the file `~/.ssh/authorized_keys`
on the machine you want to log into.
You can use the modified command below for ease of use:

```sh
cat ~/.ssh/id_rsa.pub | ssh username@server 'cat >> ~/.ssh/authorized_keys'
```

### Mount Directory With SSHFS

This section is loosely based on
[a GitHub comment by mlopezgva](https://github.com/VSCodium/vscodium/discussions/693).

To mount a directory (in this case called `directory`) from a remote server
(in this case called `server` also can be substituted by something like
`user@server-ip`) on a local mount (in this case `mountpoint`) run:

```sh
sshfs server:/directory mountpoint
```

This can be very useful when trying to code on a remote machine but wanting to use the local
instance of a text editor.

Services that are hosted and use ports on a remote server can be tunneled as described in
[the corresponding section](#port-tunneling) to setup complete remote development.

### Shorten SSH Connection Commands

By adding the following lines to the file `~/.ssh/config` the command of an SSH
connection can be shortened from `ssh user@server.tld` to `ssh server`.

```txt
Host server
	HostName server.tld
	User user
```

### X-Forwarding 

The following sections address the usage of X-forwarding which makes it possible to use graphical
programs remotely over SSH.

#### Enabling X-Forwarding on a Server

This section is based on a
[blog by rc nectar](https://tutorials.rc.nectar.org.au/x11forwarding/02-enable-x11-on-virtual-machine).
For the server setup of X-forwarding edit the file `/etc/ssh/sshd_config` and make sure 
X-forwarding is enabled by editing a line to look like the following.

```txt
X11Forwarding yes
```

Make sure to restart the SSH daemon afterwards by running the following command.

```sh
service sshd restart
```

Afterwards X-forwarding should be enabled on the server.
For full functionality install the `x11-apps` package aswell.

#### Enabling X-Forwarding on a Client

To use X-forwarding when connecting use the `-C` flag as shown in the following example.

```sh
ssh -C <host>
```

The `-C` flag can also be noted in the config file so that it does not have to be specified each
time.
This can be achieved by editing the config file which is located at `~/.ssh/config` and include the
following lines.

```
    ForwardX11 yes
    ForwardX11Trusted yes
``` 

The functionality of X-forwarding can easily be tested by running a graphical program when remotely
connected.
An example for this could be the simple clock program `xclock`.

### Port Tunneling

This section is based on the 
[documentation of PostgreSQL](https://www.postgresql.org/docs/current/ssh-tunnels.html).

A specific port can be tunneled from a remote host to a client via SSH.
This could be especially useful when coding remotely and wanting to access a database like
PostgreSQL or other services.
For the forwarding of a port run the following command. 
`<local address>` (for example `localhost`) and  `<local port>` (for example `63333`) are the
target (and most of the time local) address and port to tunnel the service to.
`<address of server>` (for example `joe@foo.com` or an alias) specifies the address and username of
the server that hosts the service and `<port of service>` (for example `5432`) describes the port
it is running at.

```sh
ssh -f -N -L <local port>:<local address>:<port of service> <address of server>
```

After running the command the tunnel will stay established until the process is killed.
This can be done by running a command identical or similar to the following which is used to find
the process.

```sh 
ps aux | grep "ssh -f -N -L <local port>"
```

Afterwards it can be killed by running the follwing command where `<process-id>` is the id of the
process found with the previous command.

```sh 
kill <process-id>
```

Files that are based on a remote server can be mounted as described in
[the corresponding section](#mount-directory-with-sshfs) to setup complete remote development.
