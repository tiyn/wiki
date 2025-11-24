# FairEmail

[FairEmail](https://email.faircode.eu/) is a free and open-source email client for
[Android](/wiki/android.md).

## Setup

On [Android](/wiki/android.md) FairEmail is available on [F-Droid](/wiki/android/f-droid.md) in a
package called [FairEmail](https://f-droid.org/en/packages/eu.faircode.email/).
Additionally it is available on the[Google Play store](/wiki/android.md#app-store) in a package
called [FairEmail](https://play.google.com/store/apps/details?id=eu.faircode.email&hl=de).

## Usage

This section addresses the usage of FairEmail.

### Use PGP Key for Encryption, Decryption and Signing

FairEmail can use [OpenPGP](/wiki/openpgp.md) to sign, encrypt or decrypt mails.
To achieve this download [OpenKeychain](https://www.openkeychain.org/).
To connect FairEmail with OpenKeychain navigate to the settings and select `Encryption`.
There the provider of OpenPGP (`OpenPGP provider`) can be set to OpenKeychain
(`org.sufficientlysecure.keychain`).
Using OpenKeychain PGP keys can then be imported and stored.

After this is done outgoing mails can be encrypted by signed or encrypted by selecting the
`Encrypt` selection on the top bar when writing emails.

Decryption can be done by clicking on the padlock when inside an email that is encrypted.

Additionally in the settings under `Encryption` the signing (`Sign by default`), encryption
(`Sign and encrypt by default`), decryption (`Auomatically decrypt messages`) and validation
(`Automatically verify signed messages`) can be set to occurr automatically.
