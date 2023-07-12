# Firefox

[Firefox](https://www.mozilla.org/en-US/Firefox) is a free and open-source web
browser.

## Configuration

Firefox has many possible settings and precerences.
This section addresses possible settings and preferences for specific use cases.

### Telemetry

Telemetry is the remote measurement and transmission of data.
To change the telemetry of Firefox navigate to `about:telemetry` and click the
options to toggle between enabled and disabled.

### Enable/Disable Scrolling

On Linux distributions auto scroll is disabled by default.
This means that you cant click the middle mouse button to use it for scrolling.
To enable it go into the preferences and check `Use autoscrolling`.

### Enable/Disable Sponsorings

Sponsorings are embedded ads in Firefox.
After navigating to `about:config` enabling and disabling of sponsorings can be done at
`browser.newtabpage.activity-stream.showSponsored`.

## Usage

The following section addresses different uses and add-ons of Firefox.

### Compact Mode

In Firefox compact mode is a configuration to make tabs and navigation elements
including bookmarks smaller.
After navigating to `about:config` the configuration can be done at
`browser.compactmode.show`.

## List of useful Firefox add-ons

Following is a list of useful Firefox add-ons.
They can be removed and configured under `about:config`.

- [Cameleon](https://addons.mozilla.org/en-GB/firefox/addon/chameleon-ext/)
  spoofs your browser profile including user agent and screen size.
- [ClearURLs](https://addons.mozilla.org/en-GB/Firefox/addon/clearurls) removes
  tracking elements from URLs.
- [Dark Reader](https://addons.mozilla.org/en-GB/Firefox/addon/darkreader) creates
  an automatic dark mode for sites without native dark mode.
- [Firefox Multi-Account Containers](https://addons.mozilla.org/en-GB/Firefox/addon/multi-account-containers)
  lets you separate cookies in different containers on a per site base.
  With this add-on a proxy can be selected for each container which enables
  usage of [a VPN proxy](/wiki/vpn.md#openvpn).
  - [Temporary Containers](https://addons.mozilla.org/en-GB/Firefox/addon/temporary-containers)
    opens tabs and websites, that are not already managed by
    `Firefox Multi-Account Containers` in a new container.
- [Floccus](https://addons.mozilla.org/en-US/Firefox/addon/floccus/) syncs your
  bookmarks across devices (supports Nextcloud and WebDAV (ownCloud, etc)).
- [hide-scrollbars](https://addons.mozilla.org/en-GB/Firefox/addon/hide-scrollbars)
  hides scrollbars.
- [Never-Consent](https://addons.mozilla.org/en-GB/Firefox/addon/never-consent)
  automatically refuses GDPR consent to a bunch of platforms.
- [NoScript](https://addons.mozilla.org/en-GB/Firefox/addon/noscript) blocks all
  javascript so that the parts you need can be reenabled and the rest is not used.
- [Privacy Badger](https://addons.mozilla.org/en-GB/Firefox/addon/privacy-badger17)
  blocks unwanted invisible trackers.
- [Privacy Redirect](https://addons.mozilla.org/en-US/Firefox/addon/privacy-redirect/)
  redirects youtube, instagram, twitter, etc to free alternatives or alternative
  frontends.
- [Sidebery](https://addons.mozilla.org/en-GB/Firefox/addon/sidebery)
  is a sidebar with treestyle tabs and bookmarks.
- [SponsorBlock](https://addons.mozilla.org/en-US/firefox/addon/sponsorblock/)
  skips YouTube video sponsors automatically, works with
  [invidious](./invidious.md) too.
- [Tampermonkey](https://github.com/Tampermonkey/tampermonkey) is a userscript
  manager that can be used for the following tasks:
  - [Bypass YouTubes age restrictions](https://github.com/zerodytrash/Simple-YouTube-Age-Restriction-Bypass)
  - [Exclude pages from](http://www.jeffersonscher.com/gm/google-hit-hider/)
    [search results](/wiki/search_engine.md)
  - [Auto close YouTube ads](https://greasyfork.org/en/scripts/9165-auto-close-youtube-ads)
- [Tree Style Tab](https://addons.mozilla.org/en-GB/Firefox/addon/tree-style-tab)
  shows tabs like a tree. This is especially useful if many tabs are used.
- [uBlock Origin](https://addons.mozilla.org/en-GB/Firefox/addon/ublock-origin)
  blocks unwanted content like ads.
- [User-Agent Switcher and Manager](https://addons.mozilla.org/en-GB/Firefox/addon/user-agent-string-switcher)
  spoofs websites that try to gather information about your webbrowser.
- [Vim Vixen](https://addons.mozilla.org/en-GB/Firefox/addon/vim-vixen) enables
  vim movement for Firefox.

## Add a new search engine

You can add a new search engine with the add-on `Add custom search engine`.
Make sure to replace `<url to search engine>` with the according url.

It is possible to add it without an add-on.
Navigate to the search engine and click the `...` in the address bar.
Then click `Add Search Engine`
