#!/usr/bin/env bash

THISDIR=$(dirname $(readlink -f "$0"))
ln -svf "${THISDIR}/vimrc" "${HOME}/.vimrc"

mkdir -p "${HOME}/.vim"
DOTFILES=(
  after
  colors
  ftdetect.vim
  ftplugin
  functions.vim
  mappings.vim
  spell
)
for DOTFILE in "${DOTFILES[@]}"; do
  ln -svf "${THISDIR}/vim/${DOTFILE}" "${HOME}/.vim/${DOTFILE}"
done

# installing all plugins
curl -fLo "${HOME}/.vim/autoload/plug.vim" --create-dirs \
  "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
vim +PlugInstall +qall &>/dev/null
vim +'CocInstall -sync coc-sh coc-json coc-markdownlint coc-pyright' +qall &>/dev/null
vim +'CocUpdateSyn' +qall &>/dev/null
