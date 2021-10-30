let mapleader = ' '
nnoremap <silent> <leader><CR> :noh<CR>:redraw!<CR>
map <F8> <Esc>:setlocal spell spelllang=de<CR>
map <F9> <Esc>:setlocal spell spelllang=en_gb<CR>
map <F10> <Esc>:setlocal spell spelllang=da<CR>
map <F11> <Esc>:setlocal nospell<CR>

" undo breakpoints
inoremap , ,<C-g>u
inoremap . .<C-g>u
inoremap ! !<C-g>u
inoremap ? ?<C-g>u
inoremap * <C-g>u*

" cursor positioning
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ'z

" yank like D or C
nnoremap Y yg_

" stay in visual mode
vnoremap < <gv
vnoremap > >gv

" better page down and page up
nnoremap <C-j> <C-d>
nnoremap <C-k> <C-b>

" Snip() & PasteSnip() depend on Vim 8.2+
" because of popup (!). See in functions.vim
nnoremap <leader>s :call Snip()<CR>

" moving lines
vnoremap K :m '<-2<CR>gv=gv
vnoremap J :m '>+1<CR>gv=gv
nnoremap <leader>k :m .-2<CR>==
nnoremap <leader>j :m .+1<CR>==
