# eduroam

eduroam, short for education roaming, is a wireless network available at many universities and
research institutions worldwide.
It allows users to connect using the credentials or certificates issued by their home institution.

## Android

The recommended [Android](/wiki/android.md) client is called [geteduroam](https://geteduroam.app/).
It is available on the [Google Play Store](/wiki/android.md#app-store) as well as on
[F-Droid](/wiki/android.md#app-store).
It supports both username/password authentication and certificate-based authentication (EAP-TLS).

Install the application, select your institution and follow the setup process.
The application should remain installed, as removing it also removes the eduroam configuration.

## Linux

Most [Linux](/wiki/linux.md) desktop environments support eduroam directly through
[NetworkManager](/wiki/linux/networkmanager.md).

For username/password authentication configure a new WPA2/WPA3 Enterprise connection using the
parameters provided by your institution.

If certificate-based authentication (EAP-TLS) is used, import the supplied client certificate and
configure the connection accordingly.
The certificate is usually provided by your institution.

Some institutions also provide an installer through the official
[eduroam Configuration Assistant Tool (CAT)](https://cat.eduroam.org).
