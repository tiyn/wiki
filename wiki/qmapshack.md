# QMapShack

[QMapShack](https://github.com/Maproom/qmapshack) is a free and open-source desktop application for
planning and managing GPS data such as routes, tracks and waypoints.
It supports various map formats, digital elevation models (DEM) and routing engines.
QMapShack is especially suited for planning hiking and
cycling tours that can afterward be exported as GPX files and used on mobile devices.

## Setup

This section focuses on the setup of QMapShack consisting of the general installation and special
configuration.

### Installation

[QMapShack](https://github.com/Maproom/qmapshack) can either be installed from source as described 
on the [official GitHub page](https://github.com/Maproom/qmapshack) or through the
[package manager](/wiki/linux/package_manager.md) of many Linux distributions where it is often
packaged under the name `qmapshack`.

### Configuration

[QMapShack](https://github.com/Maproom/qmapshack) requires maps for route planning.
Additionally, it is recommended to configure digital elevation models and a routing engine.

#### Maps

Garmin-compatible [OpenStreetMap](https://www.openstreetmap.org/) vector maps work well with 
[QMapShack](https://github.com/Maproom/qmapshack).
The maps provided by [Freizeitkarte](https://freizeitkarte-osm.de/) are recommended.
They can be found on their [website](https://download.freizeitkarte-osm.de/garmin/latest/).

Download the desired archive, extract it into a directory and add the directory containing the
files – especially the `gmapsupp.img` file – as a map directory in QMapShack.
To do that select `Setup Map Paths` under `File`.

#### Digital Elevation Models (DEM)

Digital elevation models are used to display altitude information, elevation profiles and
ascent/descent statistics.
SRTM height data can be downloaded from
[Viewfinder Panoramas](https://www.viewfinderpanoramas.org/) and their 
[interactive map](https://viewfinderpanoramas.org/Coverage%20map%20viewfinderpanoramas_org1.htm).

Extract all the downloaded `.zip` files into a common directory.
The directory will then contain many `.hgt` files.
Afterward create a virtual raster – in form of a `.vrt` file – using the `VRT Builder` included with
[QMapShack](https://github.com/Maproom/qmapshack) under `Tools`.
Finally, configure the DEM directory in QMapShack under `File` and `Setup DEM Paths`.

#### Routing Engine

[QMapShack](https://github.com/Maproom/qmapshack) supports external routing engines.
[Routino](https://www.routino.org/) is a free routing engine based on
[OpenStreetMap](https://www.openstreetmap.org/) and especially useful since it works offline after
being setup.

The routing database can be downloaded from [Geofabrik](https://download.geofabrik.de/).
Since the creation of the routing is pretty time and memory intensive, it is recommended to download
only needed regions.

After downloading the desired region configure Routino in the routing settings of QMapShack and 
create a database with `Create Routino Database` under `Tool`.

## Usage

This section addresses the usage of [QMapShack](https://github.com/Maproom/qmapshack).

### Create a Project

Projects are used to organize routes, tracks and waypoints.
Create a new project by selecting `File` under `New Project`.
Routes, tracks and waypoints can then be stored inside the project.

### Create a Route

A route can be created using the route tool.
If a [routing engine is configured](#routing-engine) only a few routing points are required as the
path is automatically calculated along the road or trail network.
Routes should generally be converted into tracks before exporting.
Tracks contain the complete geometry of the planned path and are therefore
displayed consistently by different navigation applications.

### Export GPX Files

Projects, routes and tracks can be exported as [GPX](/wiki/navigation.md#gpx).
Select the corresponding object and export it after right-clicking it as a `.gpx` file.
The resulting file can be imported into
[mobile navigation applications](/wiki/navigation.md#mobile-navigation).
