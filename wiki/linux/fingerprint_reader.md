# Fingerprint Reader

Fingerprint readers can be used for local authentication on
[Linux](/wiki/linux.md) systems.

## Setup

Support for most fingerprint reader devices is provided by the `libfprint` library and the
`fprintd` daemon, which in turn need to be installed.
Many [Linux](/wiki/linux.md) distributions package both components directly under this name.

After installation restart the daemon.

```sh
sudo systemctl restart fprintd
```

By default enrolling fingerprints may require administrative privileges.
This can be changed using a `polkit` rule that allows members of the `wheel` group to enroll
fingerprints without using `sudo`.

Create the file `/etc/polkit-1/rules.d/49-fprint.rules`.

```sh
sudo vim /etc/polkit-1/rules.d/49-fprint.rules
```

Insert the following rule.

```txt
polkit.addRule(function(action, subject) {
    if (action.id == "net.reactivated.fprint.device.enroll" &&
        subject.isInGroup("wheel")) {
        return polkit.Result.YES;
    }
});
```

## Usage

This section addresses the usage of fingerprint readers.

### Enrolling a Fingerprint

A fingerprint can be registered using the following command.

```sh
fprintd-enroll
```

The program will repeatedly ask to place a finger on the reader until the fingerprint has been
successfully recorded.

### Listing Stored Fingerprints

Stored fingerprints of the current user can be displayed with the following command.
`<user>` describes the username to list fingerprints for.

```sh
fprintd-list <user>
```

Fingerprints of other users can be inspected using administrative privileges.

```sh
sudo fprintd-list root
```

### Removing Fingerprints

Fingerprints can be deleted using `fprintd-delete`.
The following displays the removal of a finger called `<finger>` (for example `right-index-finger`)
for a user called `<user>`.

```sh
sudo fprintd-delete <user> <finger>
```

### Using Fingerprints with `sudo`

Fingerprint authentication can be used with `sudo` through PAM.

Edit the configuration file.

```sh
sudo vim /etc/pam.d/sudo
```

Add the following line near the top of the file.
The line should be placed near the top of the file so that fingerprint authentication is attempted
before password authentication.

```txt
auth sufficient pam_fprintd.so
```

With this configuration the fingerprint reader can be used for `sudo` authentication while the
password remains available as a fallback.

## Troubleshooting

This section will focus on errors and the fixing of errors of fingerprint readers.

### Permission denied when enrolling fingerprints

When attempting to enroll a fingerprint the following error may occur:

```txt
EnrollStart failed: GDBus.Error:net.reactivated.Fprint.Error.PermissionDenied:
Not Authorized: net.reactivated.fprint.device.enroll
```

In this case `fprintd` requires elevated privileges to enroll fingerprints.

The issue can be solved by creating a `polkit` rule which allows members of the `wheel` group to
enroll fingerprints.

In this case the polkit rule `/etc/polkit-1/rules.d/49-fprint.rules` most likely was not set as
described in the [setup section](#setup).

After adding the rule the error should vanish.
The rule fingerprint enrollment can then be executed without `sudo`.

```sh
fprintd-enroll
```
