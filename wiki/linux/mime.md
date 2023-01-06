# MIME

A MIME type (short for Multipurpose Internet Mail Extensions) is a identifier
for file formats and contents on the internet.

## Usage

### Setting applications for MIME types

In `~/.config/mimeapps.list` a list of applications to run specific MIME
types can be found.
An example file looks like the following:

```txt
[Default Applications]
text/x-shellscript=text.desktop;
x-scheme-handler/magnet=torrent.desktop;
application/x-bittorrent=torrent.desktop;
x-scheme-handler/mailto=mail.desktop;
text/plain=text.desktop;
application/postscript=pdf.desktop;
application/pdf=pdf.desktop;
image/png=img.desktop;
image/jpeg=img.desktop;
image/gif=img.desktop;
application/rss+xml=rss.desktop
video/x-matroska=video.desktop
inode/directory=file.desktop
```

A line consists of a MIME type left of the equals sign and an application on
the right of it.
The application can be found in `~/.local/share/applications/`.
In this directory a file for every application on the right side of the equals
sign with the same title can be found.

A simple application file looks like the following example of `img.desktop`:

```txt
[Desktop Entry]
Type=Application
Name=Image viewer
Exec=/usr/bin/sxiv -a %f
```

Atleast `Type`, `Name` and `Exec` have to be specified for a minimal
application file.

### Getting MIME type of a file

The MIME type of a file can be returned by running
`xdg-mime query filetype <file>` or `file -b --mime-type image.png`.
The MIME type can be then used to set default applications as explained in
[the section regarding setting applications for MIME types](#setting-applications-for-mime-types).
