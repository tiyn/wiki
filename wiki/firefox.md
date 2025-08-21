# Firefox

[Firefox](https://www.mozilla.org/en-US/Firefox) is a free and open-source web
browser.
There are browsers that are based on Firefox and expand on its features like
[Zen browser](/wiki/zen_browser.md).
For this the usage is mostly the same except for the parts noted in the
[Zen Browser entry](/wiki/zen_browser.md).

## Usage

The following section addresses different uses and add-ons of Firefox.

### Compact Mode

In Firefox compact mode is a configuration to make tabs and navigation elements
including bookmarks smaller.
After navigating to `about:config` the configuration can be done at
`browser.compactmode.show`.

### List of useful Firefox Add-ons

Following is a list of useful Firefox add-ons.
They can be removed and configured under `about:config`.
The add-ons are grouped thematically

#### Privacy and Security Add-ons

The following add-ons increase the security or privacy.

- [Chameleon](/wiki/chameleon.md)
  spoofs your browser profile including user agent and screen size.
- [ClearURLs](https://addons.mozilla.org/en-GB/firefox/addon/clearurls) removes
  tracking elements from URLs.
- [Consent-O-Matic](https://addons.mozilla.org/en-GB/firefox/addon/consent-o-matic)
  automatically refuses GDPR consent to a bunch of platforms.
  An alternative to this is an addon named I don't care about cookies.
- [Firefox Multi-Account Containers](https://addons.mozilla.org/en-GB/firefox/addon/multi-account-containers)
  lets you separate cookies in different containers on a per site base.
  With this add-on a proxy can be selected for each container which enables
  usage of a [VPN](/wiki/vpn.md) that acts as a Proxy like a
  [OpenVPN Proxy](/wiki/openvpn.md#proxy).
- [I don't care about cookies](https://addons.mozilla.org/en-US/firefox/addon/i-dont-care-about-cookies/)
  is an even faster alternative to Consent-O-Matic.
- [Temporary Containers](https://addons.mozilla.org/en-GB/firefox/addon/temporary-containers)
  opens tabs and websites, that are not already managed by
  `Firefox Multi-Account Containers` in a new container.
- [NoScript](https://addons.mozilla.org/en-GB/firefox/addon/noscript) blocks all
  javascript so that the parts you need can be reenabled and the rest is not used.
- [Privacy Badger](https://addons.mozilla.org/en-GB/firefox/addon/privacy-badger17)
  blocks unwanted invisible trackers.
- [Privacy Redirect](https://addons.mozilla.org/en-US/firefox/addon/privacy-redirect/)
  redirects youtube, instagram, twitter, etc to free alternatives or alternative
  frontends.
- [SponsorBlock](/wiki/youtube.md#automatically-skip-sponsorships) skips YouTube video sponsors
  automatically, works with [Invidious](./invidious.md) too.
- [Tampermonkey](https://github.com/Tampermonkey/tampermonkey) is a userscript
  manager that can be used for the following tasks:
  - [Bypass YouTubes age restrictions](https://github.com/zerodytrash/Simple-YouTube-Age-Restriction-Bypass)
  - [Exclude pages from](http://www.jeffersonscher.com/gm/google-hit-hider/)
    [search results](/wiki/search_engine.md)
  - [Auto close YouTube ads](https://greasyfork.org/en/scripts/9165-auto-close-youtube-ads)
- [uBlock Origin](https://addons.mozilla.org/en-GB/firefox/addon/ublock-origin)
  blocks unwanted content like ads.
- [User-Agent Switcher and Manager](https://addons.mozilla.org/en-GB/firefox/addon/user-agent-string-switcher)
  spoofs websites that try to gather information about your webbrowser.

#### Style Add-ons

The following add-ons provide changes to the default style.

- [Dark Reader](https://addons.mozilla.org/en-GB/Firefox/addon/darkreader) creates
  an automatic dark mode for sites without native dark mode.
- [hide-scrollbars](https://addons.mozilla.org/en-GB/Firefox/addon/hide-scrollbars)
  hides scrollbars.
- [Midnight Lizard](https://addons.mozilla.org/de/firefox/addon/midnight-lizard-quantum/) is a
  add-on similar to Dark Reader.
  It is slightly more customizable but has worse default settings.

#### Tool Add-ons

The following add-ons add various functions.

- [Floccus](https://addons.mozilla.org/en-US/Firefox/addon/floccus/) syncs your
  bookmarks across devices (supports Nextcloud and WebDAV (ownCloud, etc)).
- [Sidebery](https://addons.mozilla.org/en-GB/Firefox/addon/sidebery)
  is a sidebar with treestyle tabs and bookmarks.
- [Surfingkeys](https://github.com/brookhong/Surfingkeys) introduces keyboard-based navigation.
  It is similar to Vim Vixen, further down this list.
- [Tree Style Tab](https://addons.mozilla.org/en-GB/Firefox/addon/tree-style-tab)
  shows tabs like a tree. This is especially useful if many tabs are used.
- [Vim Vixen](https://addons.mozilla.org/en-GB/Firefox/addon/vim-vixen) enables
  vim movement for Firefox.
  It is similar to Surfingkeys further up this list.

#### Translation Add-ons

The following add-ons provide translation options.

- [Firefox Translations](https://addons.mozilla.org/en-US/firefox/addon/firefox-translations)
  is an add-on made by Mozilla itself that gives an option for marked text to display its
  translations quickly from the extension menu but can also translate whole sites.
- [Simple Translate](https://addons.mozilla.org/en-US/firefox/addon/simple-translate) is an add-on
  supporting both DeepL and Google Translate to translate marked text in various different ways that
  can be automatically displayed.
- [To DeepL translation](https://addons.mozilla.org/en-US/firefox/addon/to-deepl/) gives an option
  for marked text to display its translation in a pop-up window using DeepL.

#### Shopping Add-ons

The following add-ons add information to online shops.

- [Fakespot](https://www.fakespot.com/) is an add-on made by Mozilla which displays additional
  information on online shops, ebay and amazon.
  It can give shops, vendors and products a trust score which can be used as an alternative to
  reviews, which might be fake.

### Add a new search engine

You can add a new search engine with the add-on `Add custom search engine`.
Make sure to replace `<url to search engine>` with the according url.

It is possible to add it without an add-on.
Navigate to the search engine and click the `...` in the address bar.
Then click `Add Search Engine`

### Telemetry

Telemetry is the remote measurement and transmission of data.
To change the telemetry of Firefox navigate to `about:telemetry` and click the
options to toggle between enabled and disabled.

### Scrolling

On Linux distributions auto scroll is disabled by default.
This means that you cant click the middle mouse button to use it for scrolling.
To enable it go into the preferences and check `Use autoscrolling`.

### Sponsorings

Sponsorings are embedded ads in Firefox.
After navigating to `about:config` enabling and disabling of sponsorings can be done at
`browser.newtabpage.activity-stream.showSponsored`.

### Gestures

By default gestures are enabled by default.
This can be annoying especially on laptops when using the touchpad.
But the gestures can easily be disabled.
For this go to `about:config` and clear the preferences for `browser.gesture.swipe.left` and
`browser.gesture.swite.right`.

### Make Fullscreen Only Window Wide

Firefox' default fullscreen does not only hide UI elements of firefox but also increases Firefox'
size beyond the borders of the current window to the whole size of the screen.
By setting the following options in `about:config` the fullscreen and also the kiosk mode will only
hide the UI of Firefox.
The expansion of the window will be disabled by it.
This is often reffered to as fake fullscreen.

```txt
full-screen-api.ignore-widgets = true
```

### Disable Unneeded Services and Features

The following section is based on the website
[privacy-handbuch.de](https://www.privacy-handbuch.de/handbuch_21n.htm) which discusses ways to
disable often unneeded features in Firefox.
The way to disable these services is by setting values in `about:config`.

To disable the Pocket expansion set the following config.

```txt
extensions.pocket.enabled = false
```

To disable the screenshot expansion set the following config.

```txt
extensions.screenshots.disabled = true
```

To disable Firefox Sync set the following config.

```txt
identity.fxaccounts.enabled = false
```

To disable form fillings set the following configs.

```txt
browser.formfill.enable = false
extensions.formautofill.addresses.enabled =	false
extensions.formautofill.creditCards.enabled = false
extensions.formautofill.heuristics.enabled = false
```

To disable fingerprinting the GPU set the following configs.

```txt
webgl.enable-debug-renderer-info = false
webgl.disable-extensions = true
webgl.min_capability_mode = true
webgl.disable-fail-if-major-performance-caveat = true
```

To avoid operating system attacks via WebGL set the following configs.

```txt
webgl.disabled = true
webgl.enable-webgl2 = false
```

To disable speculative loading of websites when hovering over links set the following config.

```txt
network.http.speculative-parallel-limit = 0
```

To disable remote deactivation of plugins by firefox aswell as connection of the AMO-servers on a
daily basis set the following configs.

```txt
extensions.blocklist.enabled = false
extensions.getAddons.cache.enabled = false
```

To disable various health reports and telemetry data set the following configs.

```txt
browser.tabs.crashReporting.sendReport = false
datareporting.policy.dataSubmissionEnabled = false
datareporting.healthreport.uploadEnabled = false
toolkit.coverage.endpoint.base = ""
toolkit.coverage.opt-out = true
toolkit.telemetry.coverage.opt-out = true
```

To disable the localization done by pinging Mozillas location server set the following configs.

```txt
browser.region.update.enabled = false
browser.region.network.url = ""
```

To disable safebrowsing which grabs block lists by Mozilla every 30 minutes run the set the
following configs.

```txt
browser.safebrowsing.phishing.enabled = false
browser.safebrowsing.malware.enabled = false
browser.safebrowsing.blockedURIs.enabled = false
browser.safebrowsing.downloads.enabled = false
browser.safebrowsing.downloads.remote.enabled = false
browser.safebrowsing.downloads.remote.block_dangerous = false
browser.safebrowsing.downloads.remote.block_dangerous_host = false
browser.safebrowsing.downloads.remote.block_potentially_unwanted = false
browser.safebrowsing.downloads.remote.block_uncommon = false
browser.safebrowsing.downloads.remote.url = ""
browser.safebrowsing.provider.*.gethashURL = ""
browser.safebrowsing.provider.*.updateURL = ""
browser.pagethumbnails.capturing_disabled = true
```

To disable ads after an update set the following config.

```txt
browser.startup.homepage_override.mstone = ignore
```

To disable the ad system for Firefox add-ons set the following configs.

```txt
browser.newtabpage.activity-stream.asrouter.userprefs.cfr.addons = false
browser.newtabpage.activity-stream.asrouter.userprefs.cfr.features = false
extensions.htmlaboutaddons.recommendations.enabled = false
extensions.ui.lastCategory = addons://list/extension
```

To disable [VPN](/wiki/vpn.md) ads set the following config.

```txt
 browser.vpn_promo.enabled = false
```

To disable the rating samples set the following config.

```txt
app.normandy.enabled = false
```

To always keep add-ons active even on Firefox and Mozilla sites set the following config.

```txt
extensions.webextensions.restrictedDomains = ""
```

To avoid the fingerprinting of desktop settings deactive the standard values for system colors by
setting the following config.

```txt
ui.use_standins_for_native_colors = true
```

Firefox contacts Firefox' servers on each start to check IP connections.
To disable this set the following config.

```txt
network.connectivity-service.enabled = false
```

To disable Microsoft Family Safety on [Windows systems](/wiki/windows.md) which can be used as a
censoring tool set the following config.

```txt
security.family_safety.mode = 0
```

Additionally check [the telemetry section](#telemetry) and
[the sponsoring section](#sponsorings).
