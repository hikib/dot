#! /bin/bash

if [ -z "$1" ]; then
    echo "Error: requires your email as an arg."
    echo "\$ ./setup-github.sh mymail@mail.com"
    exit 1
fi

ssh-keygen -t rsa -b 4096 -C "$1"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa

echo "copy your pub key:"
echo
cat ~/.ssh/id_rsa.pub
echo
echo "Go to GitHub SSH and GPG keys settings and click 'New SSH key'."
echo "Paste your key and give it a title, then save it."
