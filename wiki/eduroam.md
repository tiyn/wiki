# eduroam

eduroam, short for education roaming, is a wireless network available at many universities and
research institutions worldwide.
It allows users to connect using the credentials or certificates issued by their home institution.

## Android

The recommended setup method for [Android](/wiki/android.md) depends on your institution.

[geteduroam](https://geteduroam.app/) is available on the Google Play Store and
[F-Droid](https://f-droid.org/packages/app.eduroam.geteduroam/).
It supports both username/password authentication and certificate-based authentication.

Institutions using DFN easyroam may instead recommend the [easyroam](https://www.easyroam.de/) app,
which is available on the Google Play Store and uses certificate-based authentication (EAP-TLS).

Install the appropriate application, select your institution and follow the setup process.
Both applications automatically configure the eduroam Wi-Fi connection, including the required
certificates and authentication settings.

Keep the application installed to preserve the managed eduroam configuration.

## Linux

Most [Linux](/wiki/linux.md) desktop environments support eduroam through
[NetworkManager](/wiki/linux/networkmanager.md).

The required configuration depends on the authentication method used by your institution:

- Username/password (PEAP/TTLS): Configure a WPA2/WPA3 Enterprise connection using your
  institution's EAP settings, credentials, trusted CA certificate (e.g. `rootcert.crt`) and
  authentication server domain.
- Client certificate (EAP-TLS): Configure a connection using a personal client certificate and its
  private key (e.g. from a `.p12` file), along with the required CA certificate and server
  validation settings.

Some institutions also provide an installer through the official
[eduroam Configuration Assistant Tool (CAT)](https://cat.eduroam.org).
