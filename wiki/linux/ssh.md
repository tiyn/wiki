# SSH

SSH is a network protocoll to securely connect to a computer.
In this article it is assumed that `openssh` is used.

## Generate new keys

To generate new ssh keys simply run `ssh-keygen -t ed25519` or
`ssh-keygen -t rsa -b 4096`.

## Enable root login via SSH

Edit the `/etc/ssh/sshd_config` and change the line containing `PermitRootLogin`
to `PermitRootLogin yes`.

## Add login via SSH public key

To enable easy login without password you can add the contents of the file
`~/.ssh/id_rsa.pub` from your local machine to the file `~/.ssh/authorized_keys`
on the machine you want to log into.
You can use the modified command below for ease of use:

```shell
cat ~/.ssh/id_rsa.pub | ssh username@server 'cat >> ~/.ssh/authorized_keys'
```

## Mount directory with sshfs

To mount a directory (in this case called `directory`) from a remote server
(in this case called `server` also can be substituted by something like
`user@server-ip`) on a local mount (in this case `mountpoint`) run:

```shell
sshfs server:/directory mountpoint
```
