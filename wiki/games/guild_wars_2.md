# Guild Wars 2

[Guild Wars 2](https://www.guildwars2.com) is a MMORPG which is available as
a standalone Launcher for Windows and on [Steam](./steam.md).

## Addons

Guild Wars 2 features a large addon community.
All addons described in this guide will assume
[gw2-addon-loader](#gw2-addon-loader) is already installed.
It has to be set up first if not already done.
Additionall this guide assumes you are using the `Enable DX9 Rendering` option
in the graphics tab of the settings.

### gw2-addon-loader

To make multiple addons work together an addon loader is recommended.
One option for thi is
[gw2-addon-loader](https://github.com/gw2-addon-loader/loader-core).

Download the current version from the
[releases page](https://github.com/gw2-addon-loader/loader-core/releases).
Proceed to place the files in the Guild Wars 2 Directory according to the
installation instruction.
This files namely include the following:

- `gw2_root_directory/addonLoader.dll`
- `gw2_root_directory/d3d11.dll`
- `gw2_root_directory/dxgi.dll`
- `gw2_root_directory/bin64/d3d9.dll`

This addon loader loads both DX9 and DX11 addons.
For the functionality to work [d3d9_wrapper](#d3d9wrapper) should be installed
aswell.

### d3d9_wrapper

[d3d9_wrapper](https://github.com/gw2-addon-loader/d3d9_wrapper) is a wrapper
to the d3d9 API that includes d3d9 loading.

Download the current version from the
[releases page](https://github.com/gw2-addon-loader/d3d9_wrapper/releases).
From there place the included Directory
`d3d9_wrapper/gw2addon_d3d9_wrapper.dll` in Guild Wars 2
`gw2_root_directory/addon` directory.

### arcdps

[arcdps](https://www.deltaconnected.com/arcdps/) is a damage meter.
It is accessible in-game via the hotkeys `Alt-Shift-T`.
The boon table is accessible in-game via the hotkeys `Alt-Shift-B`.

Download the file `d3d11.dll` from
[their website](https://www.deltaconnected.com/arcdps/x64/).
Then rename it to `gw2addon_arcdps.dll` and move it to a newly created
directory inside the Guild Wars 2 addon directory
`gw2_root_directory/addons/arcdps/gw2addon_arcdps.dll`.

There is an extension to this addon regarding the boon stats which are not
easily readable otherwise.
For this download the current version of the
[gw2-arcdps-boon-table](https://github.com/knoxfighter/GW2-ArcDPS-Boon-Table/releases)
and move the downloaded file without changing its name to
`gw2_root_directory/bin64/d3d9_arcdps_table.dll`.
This extension uses the same hotkey for the boon table as before.

### gw2radial

[gw2radial](https://github.com/gw2-addon-loader/GW2Radial) is a addon for Guild
Wars 2 that allows faster access to markers, mounts and novelties.
It is accessible in-game via the hotkeys `Alt-Shift-M`.

Download the current version from the
[releases page](https://github.com/gw2-addon-loader/GW2Radial/releases).
Then place the folder `gw2radial_d3d9` which contains the file
`gw2addon_gw2radial_d3d9.dll` in the addon directory of Guild Wars 2
`gw2_root_directory/addons`.
