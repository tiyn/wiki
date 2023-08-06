# Airsonic-Advanced

[Airsonic-Advanced](https://github.com/airsonic-advanced/airsonic-advanced) is
a free and open-source personal media streamer used for
[music, podcasts and audiobooks](./audio.md).
It is a more modern implementation of [Airsonic](./airsonic.md) which in turn
is a fork of [Subsonic](./subsonic.md).

## Setup

The software can be setup via docker with the
[linuxserver image](./docker/linuxserver_-_airsonic-advanced.md).

### Initial configuration

The administration username after installation is `admin`.
The password is `admin` too.
After installing the server make sure to change this password.
If the password was changed there are two entries in the credentials table in
the credentials tab of the settings.
The first credential with id `0` uses the encoder plaintext which is
deprecated.
The second one with id `1` is the changed password which uses the encoder
bcrypt.
Make sure to delete the credential with id `0`.
This entry is not secure due to its encoder type.
When using clients as described in [the relating section](#clients) make sure
to set up the credentials according to the following instructions.
To make the clients log in work with the server store the Airsonic credentials
with a decodable encoder.
Select `Add credentials` and select `encrypted-AES-GCM` as encoder.
Type in the Airsonic password and confirm it and create the new credential.
Log in with the clients now works correctly.

### Clients

It is possible to use many different clients because the server is compatible
with all the Subsonic clients.
These can be found in the [Subsonic entry](./subsonic.md#clients).

## Scrobbling with Last.fm

To set up the scrobbling of music with Last.fm check
`Register what I'm playing at Last.fm` in the personal tab of the settings.
Following this the Last.fm credentials need to be added under the credentials
tab.
Select `Add credentials`, set the App to Last.fm and put in the Last.fm
password.
After the creation of credentials in this way the music will be scrobbled.
