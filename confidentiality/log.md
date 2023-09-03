                ### CONFIDENTIALITY

The process of keeping information confidential is called confidentiallity and this ia achieved through encryption.
to do encryption we need keys and openssl is one of the ways to generate those keys

We will start by creating symetric keys also known as secret keys

Using the rand command i openssl we can generate the secret keys

    ## openssl rand -hex 10  ##

    The number 10 is used to show how many bytes of data to be generated
    The output is 10 bytes of randomly generated data in hex format

    ## openssl rand -hex 16

    This one genrates 16 bytes of data in hex format randomly

    ## openssl rand -hex -out encryption.key 32

    This one randomly generates 32 bytes of data and then stares them in a file
