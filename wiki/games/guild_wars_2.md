# Guild Wars 2

[Guild Wars 2](https://www.guildwars2.com) is a MMORPG [game](/wiki/games.md) which is available as
a standalone Launcher for Windows and on [Steam](./steam.md).

## Resources

There are many useful resources.
This section provides a select few of them.
They are grouped for a better overview.

The first group of resources can be used to make money on the trading post.

- [Craft To Gold](https://www.gw2craftgold.com/) analyzes crafting items to sell on the trading
  post.
- [GW2BLTC](https://www.gw2bltc.com) is for playing the trading post.
- [GW2TP](https://www.gw2tp.com/) analyzes the trading post.

The second group provides guides and builds.

- [Hardstuck](https://hardstuck.gg/gw2/builds/) provides guides but is most useful for its builds.
  Especially the PvP builds are good and well maintained.
- [MetaBattle](https://metabattle.com/wiki/MetaBattle_Wiki) provides guides and builds.
  Another interesting page of it is the best
  [spending of WvW points](https://metabattle.com/wiki/Guide:How_to_spend_WvW_Ability_Points).
- [Snow Crows](https://snowcrows.com/builds) is a guild that provides guides and builds that are
  especially well suited for instanced PvE content.

Finally the this groupd provides various guides and gives information on in-game mechanics.

- [\[fast\] Farming Community](https://fast.farming-community.eu/) is a guild that provides many
  useful trackers for items, dailies and more.
- [Guildwars 2 Wiki](https://wiki.guildwars2.com/wiki/Main_Page) is the official wiki.
- [GW2Crafts](https://gw2crafts.net/)  provides guides to level crafting.
- [killproof.me](https://killproof.me/) provides killproof for raids or strikes.
  It is also available as [add-on](#killproofme).

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

## Example Builds and Guides

The following sections contain builds that have been made for various game modes and roles.
They are sectioned by the game mode and role they are intended for though they maybe are playable in
other modes aswell.
This section focusses on specific builds and guides.
For more general guides on game modes or general tipps and tricks navigate to the
[resources section](#resources).

### WvW Builds

This section features builds for the WvW game mode.

#### WvW Roam Builds

The following list provides balanced builds for roaming.

- [Elemenatalist/Catalyst - WvW-Roam (Power Condition) Scepter+Dagger Celestial](https://guildjen.com/scepter-catalyst-roaming-build/)
  on GuildJen
- [Guardian/Willbender - WvW-Roam (Power Condition) Sword+Sword/Axe+Torch Celestial](https://guildjen.com/celestial-willbender-roaming-build/)
  on GuildJen
- [Necromancer/Core - WvW-Roam (Condition) Scepter+Warhorn/Staff Trailblazer](https://metabattle.com/wiki/Build:Necromancer_-_Core_Condi_Roamer)
  on MetaBattle
- [Ranger/Soulbeast - WvW-Roam (Power) Longbow/Greatsword Berserker](https://guildjen.com/sic-em-soulbeast-roaming-build/)
  on GuildJen
- [Revenant/Renegade - WvW-Roam (Power Condition Alacrity) Shortbow/Staff Celestial](https://metabattle.com/wiki/Build:Renegade_-_Shortbow_Shiro_Roamer)
  on MetaBattle
- [Thief/Core - WvW-Roam (Condition) Pistol+Dagger/Shortbow Trailblazer/Dire](https://metabattle.com/wiki/Build:Thief_-_Core_P/D_Roamer)
  on MetaBattle

#### WvW Zerg Builds

The following list provides damage based builds for zerging.

- [Elementalist/Weaver - WvW-Zerg (Power) Staff/Staff Marauder](https://metabattle.com/wiki/Build:Weaver_-_Staff_Backline)
  on MetaBattle
- [Guardian/Dragonhunter - WvW-Zerg (Power) Longbow/Scepter+Focus Berserker/Marauder](https://hardstuck.gg/gw2/builds/guardian/power-dragonhunter-wvw/)
  on Hardstuck
- [Guardian/Willbender - WvW-Zerg (Power) Greatsword/Scepter+Focus Berserker](https://hardstuck.gg/gw2/builds/guardian/power-willbender-2/)
  on Hardstuck
- [Necromancer/Reaper - WvW-Zerg (Power) Axe+Focus/Greatsword Marauder](https://hardstuck.gg/gw2/builds/necromancer/power-reaper-2/)
  on Hardstuck
- [Necromancer/Scourge - WvW-Zerg (Power Alacrity) Axe+Focus/Greatsword Berserker](https://hardstuck.gg/gw2/builds/necromancer/boonstrip-scourge/)
  on Hardstuck
- [Revenant/Vindicator - WvW-Zerg (Power) Hammer/Greatsword Berserker](https://metabattle.com/wiki/Build:Vindicator_-_Hammer_Vindicator)
  on MetaBattle
- [Warrior/Berserker - WvW-Zerg (Power) Greatsword/Longbow Marauder/Dragon](https://hardstuck.gg/gw2/builds/warrior/power-berserker-warrior/)
  on Hardstuck

The following list provides heal based builds for zerging.

- [Engineer/Scrapper - WvW-Zerg (Heal Stability) Hammer Minstrel](https://hardstuck.gg/gw2/builds/engineer/support-scrapper/)
  on Hardstuck
- [Guardian/Firebrand - WvW-Zerg (Heal Stability) Mace+Shield/Staff Minstrel](https://hardstuck.gg/gw2/builds/guardian/firebrand/)
  on Hardstuck
- [Ranger/Druid - WvW-Zerg (Heal) Staff/Staff Minstrel](https://metabattle.com/wiki/Build:Druid_-_Support_Druid)
  on MetaBattle

### PvE Builds

This section features builds for the PvE game mode.

#### PvE Open World Builds

The following list provides balanced builds for the open world.

- [Thief/Daredevil - PvE-Openworld (Power) Staff Berserker](https://hardstuck.gg/gw2/builds/thief/power-daredevil/)
  on Hardstuck

#### PvE Group Builds

The following list provides damage based builds for the group content.

- [Elementalist/Weaver - PvE-Group (Power) Sword+Dagger Berserker](https://hardstuck.gg/gw2/builds/elementalist/power-weaver/?v=optimized)
  on Hardstuck
- [Engineer/Mechanist - PvE-Group (Power) Hammer/Rifle Berserker](https://www.youtube.com/watch?v=c7kpR9uPIOk)
  on [YouTube](/wiki/youtube.md)
- [Guardian/Firebrand - PvE-Group (Condition) Axe+Torch Viper](https://snowcrows.com/builds/guardian/firebrand/condition-firebrand)
  on Snow Crows
- [Ranger/Soulbeast - PvE-Group (Condition) Longbow/Dagger+Dagger Viper](https://snowcrows.com/builds/ranger/soulbeast/condition-soulbeast)
  on Snow Crows
- [Revenant/Vindicator - PvE-Group (Power) Hammer/Greatsword Berserker](https://hardstuck.gg/gw2/builds/revenant/power-vindicator-2/)
  on Hardstuck
- [Thief/Deadeye - PvE-Group (Power) Dagger+Dagger Berserker](https://www.youtube.com/watch?v=aBcc4isREJY)
  on YouTube
- [Warrior/Bladesworn - PvE-Group (Power) Axe+Pistol Berserker](https://snowcrows.com/builds/warrior/bladesworn/power-bladesworn)
  on Snow Crows
- [Warrior/Spellbreaker - PvE-Group (Power) Dagger+Axe Berserker](https://www.youtube.com/watch?v=CsRR39wPZdc)

The following list provides utility and damage based builds for the group content.

- [Engineer/Mechanist - PvE-Group (Power Alacrity) Rifle Berserker/Diviner](https://snowcrows.com/builds/engineer/mechanist/power-alacrity-mechanist)
  on Snow Crows
- [Mesmer/Chronomancer - PvE-Group (Power Quickness) Dagger+Sword/Greatsword Berserker](https://snowcrows.com/builds/mesmer/chronomancer/power-boon-chronomancer)
  on Snow Crows
- [Mesmer/Mirage - PvE-Group (Condition Alacrity) Staff/Staff Ritualist/Viper](https://snowcrows.com/builds/mesmer/mirage/condition-alacrity-mirage)
  on Snow Crows
- [Necromancer/Harbinger - PvE-Group (Condition Quickness) Pistol+Dagger/Scepter+Warhorn Viper](https://snowcrows.com/builds/necromancer/harbinger/condition-quickness-harbinger)
  on Snow Crows
- [Revenant/Herald - PvE-Group (Power Quickness) Greatsword/Staff Berserker](https://snowcrows.com/builds/revenant/herald/power-quickness-herald)
  on Snow Crows
- [Revenant/Renegade - PvE-Group (Power Alacrity) Greatsword/Staff Diviner/Berserker](https://snowcrows.com/builds/revenant/renegade/power-alacrity-renegade)
  on Snow Crows
- [Thief/Specter - PvE-Group (Condition Alacrity) Scepter+Dagger Viper](https://snowcrows.com/builds/thief/specter/condition-alacrity-spectre)
  on Snow Crows

The following list provides heal and utility based builds for the group content.

- [Engineer/Mechanist - PvE-Group (Heal Alacrity) Mace+Shield Harrier](https://snowcrows.com/builds/engineer/mechanist/heal-alacrity-mechanist)
  on Snow Crows
- [Ranger/Druid - PvE-Group (Heal Alacrity) Axe+Warhorn/Staff Giver/Harrier/Magi](https://snowcrows.com/builds/ranger/druid/heal-druid)
  on Snow Crows

### PvP Builds

This section features builds for the PvP game mode.

#### PvP Group Builds

The following list provides damage based builds for roaming.

- [Engineer/Scrapper - PvP-Roam (Power) Hammer Berserker](https://hardstuck.gg/gw2/builds/engineer/grenade-scrapper/)
  on Hardstuck
- [Thief/Daredevil - PvP-Roam (Condition Power) Pistol+Dagger/Shortbow Carrion](https://metabattle.com/wiki/Build:Daredevil_-_Carrion_P/D)
  on MetaBattle

#### PvP Side Node Builds

The following list provides damage based builds for side noding.

- [Ranger/Druid - PvP-Sidenode (Power) Greatsword/Longbow Avatar](https://hardstuck.gg/gw2/builds/ranger/decap-druid/)
  on Hardstuck
- [Warrior/Bladesworn - PvP-Sidenode (Power) Axe+Pistol Soldier](https://metabattle.com/wiki/Build:Bladesworn_-_Defense_Bladesworn)
  on MetaBattle

#### PvP Team Builds

The following list provides damage based builds for team figh situations.

- [Necromancer/Core - PvP-Team (Condition Power) Scepter+Warhorn/Staff Carrion](https://hardstuck.gg/gw2/builds/necromancer/terrormancer/)
  on Hardstuck
- [Revenant/Herald - PvP-Team (Power) Sword+Sword/Staff Berserker](https://hardstuck.gg/gw2/builds/revenant/power-herald/)
  on Hardstuck
