# rembg

[rembg](https://github.com/danielgatis/rembg) is a [command line](/wiki/linux/shell.md) tool and
Python library for removing image backgrounds using pretrained
[neural networks](/wiki/neural_network.md) executed through ONNX Runtime.

## Setup

rembg can be installed from source as described on the
[official GitHub repository](https://github.com/danielgatis/rembg).

Alternatively a [Python package manager](/wiki/programming_language/python.md#package-management)
can be used to install rembg.
For the backend one must select CPU or GPU usage.
For command line usage an extra package has to be installed in addition to the inference backend.
Depending on that choice the name of the package will be `"rembg[cpu,cli]"` or `rembg[gpu,cli]`.

## Usage

This section addresses the usage of rembg.

### Remove Background

The following command removes the background from an image using a specific `<model>`.
In this case `<input>` is a placeholder for the input image path and `<output>` for the output image
path.

```sh
rembg i -m <model> <input> <output>
```

Depending on the use-case other models may also be used.
`u2net` is a general purpose model and most of the time a good default.
`u2net_human_seg` is optimized for human subjects.
`isnet-general-use` is an alternative general-purpose model.

The quality depends on the selected model and the input image.
For portraits with complex backgrounds such as bushes or trees, `u2net` often produces the best
overall results, while other models may perform better on different types of images.

Additionally, alpha matting can improve difficult edges such as hair.

```sh
rembg i -m <model> -a <input> <output>
```
