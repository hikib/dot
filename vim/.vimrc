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

""""""""""""""""
"  navigation  "
""""""""""""""""
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

""""""""""""
"  flying  "
""""""""""""
Plug 'tpope/vim-commentary' "gc
Plug 'tpope/vim-surround' "cs or ys
Plug 'tpope/vim-fugitive'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

"""""""""""""""""""""""""""""""""
"  autocomplete / intellisense  "
"""""""""""""""""""""""""""""""""
Plug 'sheerun/vim-polyglot'
if has('nvim')
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
    Plug 'Shougo/deoplete.nvim'
    Plug 'roxma/nvim-yarp'
    Plug 'roxma/vim-hug-neovim-rpc'
endif
Plug 'deoplete-plugins/deoplete-jedi'
Plug 'deoplete-plugins/deoplete-go', { 'do': 'make'}
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'stamblerre/gocode', { 'rtp': 'vim', 'do': '~/.vim/plugged/gocode/vim/symlink.sh' }

"""""""""""""
"  writing  "
"""""""""""""
Plug 'lervag/vimtex'
Plug 'junegunn/goyo.vim'
Plug 'vimwiki/vimwiki'

""""""""""
"  misc  "
""""""""""
Plug 'arcticicestudio/nord-vim'

call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                               Settings                               "
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
set autowrite           " autosave when changing
set hidden              " when switching buffers
set cmdheight=1         " avoid HitEnter prompts
set shortmess=aoOtIF    " avoid HitEnter prompts
set nobackup            " more risky, but cleaner
set noswapfile
set nowritebackup
set nofixendofline      " prevent silent fixing by vim
set incsearch           " highlight search while typing

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
set expandtab " replace tabs with spaces
set softtabstop=2
set textwidth=72
set wildmenu " Better command search
set wildignorecase

"""""""""""""
"  vimwiki  "
"""""""""""""
let g:vimwiki_table_mappings = 0 " UltiSnips <tab>
let g:vimwiki_auto_header = 1
let g:vimwiki_list = [{'path': '~/vimwiki/',
                      \ 'auto_diary_index': 1,
                      \ 'syntax': 'markdown',
                      \ 'ext': '.md'}]

""""""""""""""
"  deoplete  "
""""""""""""""
autocmd CompleteDone * silent! pclose!
let g:deoplete#enable_at_startup = 1

"""""""""""""""
"  ultisnips  "
"""""""""""""""
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsExpandTrigger='<tab>'
let g:UltiSnipsJumpForwardTrigger='<tab>'
let g:UltiSnipsJumpBackwardTrigger='<s-tab>'

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
"                              Functions                               "
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

fun! SearchByPage(url)
  let keyword = expand("<cword>")
  let path = "/mnt/c/Program Files/Mozilla Firefox/"
  exec 'silent !"' . path . 'firefox.exe" ' . a:url . keyword
  exec "redraw!"
endfun

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                             Autocommands                             "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

augroup MY_AUTOCMDS
  autocmd BufNewFile,BufRead *.md set filetype=markdown
  autocmd BufNewFile ~/vimwiki/diary/[0-9]*.md :silent 0r !journaling '%'
  autocmd BufWritePre * :call TrimWhitespace()
  autocmd VimLeavePre *.tex VimtexClean
  autocmd Filetype go setlocal tabstop=4 shiftwidth=4 softtabstop=4
augroup END

augroup REMEMBER_FOLDS
  autocmd!
  autocmd BufWinLeave * mkview
  autocmd BufWinEnter * silent! loadview
augroup END

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                               Mappings                               "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let mapleader = ' '
nnoremap <F1> :call ExecuteVimCommand()<CR>
nnoremap <F2> :Goyo<CR>

" Stay in visual mode
vmap < <gv
vmap > >gv

" Searching the web
nmap <leader>d :call SearchByPage("http:/duckduckgo.com/?q=")<CR>
nmap <leader>y :call SearchByPage("https://www.youtube.com/results?search_query=")<CR>
nmap <leader>o :call SearchByPage("https://ordnet.dk/ddo/ordbog?query=")<CR>
nmap <leader>k :call SearchByPage("https://ordnet.dk/korpusdk/quick_search?SearchableText=")<CR>
nmap <leader>t :call SearchByPage("https://de.langenscheidt.com/daenisch-deutsch/")<CR>

" Better page down and page up
noremap <C-j> <C-d>
noremap <C-k> <C-b>

" fzf
nnoremap <C-f> :Files<Cr>
nnoremap <C-g> :GFiles<Cr>
nnoremap <C-b> :Buffers<CR>
nnoremap <C-l> :Lines<CR>

" Yanking
map Y y$
" note: following not on WSL bash
" nnoremap <Leader>y "+y
" vnoremap <Leader>y "+y
" nnoremap <Leader>Y gg"+yG

" Autocorrect spelling if spell is on
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u

