# GIMP

[GIMP](https://www.gimp.org/) is a popular cross-platform program for editing pictures.

## Setup

The GIMP program can be installed from files found on
[the official website](https://www.gimp.org/downloads/).
Alternatively many [Linux](/wiki/linux.md) [package managers](/wiki/linux/package_manager.md) 
package GIMP in the `gimp` package.

## Usage

This section addresses the usage of GIMP.

### Scale Image

An image that is already loaded into GIMP can easily be scaled down (or up) by selecting
`Scale Image` under the `Image` tab.
Alternatively the scale tool reachable via `Ctrl+S` can be used.

### Clean Up Photographed or Scanned Drawings

Photographed or scanned drawings often have shadows, reflections, faint lines or an uneven
background.
GIMP can improve their readability and remove distracting marks.
The following workflow uses the English GIMP interface.

Open the original with `File > Open` (`Ctrl+O`).
Duplicate its layer using `Layer > Duplicate Layers` (called `Duplicate Layer` in some versions) and
work on the copy to preserve the original.
If you want to keep an editable project, save it as an `.xcf` file using `File > Save As`.
Use the Crop Tool via `Tools > Transform Tools > Crop` (`Shift+C`) to draw a rectangle around the
subject, leaving a small margin, and press `Enter` to apply the crop.

Open `Colors > Desaturate > Desaturate` and select `Luminance` as the `Mode` to convert the picture
to grayscale.
To even out dark areas, open `Colors > Shadows-Highlights` and gradually increase `Shadows` (try
`+50` as a starting point).
Leave `Highlights` near its default unless an adjustment is needed.
Make sure faint drawing lines remain visible; glare that completely obliterates a stroke cannot be
recovered by these adjustments.

Next, open `Colors > Levels` and select the `Value` channel. Under `Input Levels`, move the
white-point slider slightly to the left to brighten the paper and the black-point slider slightly to
the right to darken the drawing.
Adjust the middle gamma slider if needed.
Goal of this process are clear, dark contours against a light and a fairly uniform background without
losing fine lines or making potential background lines too prominent.

Remove remaining unwanted marks by selecting the `Paintbrush Tool` (`P`) with a hard brush at `100%`
opacity.
Press `D` followed by `X` to make the foreground color white, zoom in, and carefully paint over
background marks such as grid lines or dust.
Avoid the actual drawing; where a background line crosses a wanted stroke, manual repair may be
necessary.

Finally, choose `File > Export As` (`Ctrl+Shift+E`), name the file something like
`drawing_cleaned.png`, and confirm the PNG export.

The cleaned image is useful on its own or as input for other workflows, including
[converting a raster drawing to SVG in Inkscape](/wiki/inkscape.md#convert-raster-images-to-svg).
An overview for this is explained in the
[corresponding section of the image entry](/wiki/image.md#convert-raster-images-to-svg).
