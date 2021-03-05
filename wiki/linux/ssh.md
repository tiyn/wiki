# SSH

SSH is a network protocoll to securely connect to a computer.

## Enable root login via SSH

Edit the `/etc/ssh/sshd_config` and change the line containing `PermitRootLogin`
to `PermitRootLogin yes`.
