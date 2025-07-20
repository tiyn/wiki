# Images

An image is a visual representation of something.
In the computer context it is a file with an extension like `png`, `jpg`, `gif` and `svg` for
vector graphics but there are many more.
This entry also features medicinal image and visual formats such as DICOM.

## Viewer

- [sxiv](https://github.com/xyb3rt/sxiv) is an image viewer for [Linux'](/wiki/linux.md)
  [X window system](/wiki/linux/x_window_system.md).
- [Weasis](https://github.com/nroduit/Weasis) is a cross-platform DICOM viewer.

## Editors

Editing images can be done by various image manipulation software.

- [GIMP](https://www.gimp.org/) is a popular cross-platform program for editing pictures.
- [ImageMagick](/wiki/imagemagick.md) is another cross-platform software suite for creating and
- editing (raster) images.
- [upscayl](https://github.com/upscayl/upscayl) is an upscaler that can be used cross-platform.
- [Inkscape](/wiki/inkscape.md) is a cross-platform vector graphic editor.
- [draw.io](/wiki/drawio.md) is a cross-platform program and web application for creating and
  editing diagrams.

### Getting Metadata

Using [MediaInfo](https://github.com/MediaArea/MediaInfo) metadata of a file can be obtained.
A command for this looks like the following.
In this the file to obtain metadata to is assumed to be `image.png`.

```sh
mediainfo image.png
```
