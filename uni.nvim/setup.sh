#!/usr/bin/env bash

THISFILE=$(readlink -f "$0")
THISDIR=$(dirname "$THISFILE")
DOTFILES=(
    init.lua
    lua
)

mkdir -p "${HOME}/.config/nvim"

for DOTFILE in "${DOTFILES[@]}"; do
    ln -svf "${THISDIR}/${DOTFILE}" "${HOME}/.config/nvim/${DOTFILE}"
done

# nvim -c "TSUpdate" "MasonUpdate" +qa
# nvim --headless "+Lazy! sync" +qa
# nvim SOMETMPFILE --headless -c "PylspInstall python-lsp-black" +qa
