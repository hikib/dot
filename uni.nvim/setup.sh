#!/usr/bin/env bash

THISDIR=$(dirname $(readlink -f "$0"))
DOTFILES=(
  init.lua
  lua
)

mkdir -p "${HOME}/.config/nvim"

for DOTFILE in "${DOTFILES[@]}"; do
  ln -svf "${THISDIR}/${DOTFILE}" "${HOME}/.config/nvim/${DOTFILE}"
done

