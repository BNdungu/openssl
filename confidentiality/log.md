# CONFIDENTIALITY

The process of keeping information confidential is called confidentiallity and this ia achieved through encryption. to do encryption we need keys and openssl is one of the ways to generate those keys

We will start by creating symetric keys also known as secret keys

Using the rand command i openssl we can generate the secret keys

```bash
openssl rand -hex 10
```

The number 10 is used to show how many bytes of data to be generated
The output is 10 bytes of randomly generated data in hex format.

```bash
openssl rand -hex 16
openssl rand -hex 32
```

The two commands are used to create random data in hex at 16 and 32 bit respectively.

```bash
openssl rand -hex -out encryption.key 32
```

This command will generate random 32 hex data and store it in a file named encryption.key bt aid of the -out flag.

## Generating Asymetric keys(RSA)

### Private Keys

Create a rsa key using openssl

```bash
openssl genrsa
```

Mention the key size

```bash
openssl genrsa 1024
```

Output the key into a file

```bash
openssl genrsa > key.pri
```

Mention the key size as well as save in a file

```bash
openssl genrsa -out key.pri 2048
```

Examine the RSA Private Key

```bash
openssl rsa -in key.pri -noout -text
```

_Private keys are used to sign some data or decrypt some data and so we need public keys to do encryption of data_

Generate a public key corresponding to the private key in hand

```bash
openssl rsa -in key.pri -pubout -out key.pub
```
