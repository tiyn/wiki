# ImageMagick

[ImageMagick](https://imagemagick.org/) is a free and open-source, cross-platform software suite for
displaying, creating and editing (raster) images.

## Usage

The following section addresses different uses ImageMagick.
For most of ImageMagicks features the [command-line interface](/wiki/system_console.md) can be used.

## Rotate an Image

To rotate an image and save the edited copy of the image run the following command.
`origin.png` is the image to be rotated and `target.png` is the rotated image.
`90` is the degrees the image `origin.png` will be turned by.
Change these values as needed.

```sh
convert origin.png -rotate 90 target.png
```
