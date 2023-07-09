# ViFM

[ViFM](https://vifm.info) is a file manager focussed on vim like usage.

## Setup

ViFM can be installed via the
[github page](https://github.com/vifm/vifm).
Some distributions also feature the `vifm` package.

### Configuration

#### Image Previews with Ueberzug

This section is based on a now outdated
[video by Distrotube](https://www.youtube.com/watch?v=qgxsduCO1pE).
This is the updated version that is currently usable.
First you need to install Überzug on your system.
Überzug was provided by [seebye](https://github.com/seebye/ueberzug) but this
project is now unmaintained.
An alternative to using this project is
[Überzug++](https://github.com/jstkdng/ueberzugpp) that can be used as a drop-in
alternative.
It can be installed by the
[Arch User Repository package `ueberzugpp`](/wiki/linux/package_manager.md#arch-linux-pacman-and-yay).
After that you need to add 2 files to your path which can be found on
[thimc' Repository](https://github.com/thimc/vifmimg):

- vifmimg
- vifmrun

If you want to preview files vifmrun you will start vifmrun instead of vifm.

vifmrun:

```sh
#!/bin/sh

if [ -z "$(command -v vifm)" ]; then
	printf "vifm isn't installed on your system!\n"
	exit 1
elif [ -z "$(command -v ueberzug)" ]; then
	exec vifm "$@"
else
	cleanup() {
		exec 3>&-
	    rm "$FIFO_UEBERZUG"
	}
	[ ! -d "$HOME/.cache/vifm" ] && mkdir -p "$HOME/.cache/vifm"
	export FIFO_UEBERZUG="$HOME/.cache/vifm/ueberzug-${$}"
	mkfifo "$FIFO_UEBERZUG"
	ueberzug layer -s <"$FIFO_UEBERZUG" -p json &
	exec 3>"$FIFO_UEBERZUG"
	trap cleanup EXIT
	vifm "$@" 3>&-
	vifmimg clear
fi
```

vifmimg:

```sh
#!/bin/sh

PCACHE="$HOME/.cache/vifm/thumbnail.$(stat --printf '%n\0%i\0%F\0%s\0%W\0%Y' -- "$(readlink -f "$PWD/$6")" | sha256sum)"
export PCACHE="${PCACHE%% *}"

pclear() {
	printf '{"action": "remove", "identifier": "vifm-preview"}\n' > "$FIFO_UEBERZUG"
}

image() {
		printf '{"action": "add", "identifier": "vifm-preview", "x": "%s", "y": "%s", "width": "%s", "height": "%s", "scaler": "contain", "path": "%s"}\n' "$2" "$3" "$4" "$5" "$6" > "$FIFO_UEBERZUG"
}

main() {
    case "$1" in
        "clear")
			pclear "$@"
			;;
        "draw")
			FILE="$PWD/$6"
			image "$1" "$2" "$3" "$4" "$5" "$FILE"
			;;
        "video")
			[ ! -f "$PCACHE" ] && \
				ffmpegthumbnailer -i "$6" -o "${PCACHE}.jpg" -s 0 -q 5
			image "$1" "$2" "$3" "$4" "$5" "${PCACHE}.jpg"
			;;
        "epub")
			[ ! -f "$PCACHE" ] && \
				epub-thumbnailer "$6" "$PCACHE" 1024
			image "$1" "$2" "$3" "$4" "$5" "$PCACHE"
			;;
        "pdf")
			[ ! -f "${PCACHE}.jpg" ] && \
				pdftoppm -jpeg -f 1 -singlefile "$6" "$PCACHE"
			image "$1" "$2" "$3" "$4" "$5" "${PCACHE}.jpg"
			;;
        "djvu")
			[ ! -f "${PCACHE}.jpg" ] && \
				ddjvu -format=tiff -quality=90 -page=1 "$6" "$PCACHE.jpg"
			image "$1" "$2" "$3" "$4" "$5" "${PCACHE}.jpg"
			;;
        "audio")
			[ ! -f "${PCACHE}.jpg" ] && \
				ffmpeg -hide_banner -i "$6" "${PCACHE}.jpg" -y >/dev/null
			image "$1" "$2" "$3" "$4" "$5" "${PCACHE}.jpg"
			;;
        "font")
			[ ! -f "${PCACHE}.jpg" ] && \
				fontpreview -i "$6" -o "${PCACHE}.jpg"
			image "$1" "$2" "$3" "$4" "$5" "${PCACHE}.jpg"
			;;
        *)
    esac
}
main "$@"
```

Additionally the following lines can be inserted into the configuration of vifm
`~/.config/vifm/vifmrc` as needed.
They provide previews for various possible types of file extensions.

```txt
fileviewer *.pdf
    \ vifmimg pdf %px %py %pw %ph %c
    \ %pc
    \ vifmimg clear

fileviewer *.djvu
    \ vifmimg djvu %px %py %pw %ph %c
    \ %pc
    \ vifmimg clear

fileviewer *.epub
    \ vifmimg epub %px %py %pw %ph %c
    \ %pc
    \ vifmimg clear

fileviewer <video/*>
    \ vifmimg video %px %py %pw %ph %c
    \ %pc
    \ vifmimg clear

fileviewer <image/*>
    \ vifmimg draw %px %py %pw %ph %c
    \ %pc
    \ vifmimg clear

fileviewer <audio/*>
    \ vifmimg audio %px %py %pw %ph %c
    \ %pc
    \ vifmimg clear

fileviewer <font/*>
    \ vifmimg font %px %py %pw %ph %c
    \ %pc
    \ vifmimg clear
```
