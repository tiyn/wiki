#!/bin/sh
docker stop samba
docker rm samba
docker pull dperson/samba
docker run --name samba \
	--restart unless-stopped \
	-p 139:139 \
	-p 445:445 \
	-v samba_nas:/nas \
	-v samba_lib:/var/lib/samba \
	-v samba_cache:/var/cache/samba \
	-v samba_run:/run/samba \
	-v samba_etc:/etc \
	-v samba_log:/var/log/samba \
	-d dperson/samba -p \
	-u "user1;pass1" \
	-u "user2;pass2" \
	-s "public;/nas/public" \
	-s "user1private;/nas/user1;no;no;no;user1;user1" \
	-s "user2private;/nas/user2;no;no;no;user2;user2"
