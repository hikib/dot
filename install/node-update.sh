#! /usr/bin/bash

if ! which nvim &>/dev/null; then
    echo "install neovim first"
    exit 1
fi

curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash .
sudo apt-get install -y nodejs
echo "nodejs installed successfully"
node -v

