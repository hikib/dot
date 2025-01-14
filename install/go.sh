#!/usr/bin/env bash

echo "Removing existing installs..."
[ -d "$HOME/.local/go" ] && rm -rf "$HOME/.local/go"

echo "Downloading tar file..."
VERSION=$(curl -sSL "https://go.dev/VERSION?m=text" | head -n 1)
FILENAME="${VERSION}.linux-amd64.tar.gz"
curl -O -L "https://go.dev/dl/$FILENAME"

echo "Verifying SHA..."
GOSHA=$(curl -sL https://golang.org/dl/ | grep -A 5 -w "$FILENAME" | tail -n 1 | sed 's/.*<tt>\|<\/tt>.*//g')
MYSHA=$(shasum -a 256 "$FILENAME"| cut -d' ' -f1)
[ "$MYSHA" != "$GOSHA" ] && echo "SHA-sum failed!" && exit 1
echo "SHA-sum OK!"

echo "Installing Go..."
tar -C "$HOME/.local/" -xzf "$FILENAME"
echo "Removing tar file" 
rm "$FILENAME"

echo "Go installed!" 
"$HOME/.local/go/bin/go" version
echo "Go installed!" 
