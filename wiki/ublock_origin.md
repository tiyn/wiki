# uBlock Origin

[uBlock Origin](https://ublockorigin.com) is a free and open-source [browser](/wiki/web_browser.md)
extension fof ad blocking.
It is available for most browsers like [Firefox](/wiki/firefox.md), its derivatives like
[Zen](/wiki/zen_browser.md), Chrome, and Chromium based browsers like Edge, Brave and many more.

## Setup

The setup of the [browser](/wiki/web_browser.md) extension of uBlock Origin is based on the browser
used and can vary slightly.
For [Firefox](/wiki/firefox.md) it can be found in the
[addon page](https://addons.mozilla.org/en-GB/firefox/addon/ublock-origin) and many other browser
follow this pattern.

## Troubleshooting 

This section will focus on errors and the fixing of errors of uBlock Origin.

### YouTube Videos Do Not Load

In general [YouTube](/wiki/youtube.md) videos can be viewed with uBlock Origin removing the
advertisements.
It is however possible that is also blocks YouTube from loading the videos altogether.
Most of the times this can be fixed easily as explained in a
[Reddit post by orestaras](https://www.reddit.com/r/firefox/comments/1hipkzh/ublock_origin_no_longer_works_on_youtube).
Open the dashboard in the extension menu.
Under the tab `Filter List`, extend `Built-in` and uncheck `uBlock filters - Quick fixes`.
Afterwards reload the page containing the YouTube video and it should load normally and without
advertisements.
