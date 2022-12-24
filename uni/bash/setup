#!/usr/bin/env bash

THISDIR=$(dirname $(readlink -f "$0"))
DOTFILES=(
  bash_aliases
  bash_profile
  bashrc
  dir_colors
  inputrc
)

for DOTFILE in "${DOTFILES[@]}"; do
  ln -svf "${THISDIR}/${DOTFILE}" "${HOME}/.${DOTFILE}"
done
