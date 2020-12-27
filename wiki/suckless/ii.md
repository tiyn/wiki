# II

ii is a suckless tool for the internet relay chat.
`<>` indicated placeholders.

## Join a server

On most servers `ssl` is required.
So you need the `ssl` patch and use `-e` instead of `-p`.

```shell
ii -n <nick> -s <server> -e 9999 &
(sleep 2 &&
echo "/msg NickServ REGISTER `<password>` `<mail>`" > ~/irc/<server>/nickserv/in &)
#(sleep 2 &&
#echo "/msg NickServ IDENTIFY `<password>`" > ~/irc/<server>/nickserv/in &)
```

## Join a channel

```shell
echo "/join <channel-name>" > ~/irc/<server>/in &
```

## Show channel

```shell
tail -f -n 500 \<channel>/out
```

## Write into channel

```shell
echo "\msg <message>" > ~/irc/<server>/<channel>/in
```

## Write private message

```shell
echo "\msg <recipient> <message>" > ~/irc/<server>/<channel>/in
```
