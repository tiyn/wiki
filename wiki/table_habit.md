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

### Building From Source on Linux

Table Habit can also be built natively on [Linux](/wiki/linux.md) as described in the
[official build guide](https://github.com/FriesI23/mhabit/wiki/Dev%EA%9E%89-Build-From-Source).
A working Flutter Linux toolchain is required, including Git, Clang, CMake, Ninja, pkg-config,
GTK development libraries and the project's additional dependencies such as SQLite, libsecret and
ICU.
The corresponding packages depend on the [Linux distribution](/wiki/linux.md#distributions).
[Git LFS](/wiki/linux/git_%28package%29.md#git-lfs) has to be set up before cloning the repository.

The source code, including its Flutter submodule, can be downloaded as follows.

```sh
git clone --recurse-submodules https://github.com/FriesI23/mhabit.git
cd mhabit
git lfs pull
git submodule update --init --recursive
```

If the `.flutter` directory remains empty, the submodules can be initialized again with
`git submodule update --init --recursive`.

The included Flutter SDK can then be used to check the Linux toolchain, download dependencies and
build the executable.

```sh
./.flutter/bin/flutter doctor -v
./.flutter/bin/flutter pub get
./.flutter/bin/flutter build linux --release
```

On x86_64 systems, the executable can usually be found at `build/linux/x64/release/bundle/mhabit`
and started from there.
Depending on the system, the complete Flutter bundle can be copied to a suitable location or made
accessible through the `PATH` or an application launcher.
Other integration methods may be available depending on the desktop environment.

For updates the repository and its submodules can be updated and the application rebuilt.
For this, the steps after cloning the repository can simply be retraced.

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

## Troubleshooting

This section will focus on errors and the fixing of errors of Table Habit.

### ICU Library Error

On some [Linux](/wiki/linux.md) systems the application may fail with
`LinuxCollationLoader: no libicui18n.so found on the system` even though ICU is installed.
This can occur when the [`native_natural_sort`](https://github.com/FriesI23/native_natural_sort)
library does not search the directory containing the ICU libraries, for example `/usr/lib`.
The relevant file in the local Dart package cache can be located as follows.

```sh
find ~/.pub-cache -path '*/native_natural_sort-*/lib/src/linux/collation_ffi.dart'
```

If the library is available under `/usr/lib`, that path can be added to `searchDirs` in the
file found above.

```dart
List<String> get searchDirs => [
  '/usr/lib',
  '/usr/lib/$multiarchTriplet',
  '/lib/$multiarchTriplet',
  '/app/lib',
];
```

Afterwards Table Habit has to be rebuilt using `./.flutter/bin/flutter build linux --release`.
This is a local workaround that may have to be repeated after dependency updates.
