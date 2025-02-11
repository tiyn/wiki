# YouTube

[YouTube](https://youtube.com) is a online video sharing platform.

## Alternative Frontends

There are some alternative frontends available that also feature user managament
including subscriptions.

- [Invidious](/wiki/invidious.md) is self-hosted and provides a cross-platform web service.
  This frontend allows the usage of [SponsorBlock](#automatically-skip-sponsorships).
- [FreeTube](https://freetubeapp.io/) is a alternative frontend that provides a local desktop
  application for [Linux](/wiki/linux.md), Mac and [Windows](/wiki/windows.md) systems.
  This application has [SponsorBlock](#automatically-skip-sponsorships) built in.
- [NewPipe](https://github.com/TeamNewPipe/NewPipe) for [Android](/wiki/android.md) phones is an
  application that is available via the [F-Droid Appstore](/wiki/android/f-droid.md).

## Downloading YouTube Videos

YouTube videos can be downloaded.
Some [alternative frontends](#alternative-frontends) feature downloading of
videos or making them offline available.
As a command line utility [yt-dl](https://github.com/ytdl-org/youtube-dl) can be
used.
Since yt-dl is stagnant its fork [yt-dlp](https://github.com/yt-dlp/yt-dlp) is
recommended.
Another alternative is [streamrip](https://github.com/nathom/streamrip).
It should only be used  for YouTube and other freely available sources like SoundCloud.
[MeTube](/wiki/metube.md) and [TubeArchivist](/wiki/docker/bbilly1_-_tubearchivist.md) are
self-hostable web user interfaces for [yt-dlp](https://github.com/yt-dlp/yt-dlp).
Using the flag like the following `--download-sections "*5:01-16:43"` downloads only a part of the
video.

## Automatically Skip Sponsorships

[SponsorBlock](https://github.com/ajayyy/SponsorBlock) is a [browser](/wiki/web_browser.md)
expansion.
It is used to skip sponsorships, paid and unpaid promotions and other labelled data on YouTube and
[Invidious](/wiki/invidious.md).
