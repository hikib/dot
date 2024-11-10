#!/usr/bin/env sh

THISDIR="$(dirname "$(readlink -f "$0")")"
mkdir -p "$HOME/.w3m"
ln -svf "$THISDIR/bookmark.html" "$HOME/.w3m/bookmark.html"
ln -svf "$THISDIR/config" "$HOME/.w3m/config"
ln -svf "$THISDIR/keymap" "$HOME/.w3m/keymap"
