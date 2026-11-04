# FIDO2

[FIDO2](https://fidoalliance.org/fido2/) is an initiative to enforce multi-factor-authentication.

## Setup

For FIDO2 to work usually the package `libfido2` can be installed which will include the basic
setups.

## Usage

This section addresses various features of FIDO2.

### Use FIDO2 Security Keys on Android

On [Android](/wiki/android.md), [Authnkey](/wiki/android/authnkey.md) helps compatible FIDO2
security keys work with passkeys over NFC or USB, including PIN verification and stored passkeys.
It also works without Google Play Services and requires Android 14 or newer.

### Manage FIDO2 Security Keys on Android

On [Android](/wiki/android.md) compatible FIDO2 security keys can be managed using the
[Token2 Companion App](/wiki/android/token2_companion.md).

### Use FIDO2 on Linux with DM-Crypt

The usage of a FIDO2-Stick combined with [DM-Crypt](/wiki/linux/dm-crypt.md) is described in the
[corresponding section of the DM-Crypt entry](/wiki/linux/dm-crypt.md#use-fido2-to-unlock-a-volume).

### Lock a Linux Session on FIDO2 Key Removal

An active Linux session can automatically be locked when a FIDO2 security key is removed.
The required setup is described in the
[corresponding systemd section](/wiki/linux/systemd.md#lock-session-when-removing-a-fido2-security-key).
