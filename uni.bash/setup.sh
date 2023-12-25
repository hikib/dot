#!/usr/bin/env bash

mkdir -p "$HOME/.config/bash"
THISDIR=$(dirname "$(readlink -f "$0")")
DOTFILES=(
  aliases
  colors
  inputrc
)

ln -svf "${THISDIR}/bashrc" "${HOME}/.bashrc"
ln -svf "${THISDIR}/profile" "${HOME}/.bash_profile"

for DOTFILE in "${DOTFILES[@]}"; do
  ln -svf "${THISDIR}/${DOTFILE}" "${HOME}/.config/bash/${DOTFILE}"
done
