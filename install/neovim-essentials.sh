#! /usr/bin/bash

if ! which nvim &>/dev/null; then
    echo "install neovim first"
    exit 1
fi

sudo apt install \
    nodejs \
    npm \
    python3 \
    python3-pip

sudo npm install -g yarn

echo "Now clone your dotfiles and run the setup file for uni.nvim"
