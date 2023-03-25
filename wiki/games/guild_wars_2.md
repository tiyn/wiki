# Guild Wars 2

[Guild Wars 2](https://www.guildwars2.com) is a MMORPG which is available as
a standalone Launcher for Windows and on [Steam](./steam.md).

## Add-ons

Guild Wars 2 features a large add-on community.
All add-ons described in this guide will assume
[gw2-add-on-loader](#gw2-add-on-loader) is already installed.
It has to be set up first if not already done.
Additionally this guide assumes the usage of DX11 rendering which is enabled by
default.

The following subsections assume that Guild Wars 2 is installed at
`gw2_root_directory`.
Replace this directory placeholder according to your installation.
Updating of the add-ons is done by downloading newer versions of the mentioned
files and replacing the old ones at the corresponding locations.

### gw2-add-on-loader

To make multiple add-ons work together an add-on loader is recommended.
One option for this is
[gw2-add-on-loader](https://github.com/gw2-addon-loader/loader-core).

Download the current version from the
[releases page](https://github.com/gw2-addon-loader/loader-core/releases).
Proceed to place the files in the Guild Wars 2 Directory according to the
installation instruction.
This files namely include the following:

- `gw2_root_directory/addonLoader.dll`
- `gw2_root_directory/d3d11.dll`
- `gw2_root_directory/dxgi.dll`
- `gw2_root_directory/bin64/d3d9.dll`

This add-on loader loads both DX9 and DX11 add-ons.
[d3d9_wrapper](#d3d9wrapper)  is needed for some functionality of the following
add-ons.
The installation of it is therefore recommended.

This add-on does not need to be updated often.
It only is required when Guild Wars 2 switches its API.

### d3d9_wrapper

[d3d9_wrapper](https://github.com/gw2-addon-loader/d3d9_wrapper) is a wrapper
to the d3d9 API that includes d3d9 loading.

Download the current version from the
[releases page](https://github.com/gw2-addon-loader/d3d9_wrapper/releases).
From there place the included Directory
`d3d9_wrapper/gw2addon_d3d9_wrapper.dll` in Guild Wars 2
`gw2_root_directory/addon` directory.

This add-on does not need to be updated often.
It only is required when Guild Wars 2 switches its API.

### arcdps

[arcdps](https://www.deltaconnected.com/arcdps/) is a damage meter.
Its menu is accessible in-game via the hotkeys `Alt-Shift-T`.

Download the file `d3d11.dll` from
[their website](https://www.deltaconnected.com/arcdps/x64/).
Then rename it to `gw2addon_arcdps.dll` and move it to a newly created
directory inside the Guild Wars 2 add-on directory
`gw2_root_directory/addons/arcdps/gw2addon_arcdps.dll`.

This add-on and its sub-add-ons needs to be updated regularly to work correctly.

#### boon-tables

There is an extension to the arcdps add-on regarding the boon stats which are
not easily readable otherwise.
For this download the current version of the
[gw2-arcdps-boon-table](https://github.com/knoxfighter/GW2-ArcDPS-Boon-Table/releases)
and move the downloaded `.dll` file without changing its name to
`gw2_root_directory/addons/arcdps/d3d9_arcdps_table.dll`.
This extension can be opened via the main menu of the original arcdps settings
with the `Boon Table` checkmark or with the hotkey `Alt-Shift-B`.

#### mechanics

Another extension to the arcdps addon is a log of mechanics for various
strikes, fractals and raids.
For this download the current version of
[gw2-arcdps-mechanics-log](https://github.com/knoxfighter/GW2-ArcDPS-Mechanics-Log/releases)
and move the downloaded `.dll` file without changing its name to
`gw2_root_directory/addons/arcdps/d3d9_arcdps_mechanics.dll`.
This extension can be opened via the extensions menu of the original arcdps
settings.

#### healing_stats

The following is an extension of the arcdps addon that allows easier readability
of healing.
For this download the current version of
[arcdps_healing_stats](https://github.com/Krappa322/arcdps_healing_stats/releases)
and move the downloaded `.dll` file without changing its name to
`gw2_root_directory/addons/arcdps/arcdps_healing_stats.dll`.
This extension can be opened via the extensions menu of the original arcdps
settings.

### gw2radial

[gw2radial](https://github.com/Friendly0Fire/GW2Radial) is a add-on for Guild
Wars 2 that allows faster access to markers, mounts and novelties.
It is accessible in-game via the hotkeys `Alt-Shift-M`.

Download the current version from the
[releases page](https://github.com/gw2-addon-loader/GW2Radial/releases).
Then place the folder `gw2radial_d3d9` which contains the file
`gw2addon_gw2radial_d3d9.dll` in the add-on directory of Guild Wars 2
`gw2_root_directory/addons`.

This add-on does not need to be updated often.
Updates are only required to get new functions working for example when new
mounts are added.
