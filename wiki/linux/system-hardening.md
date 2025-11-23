# System Hardening

System security is an important aspect of configuration.
It will make it harder for attackers to get a hold of your system and private
data.

## Analysis Tools

- [lynis](https://github.com/CISOfy/lynis): run `lynis audit system` to get a
  list of security flaws of your system
- [arch-audit](https://gitlab.archlinux.org/archlinux/arch-audit) is a tool to find vulnerabilities
  known to the [Arch](/wiki/linux/arch-linux.md) Security Team.

## Specific Steps to Harden a System

The following points are steps that harden a system.

- For [OpenSSH](/wiki/linux/openssh.md) enable hybrid post-quantum key exchange algorithms as
  described in the [corresponding entry](/wiki/linux/openssh.md#specify-key-exchange-algorithms).
  Using hybrid post-quantum-safe key exchange methods reduces the risk of so called "store-now,
  decrypt-later" attacks.
