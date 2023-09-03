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
openssl rand -hex -out secret.key 32
```

This command will generate random 32 hex data and store it in a file named secret.key bt aid of the -out flag.

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
openssl aes-256-cbc -in text.txt -out text.enc -e -kfile secret.key```
````

-kfile flag is used to point to the key to use for encryption.

## Decryption using openssl

```bash
openssl aes-256-cbc -in text.enc -out text.dec -d -kfile secret.key
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

### password based key derivation format [pbkdf2](https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=&ved=2ahUKEwi5q9DF4Y6BAxVf0gIHHWqjBBwQFnoECBUQAw&url=https%3A%2F%2Fen.wikipedia.org%2Fwiki%2FPBKDF2&usg=AOvVaw2yv-GNF51TlFrBvXvvQUxl&opi=89978449)

This command spits out zero errors because pbkdf2 more stiff security while doing the encryption

````bash
openssl aes-256-cbc -in text.txt -out text.enc -e -a -kfile secret.key -pbkdf2```
````

Decrypt text.enc to text.dec

````bash
openssl aes-256-cbc -in text.enc -out text.dec -d -a -kfile secrets.key -pbkdf2```
````

PBKDF2 applies a hash function multiple times to increase the computational effort required to derive the key. The number of iterations (also called the "work factor") is a parameter that determines the computational cost and security level. More iterations make it harder for attackers to perform brute-force or dictionary attacks.
By Default, pbkdf2 iterations are numbered to 100,000 but we can enter the number of iterations that we would like to happen in the process by using the ** -iter ** flag.

```bash
openssl aes-256-cbc -in text.txt -out text.enc -e -a -kfile secret.key -pbkdf2 -iter 1000
```

The same number of iterations used to encrypt should be used for in the inverse process otherwise the result is an error

```bash
openssl aes-256-cbc -in text.enc -out text.dec -d -a -kfile secrets.key -pbkdf2 1000
```

## Asymetric Encryption

Here is how to use the rsa key pair to do encryption and decryption.

```bash
openssl pkeyutl -encrypt -inkey key.pub -pubin -in text.txt -out text.enc
```

The [pkeyutl](https://www.openssl.org/docs/man1.1.1/man1/openssl-pkeyutl.html) command can be used to perform low-level public key operations using any supported algorithm.
It is the recommended replacement for various public key operations, including encryption and decryption, in OpenSSL 3.0 and later versions.

```bash
openssl pkeyutl -decrypt -inkey key.pri in text.enc -out text.dec
```
