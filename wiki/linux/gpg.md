# GPG

[GNU Privacy Guard](https://gnupg.org/) - short GnuPG or just GPG - is a free and open-source
implementation of OpenPGP from [RFC 4880](https://datatracker.ietf.org/doc/html/rfc4880).
It is used to savely encrypt and decrypt messages or files using assymetric encryption.

## Setup

On most linux distributions GPG can be installed with the `gnupg` package. 
Sometimes it is also called `gnupg2`.

## Usage

This section addresses the usage of the Open GPG.

### Generating a Key Pair

A fast way to generate a key pair is by running the following command.

```sh
gpg --generate-key
```

### Backing Up and Exporting Keys

A total backup or the export of all private, public and subkeys can be achieved by running the
following commands.
Replace `<id>` with the identifier of the key that should be backed up.

```
gpg --export --armor <id> > <id>.pub
gpg --export-secret-keys --armor <id> > <id>.prv
gpg --export-secret-subkeys --armor <id> > <id>_priv.asc
gpg --export-ownertrust > ownertrust.txt
```

Especially the first command can be run in individually to export public keys without owning the
private key.

### Import Keys

Keys that have been imported in the way described in
[the previous section](#backing-up-and-exporting-keys) can be imported by the following commands.
Replace `<id>` with the identifier of the key that should be imported.

```sh
gpg --import <id>.pub
gpg --import <id>.priv
gpg --import <id>_priv.asc
gpg --import-ownertrust ownertrust.txt
```

Again the first command can be run individually to import single public keys that are not owned.

Afterwards the following commands can be run to set the ultimate trust level to the key pair.
Caution is advised.

```sh
gpg --edit-key [email protected]
gpg> trust
Your decision? 5
```

### Encrypting Files and Other Messages

A file - in this case named `message.txt` - can be encrypted using the a specific key with the
following command.
Replace `<id>` with the identifier of the key that should encrypt the message.

```sh
gpg -e -r <id> message.txt
```

This command will create a file with the same name as the input file but with an added `.gpg` - in
this case its called `message.txt.gpg`.

### Decrypt Files and Other Messages

A file - in this case named `message.txt.gpg` - can be decrypted with the following command.

```sh
gpg --decrypt message.txt.gpg
```

This command will output the content of the file.

### Restart the GPG Server

The GPG server can be restarted by simply running the following command.

```sh
gpgconf --kill all
```

### Receive a Key and Trust It

If importing a key does not properly work it can be useful to manually receive and trust a key.
This is done by running the following lines:
Caution is advised.
Replace `<id>` with the identifier of the key that should be received and trusted.

```sh
gpg --recv-key <id>
gpg --lsign <id>
```

## Troubleshooting 

This section will focus on errors and the fixing of errors of GPG.

### `keyblock resource '.../pubring.kbx': No such file or directory`

This error mostly occurs when updating packages via various
[package managers](/wiki/linux/package_manager.md).
It can easily be fixed by running the following command.
Which will (re-)generate the needed files and directories for GPG.

```sh 
dirmngr
```

### `gpg: keyserver receive failed: No data`

This error mostly occurs when updating packages via various
[package managers](/wiki/linux/package_manager.md).
It prevents specific packages from installing after the PGP key is not imported correctly.
This can be fixed by importing the PGP key manually by the following command.
In this command `<key-id>` is the id for the PGP key given by the package manager before the error
occurs.
`hkp://pgp.rediris.es` is a key server that can be used but other possibilities are available and
can and should be used depending on the location.

```sh 
gpg --keyserver hkp://pgp.rediris.es --recv-key <key-id>
```
