#! /usr/bin/bash

MAJ="4"
MIN="3"
PATCH="2"
VERSION="$MAJ.$MIN.$PATCH"
FILENAME="blender-$VERSION-linux-x64"

if [ ! -f "./$FILENAME.tar.xz" ]; then
    echo "Downloading tar file..."
    curl -O -L "https://download.blender.org/release/Blender$MAJ.$MIN/$FILENAME.tar.xz"
fi

echo "Verifying SHA..."
BLENDSHA=$(curl -sL "https://download.blender.org/release/Blender$MAJ.$MIN/blender-$VERSION.sha256" | grep "$FILENAME" | cut -d " " -f1)
MYSHA=$(shasum -a 256 "$FILENAME.tar.xz" | cut -d ' ' -f1)
if [ "$MYSHA" != "$BLENDSHA" ]; then
    echo "shasum failed!"
    exit 1
fi
echo "shasum OK"

echo "Unpacking file..."
tar -xf "$FILENAME.tar.xz"

echo "Installing Blender..."
if [ -d /opt/blender ]; then
    echo "Removing existing installs..."
    sudo rm -rf /opt/blender
fi
sudo mv -f "$FILENAME" /opt/blender
if [ -f /usr/local/bin/blender ]; then
    echo "Removing existing symlink..."
    sudo rm /usr/local/bin/blender
fi
sudo ln -s /opt/blender/blender /usr/local/bin/blender

echo "Creating start menu shortcut..."
echo "[Desktop Entry] 
Name=Blender
GenericName=3D Modeler
Comment=3D modeling, animation, rendering and post-production
Exec=/usr/local/bin/blender
Icon=/opt/blender/blender.svg
Terminal=false
Type=Application
Categories=Graphics;3DGraphics;" >"$HOME/.local/share/applications/blender.desktop"

echo "Removing tar file..."
rm "$FILENAME.tar.xz"

echo "Blender installed!"
blender --version | head -n 1
