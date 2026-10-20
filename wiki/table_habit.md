# Table Habit

[Table Habit](https://github.com/FriesI23/mhabit) is a cross-platform, free and open-source habit
tracker for tracking daily habits and their progress.
It features habit scores, statistics and calendar-like heatmaps and supports synchronization between
devices via WebDAV.

## Setup

Table Habit is available for [Android](/wiki/android.md) via an [F-Droid](/wiki/android/f-droid.md)
package called [Table Habit](https://f-droid.org/packages/io.github.friesi23.mhabit/) and for
[Linux](/wiki/linux.md) via [Flathub](https://flathub.org/apps/io.github.friesi23.mhabit).
On Linux it can also be
[built from source](https://github.com/FriesI23/mhabit/wiki/Dev%EA%9E%89-Build-From-Source).

## Usage

This section addresses the usage of Table Habits.

### Synchronization via WebDAV

Habits can be synchronized across devices using a WebDAV server such as
[Nextcloud](/wiki/nextcloud.md).
Under `Settings`, `Sync Options` and `Sync Server` the WebDAV URL and credentials can be configured.
Afterwards synchronization can be started using `Sync Now`.
For Nextcloud the WebDAV URL generally follows the format explained in
[the corresponding entry](/wiki/nextcloud.md#webdav).
Further instructions can be found in the
[official WebDAV guide](https://github.com/FriesI23/mhabit/wiki/Feature%EA%9E%89-WebDAV-Sync).
