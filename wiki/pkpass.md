# PKPass

A PKPass is a digital card format used by [Apple Wallet](https://developer.apple.com/wallet/) and
other [wallet applications](/wiki/android/wallet.md).
PKPass files usually have the extension `.pkpass`.

## Usage

This section addresses the usage of PKPass.

### Create a PKPass File

A PKPass in its simplest form is a ZIP archive containing card information in `pass.json` and
optional images.
Apple Wallet additionally requires a manifest and a valid cryptographic signature.

Therefore, a simple unsigned PKPass can be created and imported into wallet applications that accept
unsigned passes.
For this only a program that can create ZIP archives is needed.
Additionally, a program to read a QR code may be useful, such as
[ZBar on Linux](/wiki/linux/zbar.md).

Firstly, a `pass.json` has to be created.
It should include all the relevant card information as well as the QR code content.
The following text is an example with placeholder values.

```json
{
  "formatVersion": 1,
  "passTypeIdentifier": "pass.example.ticket",
  "serialNumber": "ticket-001",
  "teamIdentifier": "ABCDEFGHIJ",
  "organizationName": "Example",
  "description": "Ticket",
  "logoText": "TICKET",
  "generic": {
    "primaryFields": [
      { "key": "validity", "label": "VALID", "value": "2026/2027" },
      { "key": "name", "label": "NAME", "value": "User" }
    ],
    "secondaryFields": [
      { "key": "seat", "label": "SEAT", "value": "12" },
      { "key": "row", "label": "ROW", "value": "1" }
    ]
  },
  "barcodes": [
    {
      "format": "PKBarcodeFormatQR",
      "message": "EXAMPLE-TICKET-CODE",
      "messageEncoding": "iso-8859-1"
    }
  ]
}
```

Additional fields may be added under `primaryFields`, `secondaryFields`, `auxiliaryFields` or
`backFields`.
For a header logo place `logo.png` and `logo@2x.png` beside `pass.json` and include them in the
archive.

```sh
zip -X ticket.pkpass pass.json logo.png logo@2x.png
```

Without images, use the following command instead.

```sh
zip -X ticket.pkpass pass.json
```

This produces an unsigned archive, which Apple Wallet will not accept.
However, other apps such as [FossWallet](/wiki/android/fosswallet.md) may accept a pass like this.
For Apple Wallet, a valid Pass Type ID certificate and signing process are required as described in
[Apple's documentation](https://developer.apple.com/documentation/walletpasses).
