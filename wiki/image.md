# Image

An image is a visual representation of something.
In the computer context it is a file with an extension like `png`, `jpg`, `gif` and `svg` for
vector graphics but there are many more.
This entry also features medicinal image and visual formats such as DICOM.

## Viewer

- [sxiv](https://github.com/xyb3rt/sxiv) is an image viewer for [Linux'](/wiki/linux.md)
    [X window system](/wiki/linux/x_window_system.md).
- [Weasis](https://github.com/nroduit/Weasis) is a cross-platform DICOM viewer.
- [imv](https://sr.ht/~exec64/imv/) is an image viewer native to [Linux'](/wiki/linux.md)
    [Wayland](/wiki/linux/wayland.md).

## Editors

Editing images can be done by various image manipulation software.

- [GIMP](/wiki/gimp.md) is a popular cross-platform program for editing pictures.
- [PhotoCraft](https://getartcraft.com/apps/photocraft) is a free, open-source image editor
  written in [Rust](/wiki/programming_language/rust.md).
  Its interface and editing workflow closely resemble Adobe Photoshop.
- [VectorCraft](https://getartcraft.com/apps/vectorcraft) is a free, open-source vector graphics editor
  written in [Rust](/wiki/programming_language/rust.md).
  Its interface and editing workflow closely resemble Adobe Illustrator.
- [LightCraft](https://getartcraft.com/apps/lightcraft) is a free, open-source photo library and
  RAW developer written in [Rust](/wiki/programming_language/rust.md).
  Its interface and editing workflow closely resemble Adobe Lightroom.
- [ArtCraft](https://github.com/storytold/artcraft) is an AI-assisted image and video creation tool
  written in [Rust](/wiki/programming_language/rust.md).
  Its generative workflows are comparable to Adobe Firefly.
- [ImageMagick](/wiki/imagemagick.md) is another cross-platform software suite for creating and
  editing (raster) images.
- [ScanTailor Advanced](https://github.com/ScanTailor-Advanced/scantailor-advanced) is a free,
  open-source program for post-processing scanned or photographed book pages.
  It can split double pages, correct skew and page curvature, and adjust margins.
  It works on existing image files; scanning and OCR are handled by other software.
- [upscayl](https://github.com/upscayl/upscayl) is an upscaler that can be used cross-platform.
- [Inkscape](/wiki/inkscape.md) is a cross-platform vector graphic editor.
- [draw.io](/wiki/drawio.md) is a cross-platform program and web application for creating and
  editing diagrams.

## Convert Raster Images to SVG

A photographed or scanned drawing (`.png` or `.jpg`) can be converted into an editable, scalable
vector graphic (`.svg`) by preparing the raster image and tracing it into paths.

Start by [cleaning up the image in GIMP](/wiki/gimp.md#clean-up-photographed-or-scanned-drawings).
This is particularly useful for faint pencil drawings, uneven lighting or grid paper.
For clean, high-contrast sources, this preparation may be unnecessary.
Then [convertt the raster image to SVG in Inkscape](/wiki/inkscape.md#convert-raster-images-to-svg).

## Management

Digital images can be stored and managed.
A software that has a similar look and feel to Google Photos is [Immich](/wiki/immich.md).

### Getting Metadata

Using [MediaInfo](https://github.com/MediaArea/MediaInfo) metadata of a file can be obtained.
A command for this looks like the following.
In this the file to obtain metadata to is assumed to be `image.png`.

```sh
mediainfo image.png
```
