# OpenSSL

[OpenSSL](https://www.openssl.org) is a software library for secure
communication over computer networks.

## Usage

### Creating a key pair

As described by [dreikanter](https://gist.github.com/dreikanter/c7e85598664901afae03fedff308736b)
you can create and save a pretty secure private key to `private.key` with
`openssl genrsa -aes256 -out private.key 8912`.
After that run `openssl rsa -in private.key -pubout -out public.key` to save the
according public key to `public.key`.

### Encrypting and decrypting files

[Dreikanter](https://gist.github.com/dreikanter/c7e85598664901afae03fedff308736b)
describes to encrypt larger files with symmetric encryption and encrypt the key
of that using asymmetric encryption.
If however the file is small enough to be encrypted with the public key
`public.key` directly run
`openssl rsautl -encrypt -pubin -inkey public.key -in plaintext.txt -out encrypted.txt`
where `plaintext.txt` is the message to encrypt and `encrypted.txt` is the
encrypted message.
You can decrypt the message using the private key `private.key` as follows
`openssl rsautl -decrypt -inkey private.key -in encrypted.txt -out plaintext.txt`.

### Password Generator

OpenSSL can be used to create a password.
For this use the following command.
It will create a hexadecimal password with 32 characters.

```ssh
openssl rand -hex 32
```
