# Thunderbird

[Thunderbird](https://www.thunderbird.net/en-US/) is a free and open-source program to manage
numerous e-mail addresses, calendars, todos and contacts.

## Usage

The following section addresses different uses and add-ons of Thunderbird.

### Use PGP Key for Encryption, Decryption and Signing

Thunderbird can use [OpenPGP](/wiki/openpgp.md) to sign, encrypt or decrypt mails.
To add this navigate to the `Account Settings` under `Edit` and then select the mail to add the PGP
key to and `End-to-End Encryption`.
There keys can be added by selecting `Add Keys...` and afterwards the private key can be selected
for encryption, decryption and signing.
This however is only possible if the key is issued to the same e-mail it should be added to.

In the `Account Settings` of emails with set up PGP key the default options can be set up.
Under `Deault settings for sending messages` it can be set to encrypt or not encrypt mails by
default.
Emails can also be signed by default if not encrypted (for this select
`Sign unencrypted messages`).

### Enable Spell Checking of a Specific Language

Spell checking can be changed in the `Settings` from the `Edit` tab.
The configuration can be done under `Composition` in the `Spelling` section.
There are two checkboxes to specify when the spell checking should occur.
And under `Languages:` various and also multiple languages can be checked.
To add another language follow the link and navigate to the language to install.
Then install only dictionary since the language pack is not needed.

### Changing the (Dark/Light) Theme

This section is based on a
[superuser comment by blnks](https://superuser.com/questions/1757333/how-can-i-view-thunderbird-in-full-dark-mode).
The dark theme can not be enabled from the default preferenes or settings.
To turn on the dark theme navigate to `Tools` and `Add-ons and Themes`.
There select `Enable` for the theme of your choice.

### List of Useful Extensions

The following is a list of useful extensions for Thunderbird.

- "*cloud - FileLink for Nextcloud and ownCloud" is an extension which allows the easy creation and
  sharing of file links to a custom [Nextcloud](/wiki/nextcloud.md) or
  [ownCloud](/wiki/owncloud.md) instance.
- ["CollectAddresses"](#collect-all-addresses-of-mail-account) can be used to save all addresses in
  an account or folder to an address book.
  This is achieved by right-clicking the account or a folder within it.
- "Dark Reader" is an extension similar to
  [Firefox'](/wiki/firefox.md#list-of-useful-firefox-add-ons) "Dark Reader" extension that adds
  a dark mode for websites.
- "Send Later" is an extension which allows for the scheduling of mails.
- "Signature Switch" is an extension which adds different signatures for different purposes and
  allows easy and automatic switching between them.

### Hide/Show Completed Tasks

Under the tasks tab it is possible to show only incomplete tasks aswell as other specific tasks
using the selection on the left hand site of the screen.
Alternatively complete tasks can be hidden by selecting "View" in the top bar, then "Tasks" and
finally "Incomplete Tasks".

### Hide/Show Local Folders

This section is based on a
[forum post by Mapenzi](https://www.thunderbird-mail.de/forum/thread/92315-115-lokale-ordner-ausblenden/?postID=518346#post518346).
The local folders can be hidden by opening the meatballs menu to the immediate right of the `New
Message`-button and selecting `Hide Local Folders`.

### Revert to Default Folder Order

The order of the folders of an account can be reset by right-clicking the account in the Mail-tab
and then selecting `Reset Folder Order`.

### Hide/Show Default Address Book

This section is based on a
[blog post by Attiks](https://tips.attiks.com/2018/05/03/thunderbird-hide-default-address-book).
By default Thunderbird uses an address book called `Personal Address Book`.
When using a remote address book which is synced the default address book is often not needed.
It can be hidden by selecting `Edit` (if the top bar is not visible `Alt` can be pressed to display
it), `Settings` and `Config Editor...`.
In the config editor search for the value `ldap_2.servers.pab.dirType` and set the value from the
default (which is `101`) to `-1` to hide the default address book.

### Hide/Show Message Pane

This section is based on a
[Mozilla Support Question by hgosnell](https://support.mozilla.org/en-US/questions/1122496).
By default Thunderbird will show a preview for mails on the right hand side when selecting it.
This is called the message pane.
It can be hidden by drag and drop or by pressing the F8-key.
Using the same key it can also be shown again.
