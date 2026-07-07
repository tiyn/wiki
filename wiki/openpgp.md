# OpenPGP

[OpenPGP](https://www.openpgp.org/) is the most widely used open standard for end-to-end encryption
and digital signatures.
It is standardized by [RFC 4880](https://datatracker.ietf.org/doc/html/rfc4880).

## Concepts

OpenPGP uses asymmetric cryptography.

Every user owns a key pair consisting of two keys.
The first is the public key, which can safely be shared with everyone.
The second is the private key, which must never leave the owner's control.

The public key is used by others to encrypt messages or verify digital signatures.
The private key is used to decrypt received messages and to create signatures.

Unlike transport encryption (TLS), OpenPGP protects the content of an email itself.

## Setup

There are different implementations of OpenPGP.
Many [Linux](/wiki/linux.md) [package managers](/wiki/linux/package_manager.md) package the
implementation called [Gnu Privacy Guard](/wiki/linux/gpg.md) in the `gnupg`, `gpg` or `gpg2`
package.

## Usage

OpenPGP is commonly used to encrypt or sign files and email.

The management of keys is implementation specific and is described in the corresponding
implementation.
For the most common implementation see the [GPG entry](/wiki/linux/gpg.md).

Mail clients such as
[Thunderbird](/wiki/thunderbird.md#use-openpgp-for-encryption-decryption-and-signing) can directly
use existing OpenPGP keys.

### Publishing PGP Keys

It sometimes can be useful to publicly publish a public key.
This allows other users to easily obtain the key for encrypted communication.

One commonly used public key server is [keys.openpgp.org](https://keys.openpgp.org).

Select `Upload` or `Manage` on the website and follow the instructions.
