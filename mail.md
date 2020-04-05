# Mutt
These are a bunch of programs to be able to use lukesmithxyz's mutt-wizard,
which will be able to setup your neomutt acordingly.

| program     | description           |
| ----------- | --------------------- |
| neomutt     | mail program          |
| isync       | syncs mail            |
| msmtp       | sends mail            |
| pass        | encrypts passwords    |
| mutt-wizard | autoconfigure neomutt |

The mutt-wizard AUR package is slightly outdated.
Try to use the [git version](https://github.com/LukeSmithxyz/mutt-wizard) to get the latest mutt-wizard.

## Installation and configuration
After the basic installation you will be able to:

``` mw add ``` to add mailaccounts

``` mw ls ``` to list existing ones

``` mw pass ``` to revise passwords

``` mw delete ``` to delete accounts

``` mw purge ``` to delete all accounts and settings

``` mw cron ``` toggle a cronjob to sync mail

## Use khard in mutt
To use your khard addressbook in mutt just add the following lines to your ```~/.config/mutt/muttrc```.

```
set query_command= "khard email --parsable --search-in-source-files %s"
bind editor <Tab> complete-query
bind editor ^T complete
macro index,pager A \
	"<pipe message>khard add-email<return>" \
	"add the sender email address to khard"
```

You can just tab-complete the email-addresses.
You can also add new ones by pressing A.
