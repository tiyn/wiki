# Khard

`khard` is a adressbook that runs in your terminal.
You can sync it with [vdirsyncer](vdirsyncer.md).

## Setup

### Arch Linux

- `pacman -S khard` - Install needed programs

### Configuration

- Add and configure a config for khard
  - `mkdir ~/.config/khard` - add a directory for the config
  - `cp /usr/share/doc/khard/khard.conf.example ~/.config/khard/khard.conf` -
  Copy the example configuration
  - Adjust `khard.conf` to your needs

#### Mutt

It is possible to use your khard-addressbook in mutt.
To see how it works check out the [Mutt](/#application/neomutt.md).
