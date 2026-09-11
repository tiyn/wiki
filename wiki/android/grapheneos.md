# GrapheneOS

[GrapheneOS](https://grapheneos.org/) – or short Graphene – is a custom
[Android](/wiki/android.md)-ROM and operating system for
[smartphones and tablets](/wiki/smart_device.md#smartphones-and-tablet-computers) with mostly free
and open-source software.

## Compatible Devices and Installation

Graphene is only available on specific devices that feature a maintained build of GrapheneOS.
A list of compatible devices sorted by vendor can be found on the
[official website](https://grapheneos.org/releases#devices).
Note that currently only Google Pixel devices are supported.

## Usage

This section addresses the usage of GrapheneOS.

### Configuration

GrapheneOS features various settings and possibilities for configuration.
A general overview of this was given in a
[Reddit post by Tryptamine9](https://www.reddit.com/r/GrapheneOS/comments/18te8no/my_ride_through_grapheneos_what_works_and_guide/).
Another recommendation on settings for GrapheneOS can be found in
[a post by ventral digital](https://ventral.digital/posts/2024/12/9/practical-grapheneos-for-the-paranoid/).

#### Google Play Services

For normal use of Sandboxed Google Play, Google Play Services does not need the `Phone` or `SMS`
permissions.
They can therefore generally be set to `Don't allow`.

These permissions should only be granted when a specific feature requires them.
For example, RCS with Google Messages may require Google Play Services to have the `Phone`
permission, while ordinary push notifications and most Google Play APIs do not require either
`Phone` or `SMS`.

The `Notification` permission is only needed for notifications directly from the Google Play
Services application.

Location-related permissions and settings for Google Play Services are covered in the
[Location Services section](#location-services).

##### Location Services

It is recommended to enable `Network location` under `Location` and `Location services` in the
settings and select `GrapheneOS Apple proxy`.
This provides faster network-based location in addition to GPS/GNSS.

When using Sandboxed Google Play, `Reroute location requests to OS APIs` should generally remain
enabled.
This allows applications using Google Play location APIs to use the GrapheneOS location
implementation instead.

With location request rerouting enabled, Google Play Services usually does not need the `Location`
permission for normal application location requests.
Its location permission can therefore generally be set to `Don't allow`.

Some Google-specific features, such as certain location-sharing functions, may still require Google
Play Services to have location access.

##### Wi-Fi and Bluetooth Scanning

If network location is unreliable while Wi-Fi itself is disabled, `Wi-Fi scanning` can optionally
be enabled.
If Wi-Fi is already enabled, `Wi-Fi scanning` is generally not required for network-based location
and can otherwise remain disabled from a privacy standpoint.

`Bluetooth scanning` is generally not required for GrapheneOS Network Location and can remain
disabled unless another feature specifically depends on it.

### Backup

GrapheneOS features a built-in backup utility.
It can be found in the settings under `System` and `Backup`.
When enabled, a recovery code made up of multiple words has to be stored to be able to restore the
backed up data.

## Troubleshooting

This section will focus on errors and the fixing of errors of GrapheneOS.

### Apps Cannot Determine the Current Location

Some applications may report `No GPS signal` or fail to determine the current location even though
location works in other applications.

First make sure the location services are configured as described in the
[Location Services section](#location-services).

Additionally, make sure the application has access to (precise) location in the settigns under
`Apps`, `<app>`, `Permissions` and `Location`.
`<app>` is a placeholder for the app name.

Afterward, force stop and restart the affected application.
