# UFW

[UFW (Uncomplicated Firewall)](https://code.launchpad.net/ufw) is a program to
manage a netfilter firewall.

## Block specific IPs

To block the whole traffic from a specific IP to your computer run:
`ufw deny from <ip> to any`
This will not send a reject response, so the target of the block won't know he
was blocked.
If you don't care if the target knows you can also run:
`sudo ufw reject from <ip> to any`

## List all rules

To show all rules you can run:
`ufw status`
or:
`ufw status numbered`
if you want to have a list of all rules with according numbers.

## Remove rules

Locate the rule you want to remove by showing all rules (numbered).
Then run:
`ufw delete <number of rule>`
