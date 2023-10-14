# Guild Wars 2

[Guild Wars 2](https://www.guildwars2.com) is a MMORPG [game](/wiki/games.md) which is available as
a standalone Launcher for Windows and on [Steam](./steam.md).

## Add-ons

Guild Wars 2 features a large add-on community.
All add-ons described in this guide will assume
[gw2-add-on-loader](#gw2-add-on-loader) is already installed.
It has to be set up first if not already done.
Additionally this guide assumes the usage of DX11 rendering which is enabled by
default.
Many of the following add-ons are on the
[Approved-Addons list by gw2-addon-loader](https://github.com/gw2-addon-loader/Approved-Addons).

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
Proceed to place the files and folders from the `.zip` archive into the root
directory of guild wars 2.

This add-on loader is capable of loading both DX9 and DX11 add-ons.
This functionality can be added with [d3d9_wrapper](#d3d9wrapper).
The installation of it is therefore recommended.

This add-on does not need to be updated often.
It only is required when Guild Wars 2 switches its API.

### d3d9_wrapper

[d3d9_wrapper](https://github.com/gw2-addon-loader/d3d9_wrapper) is a wrapper
to the d3d9 API that includes d3d9 loading.
Download the current version from the
[releases page](https://github.com/gw2-addon-loader/d3d9_wrapper/releases).
and move the downloaded `.dll` file to
`gw2_root_directory/addon/d3d9_wrapper/gw2addon_d3d9_wrapper.dll`.

This add-on does not need to be updated often.
It only is required when Guild Wars 2 switches its API.

### arcdps

[arcdps](https://www.deltaconnected.com/arcdps/) is a damage meter.
Download the file `d3d11.dll` from
[their website](https://www.deltaconnected.com/arcdps/x64/).
and move the downloaded `.dll` file to
`gw2_root_directory/addons/arcdps/gw2addon_arcdps.dll`.
This extension can be opened with the hotkey `Alt-Shift-T`.

arcdps' font can be easily changed.
For this a `.ttf` file is needed.
By moving and renaming the file to `gw2_root_directory/addons/arcdps/arcdps_font.ttf` the new font
will be enabled following the next start of Guild Wars 2.
A font similar to the default Guild Wars 2 font is Lato.
Lato can be downloaded from the [Google fonts website](https://fonts.google.com/specimen/Lato).

This add-on and its sub-add-ons needs to be updated regularly to work correctly.

#### boon-tables

The [boob-tables extension](https://github.com/knoxfighter/GW2-ArcDPS-Boon-Table/) displays the boon
stats which are not easily readable otherwise.
Download the current version of the
[gw2-arcdps-boon-table](https://github.com/knoxfighter/GW2-ArcDPS-Boon-Table/releases)
and move the downloaded `.dll` file to
`gw2_root_directory/addons/arcdps/d3d9_arcdps_table.dll`.
This extension can be opened with the hotkey `Alt-Shift-B`.

#### clears

The [clears extension](https://github.com/gw2scratch/arcdps-clears) displays the raids that have
been cleared by the squad members.
Download the current version of the
[arcdps-clears](https://github.com/gw2scratch/arcdps-clears/releases)
and move the downloaded `.dll` file to
`gw2_root_directory/addons/arcdps/arcdps_clears.dll`.
This extension can be opened with the hotkey `Alt-Shift-C`.

#### commanders_toolkit

The [commanders_toolkit extension](https://github.com/RaidcoreGG/GW2-CommandersToolkit) provides a
menu to note the roles and responsibilities of squad members.
Download the current version of the
[GW2-CommandersToolkit](https://github.com/RaidcoreGG/GW2-CommandersToolkit/releases)
and move the downloaded `.dll` file to
`gw2_root_directory/addons/arcdps/arcdps_commanderstoolkit.dll`.
This extension can be opened with the hotkey `Alt-Shift-Q`.

#### food-reminder

The [food-reminder extension](https://github.com/Zerthox/arcdps-food-reminder) displays the foods
that were consumed by squad members.
Download the current version of the
[arcdps-food-reminder](https://github.com/Zerthox/arcdps-food-reminder/releases)
and move the downloaded `.dll` file to
`gw2_root_directory/addons/arcdps/arcdps_food_reminder.dll`.
This extension can be opened with the hotkey `Alt-Shift-F`.

#### killproof.me

The [killproof.me extension](https://github.com/knoxfighter/arcdps-killproof.me-plugin)
provides an overview of the raid stats of squad members via the website
[killproof.me](https://killproof.me/).
For it to function in different instances [the unofficial_extras extension](#unofficialextras) is
needed.
Download the current version of
[arcdps-killproof.me-plugin](https://github.com/knoxfighter/arcdps-killproof.me-plugin/releases)
and move the downloaded `.dll` file to
`gw2_root_directory/addons/arcdps/d3d9_arcdps_killproof_me.dll`.
This extension can be opened via the extensions menu of the original arcdps
settings.

#### know thy enemy

The [know thy enemy extension](https://github.com/typedeck0/Know-thy-enemy)
provides an overview of the enemies of the last fight in WvW.
Download the current version of
[know-thy-enemy](https://github.com/typedeck0/Know-thy-enemy/releases)
and move the downloaded `.dll` file to
`gw2_root_directory/addons/arcdps/know_thy_enemy.dll`.
This extension can be opened via the extensions menu of the original arcdps
settings.

#### mechanics

The [mechanics extension](https://github.com/knoxfighter/GW2-ArcDPS-Mechanics-Log/) is a log of
mechanics for various strikes, fractals and raids.
Download the current version of
[gw2-arcdps-mechanics-log](https://github.com/knoxfighter/GW2-ArcDPS-Mechanics-Log/releases)
and move the downloaded `.dll` file to
`gw2_root_directory/addons/arcdps/d3d9_arcdps_mechanics.dll`.
This extension can be opened via the extensions menu of the original arcdps
settings.

#### unofficial_extras

The [unofficial_extras extension](https://github.com/Krappa322/arcdps_unofficial_extras_releases)
provides additional infos to other arcdps extensions and is not useful by itself.
Download the current version of
[arcdps_unofficial_extras_releases](https://github.com/Krappa322/arcdps_unofficial_extras_releases/releases)
and move the downloaded `.dll` file to
`gw2_root_directory/addons/arcdps/arcdps_unofficial_extras.dll`.

#### uploader

The [uploader extension](https://github.com/nbarrios/arcdps-uploader) provides an easy way to upload
EVTC combat logs from inside the game.
Download the current version of the
[arcdps-uploader](https://github.com/nbarrios/arcdps-uploader/releases)
and move the downloaded `.dll` file to
`gw2_root_directory/addons/arcdps/d3d9_uploader.dll`.
This extension can be opened with the hotkey `Alt-Shift-U`.

### gw2radial

[gw2radial](https://github.com/Friendly0Fire/GW2Radial) is a add-on for Guild
Wars 2 that allows faster access to markers, mounts and novelties.
Download the current version from the
[releases page](https://github.com/gw2-addon-loader/GW2Radial/releases).
and move the downloaded `.dll` file to
`gw2_root_directory/addons/gw2radial/gw2addon_gw2radial.dll`.
This extension can be opened with the hotkey `Alt-Shift-M`.

This add-on does not need to be updated often.
Updates are only required to get new functions working for example when new
mounts are added.
