# Inkscape

[Inkscape](https://inkscape.org/) is a cross-platform editor for vector graphics.

## Setup

On the [Inkscape website](https://inkscape.org/release/) setup files for
[Windows](/wiki/windows.md), MacOS and [Linux](/wiki/linux.md) can be found.
On most Linux distributions Inkscape can usually be installed with the corresponding
[package manager](/wiki/linux/package_manager.md).

## Usage

This section addresses various way to use Inkscape for specific tasks.

### Convert Handwriting to Vector Graphic

This section is based on a two source.
One is a [YouTube video by vecteezy](https://www.youtube.com/watch?v=gW19K11ihIc) which explains the
setting of the levels, aswell as the tracing of the bitmap.
though an older version was used which is why some features may be found at another place in the
menus.
This was changed accordingly for the following guide.
The other is a [YouTube video by Logos By Nick](https://www.youtube.com/watch?v=EFHLF1hcrjg) which
explains the simplification process.

To convert handwriting to a vector graphic an image of the writing should first be opened in
Inkscape.
First the levels of black and white can be changed by using `Extensions > Raster > Levels` and
changing the values for white and black points.
Afterwards the bitmap should be traced.
For this select `Path > Trace Bitmap` and change the values in the Detection mode
`Brightness cutoff` until it matches your expectations.
After this the image has been converted to a bitmap, but most of the times it is not smooth and has
quite some errors.
The removal can be done by hand by removing the points manually.
This is useful to do for bigger errors.
For smaller errors `Path > Simplify` can be used.
