# PPSSPP

[PPSSPP](https://ppsspp.org/) is a [PlayStation Portable](/wiki/games.md)
[emulator](/wiki/games/emulators.md).

## Setup

PPSSPP can be installed on different systems, a list for this can be found on
the [PPSSPP website](https://ppsspp.org/downloads.html).
Additionally it can be installed using [Flatpak](/wiki/linux/flatpak.md) where the
package is called `org.ppsspp.PPSSPP`.

## Usage

The following sections describe specific issues relating to the configuration
and usage of PPSSPP.

### Steam Deck specific settings

The following settings are especially useful when emulating PSP games on the
[Steam Deck](/wiki/games/steam_deck.md) as pointed out by
[nchristopher](https://github.com/nchristopher/steamdeck-emulation/blob/main/emulators/ppsspp.md).
But it is a good starting point for other systems aswell.
It is important to emphasize that the system needs to meet the requirements to
run Vulkan.
The Device name will change if you are not using a
[Steam Deck](/wiki/games/steam_deck.md).

- Backend: `Vulkan`
- Device: `AMD RADV VANGOGH`
- Fullscreen: `on`
- VSync: `on`
- Rendering solution: `Auto (1:1)`
- Upscale level: `2x`
- Upscale type: `Hybrid + Bicubic`
- Deposterize: `on`
