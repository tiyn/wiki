# OpenPGP

[OpenPGP](https://www.openpgp.org/) is the most widely used encryption standard proposed in from
[RFC 4880](https://datatracker.ietf.org/doc/html/rfc4880).

## Setup

There are different implementations of OpenPGP.
Many [Linux](/wiki/linux.md) [package managers](/wiki/linux/package_manager.md) 
package the implementation called [Gnu Privacy Guard](/wiki/linux/gpg.md) in the `gnupg` or
sometimes also `gpg` or `gpg2` package.

## Usage

This section addresses the usage of OpenPGP.
All topics regarding generation, export or editing keys are described in the specific implementation
of the OpenPGP standard – for example [PGP](/wiki/linux/gpg.md).

### Publishing PGP Keys

It sometimes can be useful to publicly publish your public key.
This is mostly done to verify mail addresses.
For this the public key is usually added be added on [keys.openpgp.org](https://keys.openpgp.org).
Select `upload` or `manage` on the website and follow instructions to set this up.
