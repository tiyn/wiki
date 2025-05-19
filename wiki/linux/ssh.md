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

To mount a directory (in this case called `directory`) from a remote server
(in this case called `server` also can be substituted by something like
`user@server-ip`) on a local mount (in this case `mountpoint`) run:

```sh
sshfs server:/directory mountpoint
```

### Shorten SSH Connection Commands

By adding the following lines to the file `~/.ssh/config` the command of an SSH
connection can be shortened from `ssh user@server.tld` to `ssh server`.

```txt
Host server
	HostName server.tld
	User user
```

### Server Setup 

[Source](https://tutorials.rc.nectar.org.au/x11forwarding/02-enable-x11-on-virtual-machine)
For the server setup edit the file `/etc/ssh/sshd_config` and make sure X-Forwarding is enabled by
editing a line to look like the following.

```txt
X11Forwarding yes
```

Make sure to restart the SSH daemon afterwards by running the following command.

```sh
service sshd restart
```

Afterwards X-Forwarding should be enabled on the server.
For full functionality install the `x11-apps` package aswell.

#### Client Setup

Auf dem Server ist das so genannte X-Forwarding aktiviert.
Das bedeutet, dass es möglich ist, graphische Programme aufzurufen und diese über eine SSH-Verbindung darstellen zu lassen.
Bei einem klassischen Login mittels des Terminals und dem `ssh`-Befehl kann dieser um die Flag `-C` erweitert werden
Der komplette Befehl sieht dann wie folgt aus, wobei sich der Name für `<host>` aus dem [Setup-Abschnitt](#setup) ergibt.

```sh
ssh -C <host>
```

Die `-C`-Flag kann in der [`config`-Datei](#setup) vermerkt werden, sodass sie nicht extra angeführt werden muss.
Dafür müssen die beiden folgenden Zeilen in die `config` unter dem entsprechenden Eintrag eingefügt werden.

```
    ForwardX11 yes
    ForwardX11Trusted yes
``` 

Die Funktion des X-Forwardings kann geprüft werden, indem man sich beim Server einloggt und dann `xclock` aufruft.
Bei korrekter Konfiguration sollte sich nun eine graphische Oberfläche öffnen, die die Uhrzeit anzeigt.
