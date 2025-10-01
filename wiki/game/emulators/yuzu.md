# yuzu

[yuzu](https://yuzu-emu.org/) is a [Nintendo Switch](/wiki/game.md)
[emulator](/wiki/game/emulators.md).

## Setup

yuzu can be installed on different systems, a list for this can be found on
the [yuzu website](https://yuzu-emu.org/downloads/#windows).
Additionally it can be installed using [Flatpak](/wiki/linux/flatpak.md) where the
package is called `org.yuzu_emu.yuzu`.

After installation keys need to be added.
A guide on this can be found on the
[yuzu website](https://yuzu-emu.org/help/quickstart/#setting-up-the-decryption-keys-and-firmware).

## Usage

The following sections describe specific issues relating to the configuration
and usage of Dolphin.

### Start Emulated Game in Fullscreen Mode

In different scenarios it can be useful to start directly into a game in fullscreen mode.
One example would be using the [Steam Deck](/wiki/game/steam_deck.md) to
[set up a game in the Steam UI](/wiki/game/steam_deck.md#running-a-game-directly-through-the-interface)
so it can be run directly without switching to the desktop mode.
For this add the `-f` flag for fullscreen mode aswell as the `-g` flag in front of the path to the
game that should to be started.

### Steam Deck Specific Settings

The following settings are especially useful when emulating games on the
[Steam Deck](/wiki/game/steam_deck.md) as pointed out by
[sofakng](https://www.reddit.com/r/SteamDeck/comments/12ivsky/what_are_the_best_yuzu_settings/).

For a better performance select `Vulkan` under the `Graphics` in `Graphics`.
If crashes happen switch the option back to `OpenGL`
Under the `Advanced` tab set the following.

- Enable `Use asynchronous shader building (Hack)`
- Set `GPU Accuracy` to  `Normal`
- Enable `Use Fast GPU Time (Hack)`

Under `System` set the memory option to `Extended memory layout (8GB DRAM)`.
