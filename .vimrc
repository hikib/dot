filetype on
filetype plugin on
filetype indent on

" Folding
set foldmethod=indent
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf
":nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

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

" NERDTree
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
nnoremap <F4> :NERDTreeToggle<CR>
let g:NERDTreeDirArrows = 1
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

" Snippets
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'

" Git
Plug 'tpope/vim-fugitive'

" LaTex
Plug 'lervag/vimtex'
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
Plug 'KeitaNakamura/tex-conceal.vim'

Plug 'ycm-core/YouCompleteMe'

call plug#end()

