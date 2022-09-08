# Video

It is nice to have some movies saved on your system.
There are multiple different approaches on how to get it working depending on
your needs.
In general you need to consider if you want the video directly on your pc or
access a server for it.

## Server/Client

If you want to keep your system clean of much data, you can use this kind of setup.
There are differences depending on your preffered client interface.

- [Plex](https://www.plex.tv) is a dockerizable media streaming service with web-interface.
- [Jellyfin](./jellyfin.md) is a foss dockerizable media streaming service with web-interface.

## Scan DVDs/Blu-Rays

You can convert your DVDs and Blu-Rays to files on your computer.
This way you don't have to search for your discs all the time.

- [MakeMKV](https://www.makemkv.com) for windows can extract a `.mkv` file from
  a disc (Beta key can be found
  [here](https://www.makemkv.com/forum/viewtopic.php?f=5&t=1053)).
  On Linux it is possible that the drive is not detected in MakeMKV.
  To fix this issue run the following lines and reboot afterwards.

  ```
  su
  echo sg > /etc/modules-load.d/sg.conf
  ```

  MakeMKV can be obtained over different ways. One of them is flatpack in which
  you start MakeMKV via `flatpak run com.makemkv.MakeMKV` after installation.

- [MKS Extractor GUI](https://www.videohelp.vom/software/MKS-Extractor-GUI)
  for windows can extract subtitles from a `.mkv` file.
- [Subtitleedit]([https://www.videohelp.vom/software/MKS-Extractor-GUI](https://www.nikse.dk/subtitleedit))
  for linux can extract subtitles from a `.mkv` file and do ocr.
- [VidCoder](https://vidcoder.net) for windows can compress `.mkv` files. Its an adapted version of the HandBrake software.
- [HandBrake]([https://vidcoder.net](https://handbrake.fr/)) for linux can compress `.mkv` files.
