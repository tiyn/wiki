# Medieval 2: Total War

Medieval 2: Total War is a game from the [Total War](https://www.totalwar.com)
series.

## Mods

### Third Age: Total War - Divide and Conquer

[Divide and Conquer](https://www.moddb.com/mods/divide-and-conquer) is a submod
for the [Third Age Total War](https://www.moddb.com/mods/third-age-total-war)
mod.
It is a Lord of the Rings themed mod, not only adding a large array of new
units, castles and factions, but converting it to a setting based in
Middle-earth.

The installation guide for this mods is based on
[Laetus'](http://www.twcenter.net/forums/showthread.php?724777-Third-Age-and-Linux)
post in the Total War Center Forum and assumes Medieval 2: Total War was
purchased via [Steam](./steam.md).
For installation the latest version needs to be downloaded from
[MOD DB](https://www.moddb.com/mods/divide-and-conquer/downloads/).
Following this run the executable (`.exe`) file and select not the game but a
newly createt folder.
If you are on linux use [wine](../linux/wine.md) for this.
The executable will create many files in the directory.
The important files are located in a subdirectory called `mods`.
If you are on linux you need to rename all the files and directories under the
`mods` folder to lowercase.
This can be done by running
`find . -depth -exec perl-rename 's/(.*)\/([^\/]*)/$1\/\L$2/' {} \;` after
changing the working directory to the `mods` folder.
`perl-rename` can be called just `rename` depending on the distribution.
This concludes the extra steps for linux systems.
Rename the directory below the `mods` folder to `third_age`.
`third_age` now has to be moved to the modding folder of Medieval 2: Total War.
This folder named `mods` too can be found on the top level of the game
directory.
Lastly you need to change the launch options in steam.
Open `Properties` of Medieval 2: Total War and set the launch options under the
general tab to `--features.mod=mods/third_age`
