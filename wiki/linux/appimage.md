# AppImage

[AppImage](https://appimage.org/) is a portable Linux application format that allows programs to
run without being installed through a traditional package manager.

## Usage

This section addresses the usage of AppImage files.

### Running and Installing AppImage Files

This section is based on an
[article by Sujit Kumar](https://dev.to/sujit-shrc/install-appimages-on-arch-based-linux-lm2).

AppImages are executed directly as standalone binaries.
To start an application make the AppImage executable using the following command.
`<appimage-path>` is the path to the AppImage file.

```sh
chmod +x <appimage-path>
```
