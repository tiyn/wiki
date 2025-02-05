# Images

An image is a visual representation of something.
In the computer context it is a file with an extension like `png`, `jpg`, `gif` among others.
This entry also features medicinal image and visual formats such as DICOM.

## Clients

- [sxiv](https://github.com/xyb3rt/sxiv) is an image viewer for [Linux'](/wiki/linux.md)
  [X window system](/wiki/linux/x_window_system.md).
- [Weasis](https://github.com/nroduit/Weasis) is a cross-platform DICOM viewer.

## Editing

Editing images can be done by various image manipulation software.
A popular cross-platform program for this is [GIMP](https://www.gimp.org/).

A second cross-platform software suite for displaying, creating and editing (raster) images is
[ImageMagick](/wiki/imagemagick.md).

Another part of image manipulation is the upscaling of low resolution images.
This can be done by the cross-platform program [upscayl](https://github.com/upscayl/upscayl).

### Getting Metadata

Using [MediaInfo](https://github.com/MediaArea/MediaInfo) metadata of a file can be obtained.
A command for this looks like the following.
In this the file to obtain metadata to is assumed to be `image.png`.

```sh
mediainfo image.png
```
