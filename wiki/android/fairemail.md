# FairEmail

[FairEmail](https://email.faircode.eu/) is a free and open-source
[email client](/wiki/email.md#client) for [Android](/wiki/android.md).

## Setup

On [Android](/wiki/android.md) FairEmail is available on [F-Droid](/wiki/android/f-droid.md) in a
package called [FairEmail](https://f-droid.org/en/packages/eu.faircode.email/).
Additionally, it is available on the[Google Play store](/wiki/android.md#app-store) in a package
called [FairEmail](https://play.google.com/store/apps/details?id=eu.faircode.email&hl=de).

## Usage

This section addresses the usage of FairEmail.

### Add HTML Signature

FairEmail supports HTML signatures for individual email identities.
Navigate to `Settings`, `Manual setup`, `Identities` and select the respective identity.
There select `Edit signature`.
To add HTML directly, open the three-dots menu and switch to `HTML mode`.
Alternatively, use the import button to load an existing `.html` file.
Images stored locally should be embedded as Base64-encoded data URLs in the HTML, starting with
something similar to `<img src="data:image/png;base64,`.
Local file paths for images cannot be accessed and should not be used.

Check the resulting signature with a test email, since not all email clients support this format.

### Use PGP Key for Encryption, Decryption and Signing

FairEmail can use [OpenPGP](/wiki/openpgp.md) to sign, encrypt or decrypt mails.
To achieve this download [OpenKeychain](https://www.openkeychain.org/).
To connect FairEmail with OpenKeychain navigate to the settings and select `Encryption`.
There the provider of OpenPGP (`OpenPGP provider`) can be set to OpenKeychain
(`org.sufficientlysecure.keychain`).
Using OpenKeychain PGP keys can then be imported and stored.

Please note that keys only need to be imported once.
If the keys are changed, especially if identities are added or remove, the key inside the
OpenKeychain app can simply be updated by selecting the update button.
However, identities need to be removed manually sometimes.

After this is done outgoing mails can be encrypted by signed or encrypted by selecting the
`Encrypt` selection on the top bar when writing emails.

Decryption can be done by clicking on the padlock when inside an email that is encrypted.

Additionally, in the settings under `Encryption` the signing (`Sign by default`), encryption
(`Sign and encrypt by default`), decryption (`Auomatically decrypt messages`) and validation
(`Automatically verify signed messages`) can be set to occurr automatically.
