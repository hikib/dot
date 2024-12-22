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

nvim --headless -c "TSUpdate" "MasonUpdate" +qa
nvim --headless "+Lazy! sync" +qa
nvim SOMETMPFILE --headless -c "MasonInstall \
	bash-language-server \
	lua-language-server \
	marksman \
	powershell-editor-services \
	python-lsp-server \
	shfmt \
	gopls \
	yaml-language-server \
	" \
    "PylspInstall python-lsp-black" +qa
