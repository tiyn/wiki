# PPSSPP

[PPSSPP](https://ppsspp.org/) is a Playstation Portable (PSP)
[emulator](./emulators.md).

## Setup

PPSSPP can be installed on different systems, a list for this can be found on
the [PPSSPP website](https://ppsspp.org/downloads.html).
Additionally it can be installed using [Flatpak](../linux/flatpak.md) where the
package is called `org.ppsspp.PPSSPP`.

## Configuration

The following sections describe specific issues relating to the configuration
of PPSSPP.

### [Steam Deck](./steam_deck.md) specific settings

The following settings are especially useful when emulating PSP games on the
[Steam Deck](./steam_deck.md) as pointed out by
[nchristopher](https://github.com/nchristopher/steamdeck-emulation/blob/main/emulators/ppsspp.md).
But it is a good starting point for other systems aswell.
It is important to emphasize that the system needs to meet the requirements to
run Vulkan.
The Device name will change if you are not using a
[Steam Deck](./steam_deck.md).

```txt
Backend: Vulkan
Device: AMD RADV VANGOGH
Fullscreen: on
VSync: on
Rendering solution: Auto (1:1)
Upscale level: 2x
Upscale type: Hybrid + Bicubic
Deposterize: on
```

### Running a game without selection in the menu

To run a game instantly the path to the [ROM](./emulators.md) needs to be
appended to the command used for starting PPSSPP.
This should be made in quotation marks as it could contain characters that need
to be escaped.
