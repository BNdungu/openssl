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

## Available algorithms supported by openssl

```bash
openssl list -commands
```

list public key algorithms

```bash
openssl list -public-key-algorithms
```

See supported encryption algorithms by openssl

```bash
openssl enc -ciphers
```

Get more info about usae of an algorithm

```bash
openssl list -options aes-256-cbc
```

## Encrypt a file using openssl (aes-256-cbc algorithm)

````bash
openssl aes-256-cbc -in text.txt -out text.enc -e -kfile encryption.key```
````

-kfile flag is used to point to the key to use for encryption.

## Decryption using openssl

```bash
openssl aes-256-cbc -in text.enc -out text.dec -d -kfile encryption.key
```

### Encrypt a file on -des-ede3-cbc and a key-in password

_-a flag is used to encrypt to base 64_

failure to include the -kflag in the command prompts for a password which in place is used to derive an encryption key.

```bash
openssl des-ede3-cbc -in text.txt -out text.enc -e -a
```

Decrypt the file using the password

````bash
openssl des-ede3-cbc -in text.dec -out tetx.enc -d -a```
````
