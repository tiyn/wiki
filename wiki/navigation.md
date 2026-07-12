# Navigation

Navigation is the process of determining and following a route between locations.
Modern navigation is commonly based on the Global Positioning System (GPS) together with digital
maps.

## Maps

Most navigation software is based on map data.
One of the most commonly used sources is [OpenStreetMap](https://www.openstreetmap.org/) which
provides free and community-maintained map data.

## Route Planning

Routes and tracks can be planned on desktop systems before transferring them to mobile devices.

* [QMapShack](/wiki/qmapshack.md) is a free and open-source desktop application for planning routes,
  tracks and waypoints.
  It supports offline maps, digital elevation models and routing engines.
  Planned tours can be exported as [GPX](#gpx).

## Mobile Navigation

Many mobile navigation applications support importing [GPX data](#gpx) created with desktop software.

- [Organic Maps](https://organicmaps.app/) is a free and open-source map navigation app which
    features offline navigation.
    Tracks, points of interest and other GPX data can be imported.
    However, tracks can only be displayed and not followed.
- [OsmAnd](https://osmand.net/) is an open-source app that allows offline navigation using  
    [OpenStreetMap](https://www.openstreetmap.org/) data.
    Tracks, points of interest and other GPX data can be imported.
    In contrast to Organic Maps tracks can be followed.

## GPX

GPX is an [XML-based](/wiki/markup_language.md#xml) file format used to exchange GPS data such as
tracks, routes and waypoints.
It is supported by most desktop and mobile navigation software.
The creation and export of `.gpx` files is usually done by [route planning](#route-planning).
