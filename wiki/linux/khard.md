# Khard

[Khard](https://github.com/lucc/khard) is an address book that runs in your
[terminal](/wiki/linux/system_console.md).
You can sync it with [vdirsyncer](vdirsyncer.md).

## Setup

On most [Linux](/wiki/linux.md) distributions Khal can be installed with the `khard` package.
Alternatively it can be installed via [GitHub](https://github.com/lucc/khard).

### Configuration

- Add and configure a config for Khard
  - `mkdir ~/.config/khard` - add a directory for the config
  - `cp /usr/share/doc/khard/khard.conf.example ~/.config/khard/khard.conf` -
  Copy the example configuration
  - Adjust `khard.conf` to your needs

#### Mutt

It is possible to use your Khard address book in mutt.
To see how it works check out the [Mutt](/wiki/linux/neomutt.md).
