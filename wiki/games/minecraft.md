# Minecraft

[Minecraft](https://www.minecraft.net) is a sandbox [video game](/wiki/games.md) created by "Notch".

## Setup

The following sections address the setup of both server and client software.

### Server

A server can be setup via docker with the
[itzg image](../docker/itzg_-_minecraft-server.md).

### Client

There are different Minecraft Clients available:

- The standard (Java) Minecraft Client can be downloaded at the [official website](https://minecraft.net/en-us/get-minecraft)
- [MultiMC5](./multimc5.md) is a custom Minecraft launcher that allows multiple
  installations at once.
  This entry also addresses forks of MultiMC5 like Prism Launcher that are similar in usage and
  settings for the most part.

### Usage

#### Link Minecraft to a Subdomain

To link Minecraft to one of your subdomains you need to add a [DNS](../dns.md)
SRV-record:

```txt
type: SRV
name: mine (or alternative subdomain)
service: _minecraft
proto: TCP
TTL: <configure to your liking>
class: IN
priority: 0
weight: 4
port: 25565 (or your minecraft port)
target: mine.<domain>.<TLD>
```

#### Adding Death Count to the Scoreboard

Run the following commands inside the console of minecraft to add death count as a objective in the
scoreboard.

```txt
/scoreboard objectives add Deaths deathCount
/scoreboard objectives setdisplay list Deaths
```

#### Updating a Server World to a New Version

An existing Minecraft world of a server can be updated simply by updating the server itself.
Chunks that have been loaded will not be affected by the update, but blocks that have not been
loaded will be.
For safety reasons it is advised to back up the instance before updating the version number.

#### Installing Mods

Mods can be installed client- and server-side.
For client-side mods most [up-to-date clients](#client) feature an easy installation process.
Especially [MultiMC5 and its derivatives](/wiki/games/multimc5.md) have an easy way to achieve
this.
For the installation of server-side mods the process can vary slightly depending on the
[server host](#server).
For the [itzgs minecraft server](/wiki/docker/itzg_-_minecraft-server.md) running on
[Docker](/wiki/docker.md) visit the
[mod section of that entry](/wiki/docker/itzg_-_minecraft-server.md#installing-mods).

#### Installing Datapacks

The installation of datapacks is to be done for a specific world or a specific server.
This section will describe a process that works for both single-player worlds aswell as multiplayer
servers.
First the installation of datapacks on single player worlds will the addressed.
Navigate to minecrafts folder that corresponds to the world you want to add the datapack to.
Then place the `.zip` archive containing the datapack inside the `datapacks` folder.
The resulting path is `saves/<world name>/datapacks` where `<world name>` is the name of the single
player world.
For the installation of datapacks on servers please navigate to the entry of the server since there
can be differences.
Most notably itzgs minecraft server is mentioned here which features a
[section regarding datapacks](/wiki/docker/itzg_-_minecraft-server.md#installing-datapacks).

#### Recommended Mods and Resource Packs

This section addresses modifications and resource packs that are recommended or were tested and
found to be useful or good.
This section will be split into two categories.
These are client-side and server-side mods.
The installation of [mods](#installing-mods) and [datapacks](#installing-datapacks) is addressed
in the corresponding sections.
The following resources have been used to find and select modifications and resource packs.

- [The UsefulMods list](https://github.com/TheUsefulLists/UsefulMods/blob/main/Performance/Performance121.md)
  is a list of useful performance mods for the 1.21.x.
  Newer and older versions could be found in the file browser on the left side of the website.
- [Vanilla Tweaks](https://vanillatweaks.net/) is a website that provides various resource packs
  to improve the quality of life in minecraft.
  Goal of these is a slight change of the vanilla experience.

The first category that will be discussed are the server mods.
The following changes are recommended to install on the server to improve performance.

- "Concurrent Chunk Management Engine" is a mod that introduces a concurrently working chunk
  management engine.
- "Clumps" is a mod that groups together experience orbs that are close to another.
- "Get It Together, Drops!" is a mod that groups together items that are close to another.
- "FerriteCore" is a mod that reduces memory usage.
- "Krypton" is a mod that optimizes minecrafts networking stack.
- "Let Me Despawn" is a mod that enables mods with a picked up or equipped item to despawn to
  reduce entity lag.
- "Lithium" is a mod that introduces various general optimizations.
- "ModernFix" is a mod that introduces more general optimizations.
- "Noisium" is a mod that speeds up the world generation function.

After the performance mods have been listed the next mods that will be discussed are focussed on
gameplay.
The following changes are recommended to install on the server for gameplay reasons.

- "Anti Enderman Grief" is a datapack that stops the endermen from picking up and setting down any
  blocks.
- "Audarki Cart Engine (Fast Minecarts)" is a mod that enables the operators of a server to change
  the minecarts speed.
  This can be done for different types of minecarts (player, non-player, etc).

Finally for the server-side mods the following ones are focussed on graphical changes.

- "Skin Shuffle" is a mod that allows players to instantly change the skin they use.
  Please note that the same mod needs to be installed on the client too.

The client-side mods are now being discussed.
The following modifications are recommended client-side performance mods.

- "Concurrent Chunk Management Engine" is a mod that introduces a concurrently working chunk 
  management engine.
- "Dynamic FPS" is a mod that reduces the FPS when the program is running in the background. 
- "EntityCulling" is a mod that disables the rendering of hidden entities.
- "FerriteCore" is a mod that reduces memory usage.
- "ImmediatelyFast" is a mod that optimizes rendering.
- "Lithium" is a mod that introduces various general optimizations.
- "Sodium" is a mod that optimizes the rendering engine. This is a common and with newer versions more popular
  alternative to OptiFine.
- "Sodium Extra" is a mod that introduces an extension to Sodiums optimizations.
- "Reese's Sodium Options" is a (sub-)mod for Sodium that adds functions to the video options like
  a search bar.
  A similar mod to this is "Xander's Sodium Options".
- "Xander's Sodium Options" is a (sub-)mod  for Sodium that adds functions to the video options
  like a search bar.
  Additionally it changes the look of the video options to be more in line with Minecrafts other
  options.
  A similar mod to this is "Reese's Sodium Options".

The following are recommended client-side graphical mods.

- "3d-Skin-Layers" is a mod that makes the outer layers of skins look more 3-dimensional.
- "Blur+" is a mod that adds blur to the background when opening a chest.
- "Bobby" is a mod that caches chunks to increase the render distance beyond the maximum server
  distance of servers.
- "Chat Heads" is a mod that adds an image of the players head to chat messages.
- "Dark Loading Screen" is a mod that changes the mojang loading screen into dark mode.
- "Make Bubbles Pop" is a mod that lets water bubbles - like the ones above soulsand - pop at the
  surface.
- "Visuality" is a mod that adds various particles to entities.
- "Better Hoppers" is a resource pack that adds arrows to hoppers.
- "Blobs Enchant Icons" is a resource pack that adds small icons to the tooltip of enchanted
  icons.
- "Consistent Blank Decorated Pot" from Vanilla Tweaks is a resource pack that fixes the decorated
  pot skin to use the decoration on all sides.
- "Consistent Buckets" from Vanilla Tweaks is a resource pack that fixes the bucket icon to be in
  line for filled and empty buckets.
- "Directional Dispensers" from Vanilla Tweaks is a resource pack that adds arrows to dispensers.
- "Directional Observers" from Vanilla Tweaks is a resource pack that adds arrows to observers.
- "Double Slab Fix" from Vanilla Tweaks is a resource pack that fixes the double slabs look to
  look like two slabs in contrast to a normal block.
- "Even Better Enchants" is a resource pack that changes the look of enchanted books to be more
  unique and easily recognizable.
- "Groovy Levers" from Vanilla Tweaks is a resource pack that adds a groove to indicate the state
  to levers.
- "Lower Shield" from Vanilla Tweaks is a resource pack that lowers the shield to increase the
  players vision.
- "Mob Crates" is a resource pack that changes the icon of spawn eggs.
- "Nautilus 3D" is a resource pack that completely retextures all blocks in the game.
- "No More Christmas Chests" is a resource pack that disables the christmas chests.
- "No Java Subtitle" from Vanilla Tweaks is a resource pack that hides the Java Version-Subtitle
  in the title screen.
- "Pumpkin or Melon" is a resource pack that makes the stem of melons and pumpkins easily
  distinguishable.
- "Redstone Power Levels" from Vanilla Tweaks is a resource pack that displays the level of
  redstone signal on the dust.
- "Rethoughted Infested Stones" is a resource pack that slightly changes the skin of infested
  stones.
- "Slightly Improved Font" is a resource pack that makes the font a bit smoother.
- "Sticky Piston Sides" is a resource pack that makes the slime on sticky pistons visible from the
  side.
- "Subtle Suspicious Sand and Gravel" is a resource pack that slightly changes the skin of
  suspicious sand and gravel.
- "White Enchantment Glint" from Vanilla Tweaks is a resource pack that changes the default
  enchantment glint to a white one.
- "Alternative Bedrock" from Vanilla Tweaks is a resource pack that changes the look of bedrock.
- "Circular Log Tops" from Vanilla Tweaks is a resource pack that changes the look of logs to be
  more circular.
- "Golden Crown" from Vanilla Tweaks is a resource pack that changes the look of golden helmets to
  crowns.
- "Moss Carpet Overhang" from Vanilla Tweaks is a resource pack that changes the look of moss
  carpets slightly so that they overhang a bit on the sides.
- "Skin Shuffle" is a mod that allows you to change your skin in-game.
  Please note that for this mod to work on servers the same mod needs to be installed on the server
  too, otherwise you will need to log out and reconnect.
- "Visible Powdered Snow" slightly changes the texture of powdered snow to distinguish between it
  and normal snow.
- "Variants-CIT" is a mod that allows to change the look of variants of the same item like potions
  or enchanted books.
  This mod needs corresponding resource packs that can be found on the mod page to download.
- "3D Crops Revamped" is a resource pack that changes the look of crops to be more 3 dimensional.
  It is similar to "Florescent" but focusses only on crops.
- "Florescent" is a resource pack that changes the look of flowers, crops and mushrooms to be more
  3 dimensional.
  It is similar to "3D Crops Revamped" which only includes crops.
- "Continuity" is a mod that enables connected textures like glass without borders and more.
- "Better Statistics Screen" is a mod that changes the look and feel of the statistics screen to
  make it more intuitive.
- "Remove Reloading Screen" is a mod that removes the loading screen and instead display only the
  additional loading bar.

The following are recommended client-side audio mods.

- "No Cave Ambience" is a resource pack that disables the ambience sounds in caves.
- "Quieter Dispensers" from Vanilla Tweaks is a resource pack that reduces the volume of
  dispensers.
- "Quieter Minecarts" from Vanilla Tweaks is a resource pack that reduces the volume of minecarts.
- "Quieter Pistons" from Vanilla Tweaks is a resource pack that reduces the volume of pistons.

The following are recommended client-side HUD and other UI modifications 

- "AppleSkin" is a mod that adds the saturation information to the hunger HUD.
- "BetterF3" is a mod that makes the F3-menu more customizable and more easily readable.
- "Bundle Inventory" is a mod that improves the usability of bundles.
- "Durability Tooltip" is a mod that adds a durability number to the tooltip of items.
  It is similar to "Durability Plus" but doesn't feature color.
- "Durability Plus" is a mod that shows the durability as a number.
  It is similar to "Durability Tooltip" but has color.
- "FPS Display" is a mod that displays the FPS on the screen.
  When using "Sodium" this mod is not needed as it adds the same functionality.
- "Inventory Profiles Next" is a mod that adds inventory profiles and allows to lock specific item
  slots.
  It also replaces placed blocks in the inventory or replaces used tools.
- "MiniHUD" is a mod that adds the possibility to show various information on screen or render
  chunks, light levels, etc in game.
- "Show Durability" is a mod that shows the durability as a number additionally to the bar.
  It is similar to "Till It Breaks" but is more lightweight and has less options.
- "Till It Breaks" is a mod that shows the durability as a number.
  It is similar to "Show Durability" but has more features like color, the displaying of the number
  of arrows or the option to hide of the durability bar.
- "Shulker Box Tooltip" is a mod that more easily shows the contents of a shulker box.
- "Simple armor hud" is a mod that adds a HUD to show the durability and type of armor that the
  player wears.
- "Status Effect Bars" is a mod that adds status effect bars to the screen.
- "Better Boss Bars" is a resource pack that improves the look of boss bars.
- "NH-Just a numbered hotbar" is a resource pack that shows numbers on the hotbar.
- "Boss Crosshair" is a collection of resource packs that changes the look of the crosshair.
- "GUI Perfected" is a resource pack that changes the look of the buttons aswell as crafting
  tables, anvils and more to be more unique.
  It is similar to "Colorful Containers GUI" but doesn't include chests, etc.
- "Colorful Containers GUI" is a resource pack that changes the look of the buttons aswell as crafting
  tables, anvils and more to be more unique.
  This also has a dark mode named "Colourful Containers Dark Mode GUI".
  It is similar to "GUI Perfected" but also includes chests, etc.
- "Scribble" is a mod that makes editing books easier by adding buttons for color, bold font and
  more.

The following are possible client-side mods that change the gameplay or give other information in
the game.
Please note that these can possibly lead to a ban on a server depending on the prohibited mods of
that server.

- "Bridging Mod" is a mod that allows to place blocks under, next to and above a block despite not
  seeing this side of the block.
- "Freecam" is a mod that allows to move the cam freely similar to the spectator mode.
- "Fullbright" is a mod that increases brightness at night or in caves.
- "Mob Health Indicators" is a mod that displays the health of mobs above their head.
- "Replanter Plus" is a mod that makes it possible to simultaneously harvest and replant plants.
- "Xaero's Minimap" is a mod that adds a minimap to the screen.
- "Xaero's World Map" is a mod that adds a map to the game that can be viewed at any time.
- "Brewing Guide" from Vanilla Tweaks is a resource pack that adds an easy brewing guide to the UI
  of the brewing stand.
  It is similar to "GUIdes" but is only made for brewing.
- "GUIdes" is a mod resource similar to "Brewing Guide" that adds guides to many menus like
  brewing menus and more.
  It is similar to "Brewing Guid" and "Smelting Guide" but is adds guides for more tools.
- "Smelting Guide" is a resource pack that adds a guide to all types of furnaces that shows the
  usability of items as fuel.
