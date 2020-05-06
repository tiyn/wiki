# NeoMutt

Neomutt is a mail program that runs in your terminal.
It can be easily configured using mutt-wizard.

## Setup

### Arch-Linux

- `yay -S neomutt isync msmtp pass` - Install all dependecies
- Install mutt-wizard from [github](https://github.com/LukeSmithxyz/mutt-wizard) (AUR is not up to date)

#### Using mutt-wizard

After installation you're able to use the following commands, that will guide you through configuration.

`mw add` to add mailaccounts

`mw ls` to list existing ones

`mw pass` to revise passwords

`mw delete` to delete accounts

`mw purge` to delete all accounts and settings

`mw cron` toggle a cronjob to sync mail

## Usage

## Khard in NeoMutt

- Edit `~/.config/mutt/muttrc`
	-	Append the following lines.
		```
		set query_command= "khard email --parsable --search-in-source-files %s"
		bind editor <Tab> complete-query
		bind editor ^T complete
		macro index,pager A \
			"<pipe message>khard add-email<return>" \
			"add the sender email address to khard"
		```
- You should now be able to tab-complete email-addresses in neomutt
- You can also add new ones by pressing A

