if ls | grep -q "key";then
    rm key* *key
    echo "removed all key files"
else
    echo "no key file was found"
fi

openssl rand -hex -out secret.key 32
openssl genrsa -out key.pri
openssl rsa -in key.pri -pubout -out key.pub
echo "Successfully created the key pair"