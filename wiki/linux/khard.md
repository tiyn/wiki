# Khard

[Khard](https://github.com/lucc/khard) is a adressbook that runs in your
[terminal](/wiki/system_console.md).
You can sync it with [vdirsyncer](vdirsyncer.md).

## Setup

On most linux distributions Khal can be installed with the `khard` package.
Alternatively it can be installed via [GitHub](https://github.com/lucc/khard).

### Configuration

- Add and configure a config for khard
  - `mkdir ~/.config/khard` - add a directory for the config
  - `cp /usr/share/doc/khard/khard.conf.example ~/.config/khard/khard.conf` -
  Copy the example configuration
  - Adjust `khard.conf` to your needs

#### Mutt

It is possible to use your khard-addressbook in mutt.
To see how it works check out the [Mutt](/#application/neomutt.md).
