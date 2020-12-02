""""""""""""
" Plugins
""""""""""""
call plug#begin('~/.vim/plugged')

" Automatic installation of vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Navigation
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
let g:NERDTreeDirArrows = 1
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

" Flying
Plug 'tpope/vim-commentary' "gc
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsExpandTrigger='<tab>'
let g:UltiSnipsJumpForwardTrigger='<c-j>'
let g:UltiSnipsJumpBackwardTrigger='<c-k>'

" Git
Plug 'tpope/vim-fugitive'

" Writing
Plug 'junegunn/goyo.vim'
Plug 'vimwiki/vimwiki'
Plug 'lervag/vimtex'
Plug 'KeitaNakamura/tex-conceal.vim'
set conceallevel=1
hi Conceal ctermbg=none
let g:tex_conceal='abdmg'
Plug 'arcticicestudio/nord-vim'

call plug#end()

""""""""""""
" General
""""""""""""

filetype on
filetype plugin on
filetype indent on
syntax on
set number
set relativenumber
set nocompatible
colorscheme nord

" Spacing
set tabstop=4
set shiftwidth=4
set smarttab
set expandtab
set softtabstop=4
set autoindent

fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

augroup MY_AUTOCMDS
    autocmd BufWritePre * :call TrimWhitespace()
    autocmd BufNewFile *.py,*.pyw,*.c,*.h set fileformat=unix
    autocmd VimEnter *.wiki Goyo
    autocmd VimLeave *.wiki Goyo
augroup END

""""""""""""
" Remapping
""""""""""""

let mapleader = " "
map <C-n> :NERDTreeToggle<CR>
nnoremap <Leader>a :echo "it works"<CR>
"autocmd BufWritePost *.tex VimtexClean


" Switch windows quick
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l
nnoremap <C-H> <C-W>h

" Yanking
nnoremap <Leader>y "+y
vnoremap <Leader>y "+y
nnoremap <Leader>Y gg"+yG

" Autocorrect spelling if spell is on
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u

