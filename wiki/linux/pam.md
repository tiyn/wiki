# PAM

PAM (Pluggable Authentication Modules) is the authentication framework used by most
[Linux](/wiki/linux.md) distributions.
It allows authentication methods to be configured independently of the applications using them.
This makes it possible to integrate passwords,
[fingerprint readers](/wiki/linux/fingerprint_reader.md), [FIDO2](/wiki/fido2.md) security keys and
other authentication mechanisms into services such as `sudo`, `login` and
[display managers](/wiki/linux/display_managers.md).

## Authenticate `sudo` with a FIDO2 Security Key

This section describes how to configure a FIDO2 security key for authentication when running `sudo`.
The following guide is based on a
[YouTube video by pixeledi](https://www.youtube.com/watch?v=e5k1ye-_tNs).

First install the required package [PAM U2F](https://github.com/Yubico/pam-u2f) with a
[package manager](/wiki/linux/package_manager.md) matching your
[Linux distribution](/wiki/linux.md#distributions).
It is often packaged under the name `pam-u2f`.

Next create an UDEV rule that allows access to the FIDO2 device.

```sh
echo 'KERNEL=="hidraw*", SUBSYSTEM=="hidraw", MODE="0664", GROUP="plugdev"' | sudo tee /etc/udev/rules.d/fido2-u2f.rules
```

Then create the configuration directory and generate the authentication mapping file.

```sh
mkdir -p ~/.config/fido2-u2f
cd ~/.config/fido2-u2f
pamu2fcfg > keys.txt
```

Open the PAM configuration for `sudo`.

```sh
sudo vim /etc/pam.d/sudo
```

Add the following line before all existing `auth` entries.
Replace `<username>` with the name of the current user.

```txt
auth            sufficient      pam_u2f.so      cue         authfile=/home/<username>/.config/fido2-u2f/keys.txt
```

The `cue` option causes PAM to prompt for user presence before requesting a touch on the security
key.
