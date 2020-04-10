# Docker
Here you can find a bunch of rebuild shell scripts to automatically stop, remove, update and rebuild containers (or if they dont exist just build them).

| File/Folder       | Description                                     | Rebuild Readme | Installation Guide |
| ----------------- | ----------------------------------------------- | -------------- | ------------------ |
| airsonic          | music streaming service                         | yes            | no                 |
| bind              | dns service                                     | yes	           | no                 |
| cups              | print service                                   | yes            | no                 |
| docker-mailserver | mail service                                    | yes            | no                 |
| docker-radicale   | caldav service                                  | yes            | no                 |
| folding-at-home   | give your cpu power to fight disease            | yes            | no                 |
| gitea	            | github-like git service                         | yes            | no                 |
| git-server-docker | git-server without gui                          | yes            | no                 |
| gopherproxy       | show a given gopherhole over http               | yes            | no                 |
| gopherserver      | service to run a gopherhole                     | yes            | no                 |
| hastebin          | pastebin alternative                            | yes            | no                 |
| homer             | static website                                  | yes            | no                 |
| jellyfin          | video streaming service                         | yes            | no                 |
| mordhau-server    | server for steamgame mordhau                    | yes            | no                 |
| nginx             | reverse proxy for http(s)                       | yes		       | no          	    |
| onedrive          | onedrive client                                 | yes            | no                 |
| openvpn           | vpn service                                     | yes            | no                 |
| owncloud          | server app for owncloud                         | yes            | no                 |
| owncloudclient    | client app for owncloud                         | yes            | no                 |
| pinedocs          | view files, good for documentation or wiki      | yes            | no                 |
| pltu              | vpn tunnel to a plex service                    | yes            | no                 |
| portainer         | docker monitoring web-gui                       | yes            | no                 |
| portainer-agent   | docker agent to connect to existing portainer   | yes            | no                 |
| python-flask      | python flask webdev framework                   | yes            | no                 |
| samba             | shared network storage                          | yes            | no                 |
| syncthing         | decentralized synchronization tool              | yes            | no                 |
| teamspeak         | teamspeak3 server                               | yes            | no                 |
| todo              | simple todo webgui                              | yes            | no                 |

## Dependencies
These scripts only require ```sh``` and a standard ```docker``` install.
Some of them need the additional ```docker-compose``` package to work, they will have corresponding files in their folders.
If there is more to the configuration than just running the script and following a guided configuration, there is a guide aswell.
