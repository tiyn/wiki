# Anki

[Anki](https://apps.ankiweb.net/) is a flashcard program for learning.

## Setup

Anki can be split up into client and server software.
The server software is fully optional, handles the syncing between multiple clients and can also be
done via the official Anki website.

### Setup Client

The default Anki client is made for computer systems and can be installed from source as described
[on GitHub](https://github.com/ankitects/anki).
Alternatively some [Linux](/wiki/linux.md) [package managers](/wiki/linux/package_manager.md)
package the Anki client in the `anki` package.

Adding to the Computer clients there are various possible clients for other platforms.

- [AnkiDroid](https://f-droid.org/de/packages/com.ichi2.anki/) is a client for
  [Android](/wiki/android.md).

### Setup Server

The syncserver can be installed to handle the syncing of data in a self-hosted way.
It is described [on GitHub](https://github.com/ankitects/anki/tree/main/docs/syncserver) and can be
setup via [Docker](/wiki/docker.md) using
[the official manually build container](/wiki/docker/ankitects_-_syncserver.md).

## Usage

This section addresses the usage of Anki.

### Add Backwards Cards

When setting up a new deck and sometimes when importing a deck only cards for one-way learning are
added.
This guide assumes the default Anki client is used.
To change this select `Browse` and then navigate to the `Note Type` the deck to add backwards cards
uses.
Right click the note type and select `Cards`.
Afterwards the cards for backwards learning can be added by `Options` and `Add Card Types...`.
You can confirm the fields have been setup correctly by clicking through the card types and
verifying it.

### Make New Cards Gather Order Random

This section is based on a
[Anki forum entry by NameLessGO](https://forums.ankiweb.net/t/what-are-the-best-settings-here-to-review-cards-in-random-order/27112).
By default new cards are gathered in order and then also shown in order.
Most of the time it is useful for them to be gathered in order as it conserves the learning units
for example.
To change this navigate to the `Options` of a deck and then change `New card sort order` to
`Random` to randomize them before showing them without gathering them randomly.
To change this the `New card gather order` can also be set to `Random notes` or `Random cards`.

### Change Card Style

The layout and the style of the cards can be changed using CSS and HTML.
There are various ressources that can be used for this.
One of them is [anki-prettify](https://github.com/pranavdeshai/anki-prettify).
The exact CSS an HTML has to be changed on a per-note base under `Tools`, `Manage Note Types`, and
`Cards` after selecting the corresponding note.
