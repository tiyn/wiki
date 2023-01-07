# Samba

[Samba](../samba.md) is the standard Windows interoperability suite for linux
and unix.

## Usage

### Manual Mounting

The mounting of Samba shares requires a package containing `mount.cifs` in many
distributions packaged in the `cifs-utils` package to be installed.
Samba shares then can be mounted by adapting and running the following example:
`mount -t cifs //<server address>/<share name> <path to mount point> -o username=<username>,password=<password>`

### Automatic Mounting

The mounting of Samba shares requires a package containing `mount.cifs` in many
distributions packaged in the `cifs-utils` package to be installed.
To automount Samba shares the following line has to be adapted and added
to `/etc/fstab`:
`//<server address>/<share name>   <path to mountpoint>     cifs,nofail     credentials=<path to authentication file>      0 0`.
An authentication file looks like the following:

```txt
username=<username>
password=<password>
```
