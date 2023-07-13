# Font Configuration

This entry addresses the handling of [fonts](/wiki/font.md) for
[Linux-based](/wiki/linux/linux.md) operating systems.

## Setup

Fontconfig is the standard library used to customize and configure.
On most [Linux](/wiki/linux/linux.md) distributions fontconfig can be setup by
installing the package `fontconfig`.

### Configuration

The configuration file is usually stored in the file
`~/.config/fontconfig/fonts.conf`.
A configuration typically looks like the following lines.

```xml
<?xml version='1.0'?>
<!DOCTYPE fontconfig SYSTEM 'fonts.dtd'>
<fontconfig>
	<alias>
		<family>serif</family>
		<prefer>
			<family>Linux Libertine</family>
			<family>Joy Pixels</family>
		</prefer>
	</alias>
	<alias>
		<family>sans-serif</family>
		<prefer>
			<family>Linux Biolinum</family>
			<family>Joy Pixels</family>
		</prefer>
	</alias>
	<alias>
		<family>monospace</family>
		<prefer>
            <family>JetBrainsMono Nerd Font Mono</family>
			<family>Joy Pixels</family>
		</prefer>
	</alias>
</fontconfig>
```

This configuration requires some fonts that are not necessarily present in any
Linux installation so they may have to be installed.
Follow the section on [adding new fonts](#adding-new-font) and
[recommended fonts](#recommended-fonts) as needed.

## Usage

This section addresses important commands and packages for the configuration of
fonts.

### List or Find Font Family

A list of all fonts can be displayed using the command `fc-match -a`.
If the name of the font is not clear the command
`fc-match -a | grep <search term>` can be used to get an overview of the fonts
available.
For matching the command `fc-match -s <search term>` is be used.
This will display a list of font families that match best with the given search
term.

### Adding New Font

A new font can be added by placing its name inside `<family>`/`</family>`-tags.
Make sure to place it inside the correct [font family](/wiki/font.md#typefaces).
If you want to add a font into the configuration make sure its name
[matches](#list-or-find-font-family) correctly.

### Recommended Fonts

In this section various fonts are listed for the different typefaces.
Make sure to follow [the adding new fonts section](#adding-new-font) after
installing new fonts.

#### Monospace

For monospace the font `JetBrainsMono Nerd Font Mono` that is also used
IntelliJ and other JetBrains software is recommended.
As an additional feature it can be used packaged as a
[Nerd Font](https://www.nerdfonts.com/).
For some distributions it is available in the `ttf-jetbrains-mono-nerd` package.
alternatively it can be downloaded from the
[Nerd Fonts download page](https://www.nerdfonts.com/font-downloads).

#### CJK

CJK fonts can be installed together by using Google Noto CJK fonts.
They are typically inside a package named `noto-fonts-cjk` but can also be
retrieved from their [website](https://fonts.google.com/noto).

An alternative to this are the Adobe fonts.
They are typically installed separately.
The repository is split into
[source han sans](https://github.com/adobe-fonts/source-han-sans),
[source han serif](https://github.com/adobe-fonts/source-han-serif) and
[source han mono](https://github.com/adobe-fonts/source-han-mono) .
On some [package managers](/wiki/linux/package_manager.md) the fonts are further
split depending on [typeface](/wiki/font.md#typefaces) and language.
The following list shows the name of the
[Arch Linux packages](/wiki/linux/arch-linux/arch-linux.md).
The names on other distributions can vary slightly.

- `adobe-source-han-sans-jp-fonts` is for japanese sans style fonts.
- `adobe-source-han-serif-jp-fonts` is for japanese sans style fonts.
- `adobe-source-han-mono-jp-fonts` is for japanese mono style fonts.
- `adobe-source-han-sans-kr-fonts` is for korean sans font.
- `adobe-source-han-serif-kr-fonts` is for korean serif font.
- `adobe-source-han-mono-kr-fonts` is for korean mono font.

#### Emojis

Emojis are typically unicode characters that need special packages to be
displayed properly.

[JoyPixels](https://joypixels.com) feature many emoji icons.
The fonts can be obtained from their [website](https://joypixels.com/download)
or for most distributions from the `ttf-joypixels` package.
