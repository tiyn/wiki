# SSH

SSH is a network protocoll to securely connect to a computer.

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
