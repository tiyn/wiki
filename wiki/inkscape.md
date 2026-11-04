# Inkscape

[Inkscape](https://inkscape.org/) is a cross-platform editor for vector graphics.

## Setup

On the [Inkscape website](https://inkscape.org/release/) setup files for
[Windows](/wiki/windows.md), MacOS and [Linux](/wiki/linux.md) can be found.
On most [Linux distributions](/wiki/linux.md#distributions) Inkscape can usually be installed with
the corresponding [package manager](/wiki/linux/package_manager.md).

## Usage

This section addresses various way to use Inkscape for specific tasks.

### Convert Raster Images to SVG

Saving a PNG or JPG with an `.svg` extension does not turn it into a vector graphic.
Inkscape must trace its pixels into editable vector paths.
This works well for clean handwritten text, pencil drawings, sketches and simple logos.
The overall workflow is explained in the
[corresponding section of the image entry](/wiki/image.md#convert-raster-images-to-svg).

Before starting to convert a raster image to SVG, it is generally recommended to
[clean up the drawing in GIMP](/wiki/gimp.md#clean-up-photographed-or-scanned-drawings).

Then to start the process of converting raster images to svg, import the raster image using
`File > Import` (`Ctrl+I`), then select it with the `Select Tool` (`S`).
Open `Path > Trace Bitmap` (`Shift+Alt+B`).
Start with `Single scan` and set `Detection mode` to `Brightness cutoff`.
Adjust the `Threshold` while checking the preview; values around `0.45` to `0.65` are a starting
range rather than a fixed rule.
Click `Apply` to create the vector paths.
If faint contours are missing, vary the threshold or try `Edge detection`.
Be aware that edge detection can also capture grid lines or produce double outlines around pencil
strokes.

The new vector object usually lies directly above the imported image.
Use the `Select Tool` (`S`) to move it aside, select the original bitmap underneath and press
`Delete`, then move the vector object back.
Confirm that no embedded raster image remains if you need a fully vector-based SVG.
Before editing the result, save an untouched working version with `File > Save As` (`Ctrl+Shift+S`),
for example `drawing_original_trace.svg`, using the `Inkscape SVG` format.

To correct tracing errors, select the path and switch to `Edit paths by nodes` (`N`).
Zoom in, move or delete incorrect nodes, and adjust curves using their handles.
Fix broken outlines and important details manually before simplifying the remaining irregularities.

`Path > Simplify` (`Ctrl+L`) can remove too many nodes and distort the shape.
To make it gentler, open `Edit > Preferences` (`Ctrl+Shift+P`), find `Simplification threshold`
under `Behavior` and reduce its value.
Try `0.0005` as a cautious starting point and adjust according to the result.
Select the path or only the relevant nodes with the node tool, apply `Path > Simplify` just once,
and inspect the contours.
Undo with `Ctrl+Z` if details disappear.
Repeating `Ctrl+L` in quick succession increases the simplification strength.

When the contours look correct, select `File > Save As` (`Ctrl+Shift+S`) and save something like
`drawing_final.svg` as `Plain SVG (*.svg)` for general reuse.
Use `Inkscape SVG` instead if you want to retain Inkscape-specific editing information.

For clean handwriting, tracing and simplifying alone may be sufficient.
The original handwriting workflow was based on the videos
[Vecteezy: Levels and bitmap tracing](https://www.youtube.com/watch?v=gW19K11ihIc)
(which demonstrates an older interface) and
[Logos By Nick: Simplifying paths](https://www.youtube.com/watch?v=EFHLF1hcrjg).
