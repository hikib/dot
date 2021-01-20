""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                               plugins                                "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')

" Automatic installation of vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
  echo "Don't forget to :GoInstallBinaries if you're doing Go dev."
endif

""""""""""""
"  flying  "
""""""""""""
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'tpope/vim-commentary'

Plug 'Shougo/deoplete.nvim'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'deoplete-plugins/deoplete-jedi' " python
Plug 'deoplete-plugins/deoplete-go', { 'do': 'make'}

""""""""""""
"  coding  "
""""""""""""
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'stamblerre/gocode', { 'rtp': 'vim', 'do': '~/.vim/plugged/gocode/vim/symlink.sh' }
Plug 'sheerun/vim-polyglot'

"""""""""""""
"  writing  "
"""""""""""""
Plug 'lervag/vimtex'  " TODO: Use pandoc instead
Plug 'vimwiki/vimwiki'

""""""""""
"  misc  "
""""""""""
Plug 'arcticicestudio/nord-vim'

call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                               settings                               "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""
"  general  "
"""""""""""""
syntax on
filetype on
filetype plugin on
filetype indent on
set nonumber
set norelativenumber
set nocompatible
set icon
set showmode
set showmatch
set history=100
set autowrite           " autosave when changing
set hidden              " when switching buffers
set cmdheight=1         " avoid HitEnter prompts
set shortmess=aoOtIF    " avoid HitEnter prompts
set nobackup            " more risky, but cleaner
set noswapfile
set nowritebackup
set ttyfast             " faster scrolling
set nofixendofline      " prevent silent fixing by vim
set incsearch           " highlight search while typing
set hlsearch

""""""""""""""""
"  statusline  "
""""""""""""""""
set noruler
set laststatus=2
set statusline=
set statusline+=%*\ %<%.60F%*                 " path, trunc to 80 length
set statusline+=\ [%{strlen(&ft)?&ft:'none'}] " filetype
set statusline+=%*\ %l:%c%*                   " current line and column
set statusline+=%*\ %p%%%*                    " percentage

""""""""""""
"  spaces  "
""""""""""""
set tabstop=2
set shiftwidth=2
set smarttab
set smartindent
set autoindent
set expandtab       " replace tabs with spaces
set softtabstop=2
set textwidth=72
set wildmenu        " Better command search
set wildignorecase

"""""""""""""
"  vimwiki  "
"""""""""""""
let g:vimwiki_auto_header = 0
let g:vimwiki_listsyms = ' .oOX'
let g:vimwiki_markdown_link_ext = 1
let g:vimwiki_dir_link = 'README'
let g:vimwiki_list = [{'path': '~/vimwiki/',
                      \ 'index': 'README',
                      \ 'diary_index': 'README',
                      \ 'diary_header': 'Journal',
                      \ 'auto_toc': 0,
                      \ 'auto_diary_index': 1,
                      \ 'links_space_char': '-',
                      \ 'syntax': 'markdown',
                      \ 'ext': '.md'}]

""""""""""""""
"  deoplete  "
""""""""""""""
autocmd CompleteDone * silent! pclose!
let g:deoplete#enable_at_startup = 1

""""""""""""
"  colors  "
""""""""""""
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif
colorscheme nord
hi Conceal ctermbg=none

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                        functions & autocommands                      "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

fun! TrimWhitespace()
  let l:save = winsaveview()
  keeppatterns %s/\s\+$//e
  call winrestview(l:save)
endfun

fun ExecuteVimCommand()
  " Executes a command on line
  " eg:
  " :VimwikiSearchTags todo
  let l:Command = getline('.')
  execute l:Command
endfun

augroup MY_AUTOCMDS
  autocmd BufNewFile,BufRead *.md set filetype=markdown
  autocmd BufNewFile,BufRead *.{yaml,yml} set filetype=yaml
  autocmd BufNewFile ~/vimwiki/diary/[0-9]*.md :.!journaling %
  autocmd BufWritePre ~/vimwiki/pipelines/reviews/README.md :1,$d | .!reviews %
  autocmd BufWritePre * :call TrimWhitespace()
  autocmd VimLeavePre *.tex VimtexClean
augroup END

" Vim does not load bash_aliases. This is one workaround.
fun! SearchWeb(page)
  let keyword = expand("<cword>")
  let search = "!searchweb -page=" . a:page . " -config=" . $SEARCHYAML
  exec "silent " . search . " " . keyword
  exec "redraw!"
endfun

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                               mappings                               "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let mapleader = ' '
map <silent> <leader><cr> :noh<cr>:redraw!<cr>
nnoremap <F1> :call ExecuteVimCommand()<CR>

" yank like D or C
map Y y$

" Stay in visual mode
vmap < <gv
vmap > >gv

" Better page down and page up
noremap <C-j> <C-d>
noremap <C-k> <C-b>

noremap <leader>d :call SearchWeb("duck") <CR>
noremap <leader>o :call SearchWeb("ordnet") <CR>
noremap <leader>k :call SearchWeb("korpus") <CR>
noremap <leader>t :call SearchWeb("tysk") <CR>

" fzf
nnoremap <C-f> :Files<CR>
nnoremap <C-g> :GFiles<CR>
nnoremap <C-b> :Buffers<CR>
nnoremap <C-l> :Lines<CR>

